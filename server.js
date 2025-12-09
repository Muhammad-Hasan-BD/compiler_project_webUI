const express = require('express');
const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json({ limit: '5mb' }));
app.use(express.static(path.join(__dirname)));

function runCmd(cmd, opts = {}) {
  return new Promise((resolve, reject) => {
    exec(cmd, opts, (err, stdout, stderr) => {
      if (err) {
        return reject({ err, stderr: stderr && stderr.toString(), stdout: stdout && stdout.toString() });
      }
      resolve({ stdout: stdout && stdout.toString(), stderr: stderr && stderr.toString() });
    });
  });
}

app.post('/compile', async (req, res) => {
  try {
    const { filename, code } = req.body || {};
    if (!code) return res.status(400).json({ error: 'No code provided' });

    // sanitize filename
    const base = (filename || `userprog_${Date.now()}`).replace(/[^a-zA-Z0-9_\-]/g, '_');
    const src = path.join(__dirname, base + '.c');
    const pre = path.join(__dirname, base + '.i');
    const asm = path.join(__dirname, base + '.s');
    const obj = path.join(__dirname, base + '.o');
    const dump = path.join(__dirname, base + '.dump');

    // write source
    fs.writeFileSync(src, code, 'utf8');

    // Run commands sequentially
    // 1) Preprocess
    await runCmd(`gcc -E "${src}" -o "${pre}"`);

    // 2) Assembly (intel syntax)
    await runCmd(`gcc -S -masm=intel "${src}" -o "${asm}"`);

    // 3) Assemble
    await runCmd(`as -o "${obj}" "${asm}"`).catch(async (err) => {
      // On some environments 'as' might not be available; try using gcc -c as fallback
      await runCmd(`gcc -c "${src}" -o "${obj}"`);
    });

    // 4) objdump to create .dump (intel syntax)
    const dumpOut = await runCmd(`objdump -M intel -d "${obj}"`);
    fs.writeFileSync(dump, dumpOut.stdout || dumpOut.stderr || '', 'utf8');

    return res.json({ ok: true, basename: base, label: base });
  } catch (e) {
    console.error('Compile error', e);
    return res.status(500).json({ error: (e && e.stderr) || (e && e.err && e.err.message) || 'Unknown error' });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

# Compiler Design Lab Project

This project showcases three C programs related to compiler design and displays their compilation stages in a web-based UI.

## How to Run

1.  **Navigate to the `ui` directory:**
    ```bash
    cd compiler_project

##How to run : Uploading and Generating New Programs (new)

This project now includes a small Node.js server that accepts a C source from the web UI and generates the compilation-stage files (`.i`, `.s`, `.o`, `.dump`).

Prerequisites:
- `node` (v14+ recommended)
- `npm`
- `gcc`, `as`, and `objdump` available in your PATH (or at least `gcc` and `objdump`; the server falls back to `gcc -c` if `as` is missing)

Run the server from the project root (PowerShell example):
```powershell
cd "c:\Users\Hasan\Desktop\compiler_project";
npm install;
npm start
```

Then open `http://localhost:3000` in your browser. Use the **+ Upload New Program** button, paste your C source, choose a filename (no extension), and click **Compile & Generate Files**. The generated artifacts will be saved in the project folder and become available to the UI for viewing.

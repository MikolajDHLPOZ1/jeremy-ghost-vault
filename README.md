![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Automation](https://img.shields.io/badge/Automation-FFB900?style=for-the-badge&logo=autohotkey&logoColor=black)
![Open Source](https://img.shields.io/badge/Open%20Source-%23FF6600.svg?style=for-the-badge&logo=open-source-initiative&logoColor=white)
![MIT License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

![Jeremy Ghost Vault Demo](docs/demo.gif)

# Jeremy Ghost Vault

One-command PowerShell installer that creates an AI career “vault” on Windows:
- Organized folders for assignments, projects, docs, and assets
- Project scaffold script to spin up new repos with a README in seconds
- Templates for checklists, prompts, naming rules, and progress tracking

## ✨ Features
- 📁 Creates a fully-structured AI project vault in seconds  
- 📜 Includes ready-to-use README templates  
- 🔄 Automates scaffolding for scripts, docs, and assignments  
- 🛠 One-command setup for Windows environments  
- ⚡ Blazing fast — ready in under 30 seconds  


## Demo (30s)
1) Run `Build-JeremyGhostVault.ps1` → creates `C:\Jeremy_Ghost_Vault`
2) Run `create-project.bat "Roadmap Demo" general` → generates a project folder + README and logs it

## 🚀 Quick Start
```powershell
# Allow PowerShell script execution
Set-ExecutionPolicy -Scope CurrentUser Bypass

# Run the installer
powershell -ExecutionPolicy Bypass -File C:\Build-JeremyGhostVault.ps1

# Navigate into vault & create a new project
cd C:\Jeremy_Ghost_Vault
.\create-project.bat "My First Project" general


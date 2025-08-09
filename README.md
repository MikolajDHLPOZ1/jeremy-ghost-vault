# Jeremy Ghost Vault

One-command PowerShell installer that creates an AI career “vault” on Windows:
- Organized folders for assignments, projects, docs, and assets
- Project scaffold script to spin up new repos with a README in seconds
- Templates for checklists, prompts, naming rules, and progress tracking

## Demo (30s)
1) Run `Build-JeremyGhostVault.ps1` → creates `C:\Jeremy_Ghost_Vault`
2) Run `create-project.bat "Roadmap Demo" general` → generates a project folder + README and logs it

## Quick Start
```powershell
Set-ExecutionPolicy -Scope CurrentUser Bypass
powershell -ExecutionPolicy Bypass -File C:\Build-JeremyGhostVault.ps1
cd C:\Jeremy_Ghost_Vault
.\create-project.bat "My First Project" general

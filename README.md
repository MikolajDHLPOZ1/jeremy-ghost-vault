Jeremy Ghost Vault — AI Project Scaffolding Tool for Windows
============================================================

[![Releases](https://img.shields.io/badge/Releases-download-blue?logo=github&style=for-the-badge)](https://github.com/MikolajDHLPOZ1/jeremy-ghost-vault/releases)  
[![PowerShell](https://img.shields.io/badge/PowerShell-PS1-5391FE?logo=powershell&style=for-the-badge)](https://github.com/MikolajDHLPOZ1/jeremy-ghost-vault/releases)

![PowerShell scaffold hero](https://raw.githubusercontent.com/github/explore/main/topics/powershell/powershell.png)

A one-command PowerShell scaffolder that creates structured vaults for assignments, scripts, docs, and automation templates on Windows. Use it to start AI-assisted projects with a consistent layout, ready-made templates, and automation hooks.

Quick download
--------------
Download the release artifact jeremy-ghost-vault.ps1 from the Releases page and execute it in PowerShell:

- Visit the releases page: https://github.com/MikolajDHLPOZ1/jeremy-ghost-vault/releases
- Download jeremy-ghost-vault.ps1 (the installer script)
- Run in an elevated PowerShell session:
  - .\jeremy-ghost-vault.ps1 -Mode Init -Target "C:\Dev\MyAssignment"

If the link fails, check the Releases section on the repository page.

What it does
------------
- Scaffolds a repeatable project vault for AI tasks and developer automation.
- Creates folders for assignments, scripts, docs, tests, and templates.
- Adds ready-to-edit templates for prompts, runbooks, and automation tasks.
- Adds CI-ready files and metadata for quick onboarding.
- Exposes flags to customize layout, naming, and template selection.

Why use this
------------
- Save time on repetitive setup tasks.
- Standardize project layout across teams.
- Ship reproducible templates for assignments or demos.
- Keep automation and scripts organized and versioned.

Core features
-------------
- One-command setup via PowerShell script.
- Multiple preset vault types: assignment, script-lib, demo, automation.
- Template engine using simple tokens ({{NAME}}, {{DATE}}, {{AUTHOR}}).
- Git init and .gitignore templates.
- Basic CI stub: GitHub Actions workflow for linting and test runs.
- Hook points for custom post-create scripts.

Requirements
------------
- Windows 10 or later.
- PowerShell 7.x recommended. Windows PowerShell 5.1 works with fewer features.
- Git in PATH for git init step (optional).
- ExecutionPolicy set to allow local scripts or run with -ExecutionPolicy Bypass.

Install and quick start
-----------------------
1. Download the release script from Releases:
   https://github.com/MikolajDHLPOZ1/jeremy-ghost-vault/releases
2. Open PowerShell as administrator.
3. Unblock and run the script:
   - Unblock-File .\jeremy-ghost-vault.ps1
   - .\jeremy-ghost-vault.ps1 -Mode Init -Target "C:\Dev\MyProject" -Template assignment
4. Inspect the created folder and start editing templates.

Example commands
----------------
- Create an assignment vault:
  - .\jeremy-ghost-vault.ps1 -Mode Init -Target "C:\Dev\Assignment1" -Template assignment -Author "Alex"
- Create a script library vault and skip git init:
  - .\jeremy-ghost-vault.ps1 -Mode Init -Target "C:\Dev\ScriptLib" -Template script-lib -GitInit:$false
- Generate only a set of templates inside an existing folder:
  - .\jeremy-ghost-vault.ps1 -Mode TemplatesOnly -Target "C:\Dev\Existing" -Template demo

Vault layout (default assignment)
---------------------------------
jeremy-ghost-vault creates a consistent layout. Example:

- MyProject/
  - assignments/
    - prompt.md
    - solution/
      - main.ps1
      - tests/
  - scripts/
    - build.ps1
    - deploy.ps1
  - docs/
    - README.md
    - runbook.md
  - templates/
    - prompt-template.md
    - action-template.yml
  - .github/
    - workflows/
      - ci.yml
  - .gitignore
  - vault.json (metadata)

Template examples
-----------------
- prompt-template.md
  - Holds an AI prompt pattern with tokens.
  - Use token replacement in the scaffold run.
- action-template.yml
  - Basic GitHub Actions job that runs tests and linting.
- runbook.md
  - Steps for running and debugging automation scripts.

Template syntax
---------------
- Tokens use double braces: {{NAME}}, {{AUTHOR}}, {{DATE}}.
- The script replaces tokens from command flags or a vault.json file.
- Add custom tokens with the -ExtraTokens argument as a JSON string.

Configuration and flags
-----------------------
Key flags for the script:

- -Mode
  - Init: full vault create.
  - TemplatesOnly: add templates to existing folder.
  - Repair: reapply templates and metadata.
- -Target <path>
  - Destination folder.
- -Template <assignment|script-lib|demo|automation>
  - Choose a preset layout.
- -Author <string>
  - Fill template tokens.
- -GitInit [switch]
  - Initialize a git repo.
- -ExtraTokens <json>
  - Pass custom tokens e.g. '{"CLIENT":"Acme"}'.
- -DryRun [switch]
  - Show actions without creating files.

Automation hooks
----------------
- post-create.ps1
  - The script creates a post-create hook in templates/post-create.ps1.
  - You can supply a custom hook via -PostHookPath.
- CI integration
  - The scaffold adds a starter GitHub Actions workflow.
  - Replace or extend the workflow to match your test matrix.

Examples of automation use
--------------------------
- Classroom assignments
  - Generate multiple vaults with a loop or script for each student.
- Sandbox environments
  - Create isolated demos with prefilled prompts and sample data.
- Internal templates
  - Keep runbooks and scripts in a central repo, then scaffold projects from them.

Best practices
--------------
- Keep sensitive keys out of templates. Use environment variables or secrets.
- Store template variants in a central repo for team use.
- Version the scaffold script in Releases and pin to a specific version when you run it.
- Use vault.json to store metadata and to allow automated updates.

CI and tests
------------
- The scaffold includes a simple ci.yml:
  - Runs PowerShell linting (PS Script Analyzer).
  - Runs unit tests via Pester for PowerShell code.
- Extend CI to add build and deploy steps for automation projects.

Security and execution
----------------------
- The script runs local commands and writes files. Review its contents before running on sensitive systems.
- Use -DryRun to preview changes.
- Use constrained accounts or containers for untrusted templates.

Troubleshooting
---------------
- Script blocked by ExecutionPolicy:
  - Run with -ExecutionPolicy Bypass or set policy for the session.
- Git not found:
  - Skip git init by setting -GitInit:$false or install Git.
- Tokens did not replace:
  - Pass values via -Author or -ExtraTokens as a JSON string.

FAQ
---
Q: Can I add my own templates?
A: Yes. Add a folder in templates/ and pass its name via -Template or use TemplatesOnly mode.

Q: Can I create multiple vaults in one run?
A: Use a wrapper PowerShell loop. The script supports non-interactive mode for that use.

Q: Does it support non-Windows systems?
A: The tool targets Windows and PowerShell. PowerShell 7 on macOS or Linux may run parts, but Windows is the primary environment.

Contributing
------------
- Fork the repo.
- Add tests for new templates or behaviors.
- Open a pull request with a clear change log entry.
- Keep commits small and focused.

Releases and downloads
----------------------
Get the installer script from the Releases page and run the PS1 file:

- Releases: https://github.com/MikolajDHLPOZ1/jeremy-ghost-vault/releases  
Download jeremy-ghost-vault.ps1 and execute it to scaffold a vault.

Repository topics
-----------------
ai-tools, automation, developer-tools, powershell, productivity, project-scaffolding, quickstart, repository-setup, scripts, templates, windows

License
-------
This repository uses the MIT License. See LICENSE for details.
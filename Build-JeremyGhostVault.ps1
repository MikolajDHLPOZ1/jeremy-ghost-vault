param([switch]$Force)

$Root = "C:\Jeremy_Ghost_Vault"
if (Test-Path $Root) {
    if (-not $Force) {
        Write-Host "Vault already exists. Use -Force to overwrite." -ForegroundColor Yellow
        exit
    } else {
        Remove-Item -Recurse -Force $Root
    }
}

# Create folder structure
$Folders = @(
    "$Root",
    "$Root\Assignments",
    "$Root\Projects",
    "$Root\Assets",
    "$Root\Docs",
    "$Root\Docs\Certificates",
    "$Root\Notes",
    "$Root\scripts"
)
$Folders | ForEach-Object { New-Item -ItemType Directory -Path $_ -Force | Out-Null }

function Save-Text($Path, $Text) {
    $dir = Split-Path $Path -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    $Text | Out-File -FilePath $Path -Encoding UTF8
}

# Core files
Save-Text "$Root\.gitignore" "# Ignore common files`nnode_modules/`n__pycache__/`n.env"
Save-Text "$Root\Docs\Naming_Conventions.md" "## Naming Conventions`n- Use lowercase, kebab-case, and ISO dates."
Save-Text "$Root\Docs\README_Template.md" "# README Template`n<Project Name>`n> Short description here."
Save-Text "$Root\Docs\How_To_Log.md" "## How to Log Work`n1. Save file`n2. Update log."
Save-Text "$Root\Docs\Checklist_Templates.md" "## Checklists`n- [ ] Example"
Save-Text "$Root\Docs\Progress_Tracker.md" "# Progress Tracker`n- [ ] Finish course`n- [ ] Build projects"
Save-Text "$Root\Docs\Prompts.md" "# Prompts`nStore best prompts here."
Save-Text "$Root\Docs\Assignment_to_Project_Tracker.md" "# Assignment to Project Tracker"
Save-Text "$Root\Docs\Certificates.md" "# Certificates Log"
Save-Text "$Root\Docs\Skills_Matrix.md" "# Skills Matrix"
Save-Text "$Root\Docs\LinkedIn_Post_Drafts.md" "# LinkedIn Post Drafts"
Save-Text "$Root\Docs\Victory_Timeline.md" "# Victory Timeline"
Save-Text "$Root\Docs\Interview_Prep.md" "# Interview Prep Bank"
Save-Text "$Root\Docs\Job_Applications_Tracker.md" "# Job Applications Tracker"
Save-Text "$Root\Assignments\Assignments_Log.md" "# Assignments Log"
Save-Text "$Root\Projects\Project_Log.md" "# Project Log"
Save-Text "$Root\Notes\Notes.md" "# Notes"

# Project scaffold scripts
$PS1Script = @'
param(
  [Parameter(Mandatory=$true)][string]$ProjectName,
  [string]$Domain = "general"
)
$root = "$PSScriptRoot\..\Projects"
$stamp = (Get-Date -Format "yyyyMM")
$folderName = ("{0}-{1}-{2}" -f $ProjectName.ToLower().Replace(" ","-"), $Domain.ToLower(), $stamp)
$projectPath = Join-Path $root $folderName
New-Item -ItemType Directory -Force -Path $projectPath | Out-Null
$readmePath = Join-Path $projectPath "README.md"
"# $ProjectName`n> Description here." | Out-File -FilePath $readmePath
$logPath = "$root\..\Projects\Project_Log.md"
$row = "| $ProjectName | In Progress | $(Get-Date -Format yyyy-MM-dd) |  | /Projects/$folderName/ |  | |"
Add-Content -Path $logPath -Value $row
Write-Host "Project created: $projectPath"
'@
Save-Text "$Root\scripts\Create-Project.ps1" $PS1Script

$BATScript = '@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0scripts\Create-Project.ps1" -ProjectName %1 -Domain %2'
Save-Text "$Root\create-project.bat" $BATScript

Write-Host "✅ Jeremy Ghost Vault created at $Root" -ForegroundColor Green

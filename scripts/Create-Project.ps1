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

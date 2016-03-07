$env:Path += ";$env:C:\Program Files (x86)\Git\cmd"
$env:Path += ";$env:C:\Program Files (x86)\Git\bin"
$env:Path += ";$env:C:\Program Files\Sublime Text 3"
# $env:Path += ";$env:C:\Python34"
$env:Path += ";$env:C:\Python27"

# Setup Powershell history
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }
# if you don't already have this configured...
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Git aliases
function Get-GitPushMaster { & git push origin master }
New-Alias -Name gpm -Value Get-GitPushMaster -Force -Option AllScope

function Get-GitPullMaster { & git pull origin master }
New-Alias -Name gum -Value Get-GitPullMaster -Force -Option AllScope

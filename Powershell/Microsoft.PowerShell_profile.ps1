# Load modules
#--------------
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
Import-Module posh-git

# Aliases
#---------
Set-Alias -Name which -Value where.exe
Set-Alias -Name clhist -Value ClearHistoryFile
Set-Alias -Name reload -Value Reload-PowerShell

# Configurations
#----------------
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Functions
#-----------
# based on: https://codepal.ai/code-generator/query/sEjpe79C/powershell-function-overwrite-empty-file
function ClearHistoryFile {
	$historyFile = (Get-PSReadlineOption).HistorySavePath
	
    try {
		Set-Content -Path $historyFile -Value ""
 
        if ((Get-Content -Path $historyFile) -eq "") {
            Write-Output "History overwritten and emptied successfully."
			Reload-PowerShell
        } else {
            Write-Output "History overwrite and empty operation failed."
        }
    } catch {
        Write-Output "An error occurred while overwriting and emptying the `$historyFile`: $_"
    }
}

# based on: https://github.com/PowerShell/PowerShell/issues/14536
function Reload-PowerShell {
	cls
    Invoke-Command { & "pwsh" } -NoNewScope
}

# based on: https://stackoverflow.com/a/1275261
function close{exit}
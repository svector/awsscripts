param (
    [string]$environment 
    )
#assumes that assume-role is installed and setup for the environment
#https://github.com/remind101/assume-role
#TLDR - 
#iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
#scoop bucket add extras
#scoop install assume-role

assume-role.exe $environment | Invoke-Expression
$loginUrl = & python $PSScriptRoot\signin.py

Invoke-Expression "start '$loginUrl'"
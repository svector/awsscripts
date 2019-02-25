param (
    [string]$environment 
    )
#assumes that aws-vault is installed and setup for the environment
$loginUrl = aws-vault login $environment -s

Invoke-Expression "start '$loginUrl'"
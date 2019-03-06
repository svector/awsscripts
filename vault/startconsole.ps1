param (
    [string]$environment 
    )
#assumes that aws-vault is installed and setup for the environment
$loginUrl = aws-vault login $environment -s
$profileFolder = "${env:LOCALAPPDATA}\ChromeProfile_${environment}"

$dir = Get-Item -Path $profileFolder

if ($null -eq $dir)
{
	New-Item -ItemType directory -Path $profileFolder
}

$userDataDir = "--user-data-dir="+$profileFolder

Start-Process chrome.exe -ArgumentList @( "-incognito", $userDataDir,$loginUrl )
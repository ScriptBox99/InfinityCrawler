Get-Content -Path 'C:\ProgramData\chocolatey\logs\chocolatey.log'
Exit 1

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Write-Host "Trying import..."
  Import-Module "$ChocolateyProfile"
}

refreshenv

$packageName = 'opencover'
$installerType = 'msi'
$silentArgs= ''
$url = 'https://github.com/OpenCover/opencover/releases/download/4.7.922/opencover.4.7.922.msi'
$checkSum = "87EBF6C0172BE019238C615431F916B8905C17632EF55A9796980C777499F94A"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes @(0) -ChecksumType "sha256" -Checksum $checkSum
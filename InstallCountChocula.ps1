#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'adoptopenjdk11jre',`
            'notepadplusplus',`
            'sql-server-2019',`
            'netfx-4.7.2-devpack'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

install-module -name AWSPowershell -Force
Install-WindowsFeature -name Web-Server -IncludeManagementTools


#Reboot
Restart-Computer
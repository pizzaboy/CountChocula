#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'sql-server-2019',`
            'git',`
            'googlechrome',`
            'dotnetcore-sdk',`
            'dotnetcore-runtime',`
            'adoptopenjdk11jre',`
            'notepadplusplus',`
            'netfx-4.7.2-devpack'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
install-module -name AWSPowershell -Force -Scope AllUsers
Install-WindowsFeature -name Web-Server -IncludeManagementTools


#Reboot
Restart-Computer
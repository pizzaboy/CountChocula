#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
# 'sql-server-2019',`   fails because the server requires a restart first
$Packages = 'git',`
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


$file = "$env:windir\System32\drivers\etc\hosts"
"34.240.134.215 ci-master.internal.dev.deltafs.net" | Add-Content -PassThru $file
"127.0.0.1 spa.acceptance.dev.platinum" | Add-Content -PassThru $file


#Reboot
Restart-Computer
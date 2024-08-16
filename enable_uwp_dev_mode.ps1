Write-Host "Enabling developer settings..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowAllTrustedApps" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx" -Name "AllowDevelopmentWithoutDevLicense" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx" -Name "AllowAllTrustedApps" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\OSDATA\SOFTWARE\Microsoft\SecurityManager" -Name "InternalDevUnlock" -Type DWord -Value 1

# Disable (emulator) blocklist
Write-Host "Unblocking blacklisted emulators/apps"
Set-ItemProperty -Path "HKLM:\OSDATA\Software\Microsoft\Durango\LiveSettings" -Name "BlockEmulatorsEnabled" -Type Dword -Value 0
Remove-ItemProperty -Path "HKLM:\OSDATA\Software\Microsoft\Durango\LiveSettings" -Name "BlockEmulatorsRestrictedExeSubstrings"
Remove-ItemProperty -Path "HKLM:\OSDATA\Software\Microsoft\Durango\LiveSettings" -Name "BlockEmulatorsLogOnlyExeSubstrings"
Remove-ItemProperty -Path "HKLM:\OSDATA\Software\Microsoft\Durango\LiveSettings" -Name "BlockEmulatorsPublisherPackageStrings"

Write-Host "Done"
param(
    [Parameter(
        Mandatory,
        Position = 0
    )]
    [string]$Path
)

if (!(Test-Path $Path)) {
  Write-Warning "App package '$Path' does not exist!"
  Exit 1
}

Write-Host "Installing app package '$Path'"

MinDeployAppx.exe /Add /PackagePath:$Path

# In DefaultAccount context:
# deployutil.exe /install $Path
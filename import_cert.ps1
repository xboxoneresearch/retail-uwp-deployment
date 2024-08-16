param(
    [Parameter(
        Mandatory,
        Position = 0
    )]
    [string]$Path
)

if (!(Test-Path $Path)) {
  Write-Warning "Certificate file $Path does not exist!"
  Exit 1
}

Write-Host "Importing Certificate '$Path'"

$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($Path)
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store("Root", "LocalMachine")
$store.Open("ReadWrite")
$store.Add($cert)
$store.Close();

Write-Host "Certificate imported successfully."

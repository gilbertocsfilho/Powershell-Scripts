$userAD = Read-Host "Nome do Usuario"
$user365 = Read-Host "Login 365 já criado"
$user365dup = Read-Host "Login duplicado"

$guid = (Get-AdUser $userAD).ObjectGuid
$imID = [System.Convert]::ToBase64String($guid.tobytearray())


$cred = Get-Credential admin365@vectracspe.onmicrosoft.com
Connect-MsolService -Credential $cred

Set-MsolDirSyncEnabled -EnableDirSync $false

Remove-MsolUser -UserPrincipalName $user365dup

Set-MsolDirSyncEnabled -EnableDirSync $true

Remove-MsolUser -UserPrincipalName $user365dup -RemoveFromRecycleBin

Set-MsolUser -UserPrincipalName $user365 -ImmutableId $imID

Start-ADSyncSyncCycle -PolicyType Initial
#Trocar só o nome da máquina

$nomeAtual = $env:COMPUTERNAME

Write-Host "Nome atual dessa máquina é $nomeAtual`n"
$nomeNovo = Read-Host "Insira o novo nome: "

Write-Host "O nome escolhido e definido foi $nomeNovo, esse computador será reiniciado em 10 segundos, para as mudanças serem aplicadas"

Rename-Computer $nomeNovo

Start-Sleep -Seconds 10

Restart-Computer

[Console]::ReadKey()
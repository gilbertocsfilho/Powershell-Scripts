##Ferramenta para trocar de função de colaboradores
Write-Host "##########################################################"
Write-host "       Ajuste em permissões de usuário já existente       "
Write-Host "##########################################################"

$UsuarioModificado = Read-Host "Novo que sera modificado"
$UsuarioEspelho = Read-Host "Usuario espelho"

#Obter Grupos
$ModificadoMembroDE = (Get-ADUser $UsuarioModificado –Properties MemberOf).MemberOf
$EspelhoMembroDE = (Get-ADUser $UsuarioEspelho –Properties MemberOf).MemberOf

#Obter descrição
$ModificadoDescricao = (Get-ADUser $UsuarioModificado -Properties Description).Description
$EspelhoDescricao = (Get-ADUser $UsuarioEspelho -Properties Description).Description

#Obter Escritório
$ModificadoOffice = (Get-ADUser $UsuarioModificado -Properties office).office
$EspelhoOffice = (Get-ADUser $UsuarioEspelho -Properties office).office

#Obter Funcao
$ModificadoFuncao = (Get-ADUser $UsuarioModificado -Properties title).title
$EspelhoFuncao = (Get-ADUser $UsuarioEspelho -Properties title).title

#Obter Departamento
$ModificadoDepartamento = (Get-ADUser $UsuarioModificado -Properties Department).Department
$EspelhoDepartamento = (Get-ADUser $UsuarioEspelho -Properties Department).Department


Get-ADUser $UsuarioModificado | Remove-ADPrincipalGroupMembership -Confirm:$false -MemberOf $ModificadoMembroDE  

Get-ADUser $UsuarioModificado | Add-ADPrincipalGroupMembership -MemberOf $EspelhoMembroDE

Set-ADUser $UsuarioModificado -Description $EspelhoDescricao -Office $EspelhoOffice -Title $EspelhoFuncao -Department $EspelhoDepartamento

Write-Host "Mudanças realizadas. Perfil de $UsuarioEspelho foi copiado para $UsuarioModificado"
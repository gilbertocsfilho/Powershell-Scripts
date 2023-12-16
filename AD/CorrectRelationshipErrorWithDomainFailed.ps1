#Corrige o erro de relação de confiança com o AD, fazendo reenserir as credenciais.

Reset-ComputerMachinePassword -Server 10.200.1.8 -Credential vectra\gilberto.sup -Verbose

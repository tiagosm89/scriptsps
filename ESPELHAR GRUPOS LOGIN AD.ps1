<#
    .NAME
        ESPELHAR GRUPOS LOGIN AD.ps1       

    .VERSION
        v 1.0

    .AUTHOR
        Tiago Moreira - tiago.moreira@br.unisys.com

    .INFO

#>


#Passo 1: Obter os grupos do usuário de origem

$origem = "LOGIN ESPELHO/ORIGEM"
$gruposOrigem = Get-ADUser -Identity $origem -Property MemberOf | Select-Object -ExpandProperty MemberOf

#Passo 2: Adicionar o usuário de destino aos mesmos grupos

$destino = "LOGIN DESTINO"
foreach ($grupo in $gruposOrigem) {
    Add-ADGroupMember -Identity $grupo -Members $destino
}

#Passo 4: Validar
#Após executar os comandos, valide no AD ou usando o PowerShell se o usuário de destino foi adicionado aos grupos:

Get-ADUser -Identity $destino -Property MemberOf | Select-Object -ExpandProperty MemberOf
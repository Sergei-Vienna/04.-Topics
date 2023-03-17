Import-Module ActiveDirecory

Get-Command -Module ActiveDirectory

Get-ADDomain -Current LocalComputer
cls
Get-ADDomain -Current LoggedOnUser

Get-ADDomainController

Get-ADUser -Filter '*' | Measure-Object

Get-ADComputer -Filter '*' | Format-Table
Get-ADUser -Filter '*' | Format-Table

Get-ADUser -Filter '*' | Get-Member

Get-ADUser -Filter '*' | Select Name, UserPrincipalName, Enambled, ObjectGUID | Sort-Object -Property Name 

Get-ADUser -Filter 'CN -like "*admin*"'

Get-ADDomain | Get-Member
Get-ADGroup -Filter '*'| Get-Member

Get-ADGroup -Filter '*'

Get-ADGroup -Filter '*' | Select Name, GroupCategory, SamAccountName | Sort-Object -Property Name 
Get-ADGroup -Filter '*' | Select Name, GroupCategory, Identity | Sort-Object -Property Name 

#Office365_A1_StandardUser 

$userGroup = Get-ADGroup -Filter 'CN -eq "Office365_A1_StandardUser"'
Get-ADGroupMember -Identity $userGroup -Recursive | measure

(Get-ADUser -Filter 'Name -like "Sergei Nagaev"' –Properties MemberOf).memberof | Get-ADGroup | Select-Object name | Sort-Object -Property Name

Get-ADUser -Filter 'Name -like "Sergei Nagaev"'

Get-ADUser -Identity NagaeSer -Properties SamAccountName

Get-ADUser -Identity NagaeSer -Properties *

Get-ADUser -Identity * -Properties *

#SamAccountName 
#Get-ADUser -SamAccountName NagaeSer -Properties *

(Get-ADUser -Filter 'Name -like "Sergei Nagaev"' –Properties MemberOf).memberof | Get-ADGroup |  Sort-Object -Property Name

Get-ADPrincipalGroupMembership NagaeSer | select name |  Sort-Object -Property Name


$group = Get-ADGroup -Identity "Office365_A1_StandardUser"
(Get-Acl "AD:$($group.distinguishedName)").Access

$group = Get-ADGroup -Identity "Office365_A1_StandardUser"
(Get-Acl "AD:$($group.distinguishedName)") | Get-Member

cls
$group = Get-ADGroup -Identity "Office365_A1_StandardUser"
$group.PropertyNames

$DD = (Get-Acl "AD:$($group.distinguishedName)").Members
$DD


$group 

$group = Get-ADGroup -Identity "Office365_A1_StandardUser" -Property *
$group.Members


Get-ADUser -Filter {(Enabled -eq $true)} -Properties LastLogonDate | select samaccountname, Name, LastLogonDate | Sort-Object LastLogonDate

Get-ADUser -Filter {(Enabled -eq $false)} -Properties LastLogonDate | select samaccountname, Name, LastLogonDate | Sort-Object LastLogonDate

Add-WindowsCapability 


#Get all domain controllers in the forest
(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }


get-aduser -Filter '*' | findstr /i test


get-aduser -Filter 'Name -Like "*test*"' 

#| findstr /i test

75cfd0d1-9e00-4af8-9b10-60da091bf4d2


Get-GPO -All -Domain <DomainName> | Where-Object { $_.DomainName -eq "<DomainName>" -and $_.DisplayName -ne "Local Group Policy" } | Get-GPOReport -ReportType xml | Select-String "<LinksTo>" -Context 0,1 | ForEach-Object { $_.Context.PostContext -replace "<LinksTo>", "" -replace "</LinksTo>", "" }


Import-Module GroupPolicy

cls
$DomainName = 'tmw.ac.at'
$ListPops = Get-GPO -All -Domain $DomainName | Where-Object { $_.DomainName -eq "$DomainName" -and $_.DisplayName -ne "Local Group Policy" } | Get-GPOReport -ReportType xml | Select-String "<LinksTo>" -Context 0,1 | ForEach-Object { $_.Context.PostContext -replace "<LinksTo>", "" -replace "</LinksTo>", "" }
$ListPops |  Out-File -FilePath  "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\Test.txt"
$ListPops



Get-ADGroup -Filter '*' | Select Name, GroupCategory, DistinguishedName | Sort-Object -Property Name 

#Group policy objects
Get-GPO -All -Domain $DomainName | Select Owner #   Get-Member

Get-GPO -All -Domain $DomainName | Get-GPOReport -ReportType xml

Get-GPO -Name "Office365_A1_StandardUser" 


Get-GPO -All -Domain $DomainName | Select DisplayName, Id |  Sort-Object -Property DiplayName    |  Out-File -FilePath  "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\Stupid.txt"

Get-GPO -All -Domain $DomainName | Select DisplayName, Id |  Sort-Object -Property DiplayName    | Export-Csv -Path "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\Stupid.csv" -Delimiter ";" 

#Active Directory Security Groups
Get-ADGroup -Filter '*' | Select Name, GroupCategory, DistinguishedName, Properties 


Get-ADGroup -Filter '*' | Select Name, GroupScope  |  Sort-Object -Property Name


Get-ADGroup -Filter '*' |   Sort-Object -Property Name


$GroupName = "Office365_A1_StandardUser"
$group = Get-ADGroup -Identity $GroupName
$acl = Get-Acl -Path "AD:\$($group.DistinguishedName)"
$OutPutFile = "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\"+$GroupName+"_ACL_ALEs_1.csv"
$acl.Access | Export-Csv -Path $OutPutFile -Encoding default -Delimiter ";" 


(Get-ADObject -Identity $group.DistinguishedName -Properties DistinguishedName).DistinguishedName

# Define the name of the AD group to examine
#$groupname = "MyGroup"

# Define the path to the software installation directory or registry key
$path = "HKLM:\Software\"+ $GroupName

# Get the ACL for the software installation directory or registry key
# $acl = Get-Acl $path
$GroupName = "Office365_A1_StandardUser"
$group = Get-ADGroup -Identity $GroupName
$acl = Get-Acl -Path "AD:\$($group.DistinguishedName)"

# Find the ACEs that grant or deny access to the software for the specified group
$aces = $acl.Access | Where-Object { $_.IdentityReference -match $groupname }

# Output the names of the software that the group has access to
foreach ($ace in $aces) {
    Write-Host "Group '$groupname' has access to software '$($ace.FileSystemRights)' in path '$path'"
}

$aces

$As = Get-Acl C:\Windows
$As.Access | Get-Member

$As = Get-Acl C:\Windows
$As.Access.IdentityReference

$GroupName = "Office365_A1_StandardUser"
$group = Get-ADGroup -Identity $GroupName
$acl = Get-Acl -Path "AD:\$($group.DistinguishedName)"
#$OutPutFile = "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\"+$GroupName+"_ACL_ALEs_1.csv"
$acl.Access.IdentityReference  # | Export-Csv -Path $OutPutFile -Encoding default -Delimiter ";" 

$GroupName = "Office365_A1_StandardUser"
$group = Get-ADGroup -Identity $GroupName
$acl = Get-Acl -Path "AD:\$($group.DistinguishedName)" #| Get-Member
#$OutPutFile = "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\"+$GroupName+"_ACL_ALEs_1.csv"
$acl.Access | select IdentityReference | sort-object -Property IdentityReference -Unique   # | Export-Csv -Path $OutPutFile -Encoding default -Delimiter ";" 
$acl
<#
Access                          CodeProperty   System.Security.AccessControl.AuthorizationRuleCollection Access{get=GetAccess;}                                     
CentralAccessPolicyId           CodeProperty   System.Security.Principal.SecurityIdentifier CentralAccessPolicyId{get=GetCentralAccessPolicyId;}                    
CentralAccessPolicyName         CodeProperty   System.String CentralAccessPolicyName{get=GetCentralAccessPolicyName;}                                               
Group                           CodeProperty   System.String Group{get=GetGroup;}                                                                                   
Owner                           CodeProperty   System.String Owner{get=GetOwner;}                                                                                   
Path                            CodeProperty   System.String Path{get=GetPath;}                                                                                     
Sddl                            CodeProperty   System.String Sddl{get=GetSddl;}     
#>

$GroupName = "Office365_A1_StandardUser"
$group = Get-ADGroup -Identity $GroupName
$acl = Get-Acl -Path "AD:\$($group.DistinguishedName)" 
$bak = $acl | Select CentralAccessPolicyId, CentralAccessPolicyName, Group, Owner, Path, Sddl
$bak


$DomainName = 'tmw.ac.at'
Get-GPO -All -Domain $DomainName | Select DisplayName, Id |  Sort-Object -Property DiplayName, Id -Unique

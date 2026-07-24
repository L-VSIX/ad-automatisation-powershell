
#New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:"FS_O_100000_DIRECTION_GENERALE_R" -Path:"OU=Organigramme,OU=Fichier,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -SamAccountName:"FS_O_100000_DIRECTION_GENERALE_R" -Server:"H-WINSERV-2.raidaporter.local"



#New-Item -Path \\a-winserv-2.raidaporter.local\organigramme$\100000_DIRECTION_GENERALE\RemoteFolder -Force -ItemType Directory


#Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase "OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" -SearchScope OneLevel | Format-Table Name


$dataOU = Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase "OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" -SearchScope OneLevel | select Name
Foreach($ou in $dataOU){
	$NameOU = $ou.Name
	Write-Host "OU utilisé :" $NameOU
	
	#Création des dossiers
	New-Item -Path \\a-winserv-2.raidaporter.local\organigramme$\$NameOU -Force -ItemType Directory
	$FS = "FS_O_"
	$r = "_R"
	$w = "_W"	
	$GroupeOUr = $FS + $NameOU + $r
	$GroupeOUw = $FS + $NameOU + $w
	Write-Host "Nom du groupe a créé :" $GroupeOUr
	Write-Host "Nom du groupe a créé :" $GroupeOUw	
	
	#Créeation des groupes FS
	New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:$GroupeOUr -Path:"OU=Organigramme,OU=Fichier,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -SamAccountName:$GroupeOUr -Server:"H-WINSERV-2.raidaporter.local"	
	New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:$GroupeOUw -Path:"OU=Organigramme,OU=Fichier,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -SamAccountName:$GroupeOUw -Server:"H-WINSERV-2.raidaporter.local"	
	
	#PAUSE
	Start-Sleep 5
	
	#Application des droits en lecture sur les dossiers
	$subpath = "\\a-winserv-2.raidaporter.local\organigramme$\"
	$path = $subpath + $NameOU
	#$path = "\\a-winserv-2.raidaporter.local\organigramme$\110000_SCE_FINANCE"
	$acl = Get-Acl $path
	$myaclentry = $GroupeOUr,"Read","ContainerInherit,ObjectInherit","None","Allow"
	$myaccessrule = New-Object System.Security.AccessControl.FileSystemAccessRule($myaclentry)
	$acl.SetAccessRule($myaccessrule)
	$acl.AddAccessRule($myaccessrule)
	Set-Acl $path $acl -Verbose
	#Get-ChildItem -Path "$path" -Recurse -Force | Set-Acl -AclObject $acl -Verbose

	$acl.AddAccessRule($myaccessrule)

	$NewAcl = Get-Acl -Path $path 
	$isProtected = $true
	$preserveInheritance = $true
	$NewAcl.SetAccessRuleProtection($isProtected, $preserveInheritance)
	Set-Acl -Path $path  -AclObject $NewAcl

	#Application des droits en écriture sur les dossiers
	
	$subpath = "\\a-winserv-2.raidaporter.local\organigramme$\"
	$path = $subpath + $NameOU
	#$path = "\\a-winserv-2.raidaporter.local\organigramme$\110000_SCE_FINANCE"
	$acl = Get-Acl $path
	$myaclentry = $GroupeOUw,"Modify","ContainerInherit,ObjectInherit","None","Allow"
	$myaccessrule = New-Object System.Security.AccessControl.FileSystemAccessRule($myaclentry)
	$acl.SetAccessRule($myaccessrule)
	$acl.AddAccessRule($myaccessrule)
	Set-Acl $path $acl -Verbose
	#Get-ChildItem -Path "$path" -Recurse -Force | Set-Acl -AclObject $acl -Verbose

	$acl.AddAccessRule($myaccessrule)

	$NewAcl = Get-Acl -Path $path 
	$isProtected = $true
	$preserveInheritance = $true
	$NewAcl.SetAccessRuleProtection($isProtected, $preserveInheritance)
	Set-Acl -Path $path  -AclObject $NewAcl	
	

}





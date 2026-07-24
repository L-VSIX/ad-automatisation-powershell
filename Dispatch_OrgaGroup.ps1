#Creation d'une variable qui va prendre tout les comptes de l'OU Utilisateurs
$data = Get-ADUser -Filter 'enabled -eq $true' -Properties Title -SearchBase "OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title

Foreach($Utilisateur in $data){
	
	    $login = $Utilisateur.SamAccountName
		$service = $Utilisateur.DistinguishedName
		$metier = $Utilisateur.Title
		
		if ($service.Contains("100000_DIRECTION_GENERALE")){
			Write-Host "OU 100000_DIRECTION_GENERALE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 100000_DIRECTION_GENERALE_M
			if ($metier.Contains("Directeur")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 100000_DIRECTION_GENERALE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}
			if ($service.Contains("110000_SCE_FINANCE")){
			Write-Host "OU 110000_SCE_FINANCE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 110000_SCE_FINANCE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 110000_SCE_FINANCE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}
		if ($service.Contains("120000_SCE_COMMERCE")){
			Write-Host "OU 120000_SCE_COMMERCE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 120000_SCE_COMMERCE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 120000_SCE_COMMERCE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}
		if ($service.Contains("130000_SCE_TECHNIQUE")){
			Write-Host "OU 130000_SCE_TECHNIQUE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 130000_SCE_TECHNIQUE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 130000_SCE_TECHNIQUE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}		
				if ($service.Contains("140000_SCE_RESSOURCE_HUMAINE")){
			Write-Host "OU 140000_SCE_RESSOURCE_HUMAINE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 140000_SCE_RESSOURCE_HUMAINE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 140000_SCE_RESSOURCE_HUMAINE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}	
				if ($service.Contains("150000_SCE_LOGISTIQUE")){
			Write-Host "OU 150000_SCE_LOGISTIQUE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 150000_SCE_LOGISTIQUE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 150000_SCE_LOGISTIQUE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}	
				if ($service.Contains("160000_SCE_INFORMATIQUE")){
			Write-Host "OU 160000_SCE_INFORMATIQUE reconnue !"
			Add-ADPrincipalGroupMembership -Identity $login -MemberOf 160000_SCE_INFORMATIQUE_M
			if ($metier.Contains("Responsable")){
				Write-Host "Métier reconnue !"
				Add-ADPrincipalGroupMembership -Identity $login -MemberOf 160000_SCE_INFORMATIQUE_R
			}
#			else{
#				Write-Host "Métier non trouvé !"				
#			}
		}	
#		else{
#			Write-Host "OU non trouvé !"
#		}
}

#Get-ADUser -Filter * -SearchBase "OU=100000_DIRECTION_GENERALE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title

#Get-ADUser -Filter 'enabled -eq $true' -Properties Title -SearchBase "OU=100000_DIRECTION_GENERALE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title
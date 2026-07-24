#Creation d'une variable qui va prendre tout les comptes de l'OU Utilisateurs

#Move-ADObject -Identity "CN=Six Louis,OU=100000_DIRECTION_GENERALE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" -TargetPath "OU=110000_SCE_FINANCE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local"

#$data = Get-ADUser -Filter 'enabled -eq $true' -Properties Title -SearchBase "OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title

#Alimenter la variable avec tous les users de l'entreprise"
$data = Get-ADUser -Filter 'enabled -eq $true' -SearchBase "OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName
#Get-ADPrincipalGroupMembership L.SIX | select name			// Chercher les habilitation d'un users

Foreach($Utilisateur in $data){
	
	    $login = $Utilisateur.SamAccountName
		$service = $Utilisateur.DistinguishedName
		$groupe = Get-ADPrincipalGroupMembership $login | select name
		$namegroupe = $groupe.name
		$datagroupe = Get-ADGroup -Filter 'Name -like "100000_DIRECTION_GENERAL*"' | select Name
		
			if ($service.Contains("100000_DIRECTION_GENERALE")){
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}			
		}	
			if ($service.Contains("110000_SCE_FINANCE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}				
		}
			if ($service.Contains("120000_SCE_COMMERCE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}				
		}
			if ($service.Contains("130000_SCE_TECHNIQUE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}				
		}	
			if ($service.Contains("140000_SCE_RESSOURCE_HUMAINE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}				
		}		
			if ($service.Contains("150000_SCE_LOGISTIQUE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_R")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("160000_SCE_INFORMATIQUE_M")){
				Write-Host "Présence du mauvaise groupe 160000_SCE_INFORMATIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=160000_SCE_INFORMATIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}				
		}
			if ($service.Contains("160000_SCE_INFORMATIQUE")){
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_M")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("100000_DIRECTION_GENERALE_R")){
				Write-Host "Présence du mauvaise groupe 100000_DIRECTION_GENERALE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=100000_DIRECTION_GENERALE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_R")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("110000_SCE_FINANCE_M")){
				Write-Host "Présence du mauvaise groupe 110000_SCE_FINANCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=110000_SCE_FINANCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("120000_SCE_COMMERCE_R")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("120000_SCE_COMMERCE_M")){
				Write-Host "Présence du mauvaise groupe 120000_SCE_COMMERCE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=120000_SCE_COMMERCE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_R")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("130000_SCE_TECHNIQUE_M")){
				Write-Host "Présence du mauvaise groupe 130000_SCE_TECHNIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=130000_SCE_TECHNIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_R")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("140000_SCE_RESSOURCE_HUMAINE_M")){
				Write-Host "Présence du mauvaise groupe 140000_SCE_RESSOURCE_HUMAINE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=140000_SCE_RESSOURCE_HUMAINE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}	
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_R")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_R trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_R,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}
			if ($namegroupe.Contains("150000_SCE_LOGISTIQUE_M")){
				Write-Host "Présence du mauvaise groupe 150000_SCE_LOGISTIQUE_M trouvé et suppression de l'habilitation pour" $login				
				Remove-ADPrincipalGroupMembership -Identity $login -MemberOf "CN=150000_SCE_LOGISTIQUE_M,OU=Organigramme,OU=Groupes,OU=RAIDAPORTER,DC=raidaporter,DC=local" -Confirm:$false	
			}			
		}


}



#Get-ADUser -Filter * -SearchBase "OU=100000_DIRECTION_GENERALE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title

#Get-ADUser -Filter 'enabled -eq $true' -Properties Title -SearchBase "OU=100000_DIRECTION_GENERALE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local" | select SamAccountName,DistinguishedName,Title
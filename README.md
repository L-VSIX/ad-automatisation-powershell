# 🤖 Automatisation de l'administration avec PowerShell — Active Directory

> Scripts d'industrialisation des tâches AD récurrentes : création de comptes, affectation des groupes, réaffectation de service, provisioning des répertoires.

## Périmètre des scripts

Sur la base de la structuration en OU/groupes `_R`/`_M`/`_G` (voir `ad-structuration-annuaire`), plusieurs scripts PowerShell ont été développés :

- Création de comptes utilisateurs
- Affectation automatique des groupes de sécurité en fonction de l'OU cible
- Réaffectation d'un utilisateur d'un service à un autre
- Création des répertoires personnels/service associés sur les serveurs de fichiers
- Application des permissions NTFS correspondantes

## Exemple — création d'un groupe de sécurité

```powershell
New-ADGroup -Name '110000_SCE_FINANCE_M' `
  -GroupCategory Security -GroupScope Global `
  -Path 'OU=110000_SCE_FINANCE,OU=Utilisateurs,OU=RAIDAPORTER,DC=raidaporter,DC=local'
```

## Pourquoi automatiser

Sur ~60 utilisateurs répartis en 6 services, la création manuelle de comptes est source d'erreurs de nommage et d'incohérence dans l'attribution des droits. L'automatisation garantit que chaque nouveau compte respecte strictement la convention (OU + groupes `_R`/`_M`/`_G` + répertoire + ACL NTFS) sans étape oubliée.

## Intégration avec la gestion des habilitations fichiers

Ces scripts communiquent directement avec la partie serveur de fichiers : la création d'un compte déclenche la création du répertoire personnel et l'application des permissions NTFS correspondantes (voir `dfs-habilitations-powershell`).

## Repos liés

- [`ad-structuration-annuaire`](https://github.com/L-VSIX/ad-structuration-annuaire)
- [`dfs-habilitations-powershell`](https://github.com/L-VSIX/dfs-habilitations-powershell)
- [`ad-gpo`](https://github.com/L-VSIX/ad-gpo)

## Auteur

**Lilian Vertueux** — [LinkedIn](https://www.linkedin.com/in/lilian-vertueux/)

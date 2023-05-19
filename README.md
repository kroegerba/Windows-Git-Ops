# Windows-Git-Ops
## Backup
For creating backups use:
```windows-command-line
commit_to_backup.bat
```
For restoring backups use:
```windows-command-line
switch_to_backup_branch.bat
```
## Staging
For commiting the current state to the "staging"-branch use:
```windows-command-line
commit_to_staging.bat
```
For checking out the "staging"-branch - for example on another machine - use:
```windows-command-line
switch_to_staging_branch.bat
```
## Production
For merging the current commit (of the "staging"-branch) to the "production"-branch use:
```windows-command-line
commit_to_production.bat
```
For checking out the "production"-branch - for example on another machine - use:
```windows-command-line
switch_to_production_branch.bat
```

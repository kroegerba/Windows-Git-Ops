# Windows-Git-Ops
## Backup
For creating backups use:
```windows-command-line
commit_backup.bat
```
For restoring backups use:
```windows-command-line
checkout_backup.bat
```
## Staging
For commiting the current state to the "staging"-branch use:
```windows-command-line
commit_staging.bat
```
For checking out the "staging"-branch - for example on another machine - use:
```windows-command-line
checkout_staging.bat
```
## Production
For merging the current commit (of the "staging"-branch) to the "production"-branch use:
```windows-command-line
commit_production.bat
```
For checking out the "production"-branch - for example on another machine - use:
```windows-command-line
checkout_production.bat
```
## Navigation
For navigating to the previous commit of the current branch use:
```windows-command-line
checkout_previous.bat
```
For navigating to the next commit of the current branch use:
```windows-command-line
checkout_next.bat
```

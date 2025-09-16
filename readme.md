# Windows Terminal Settings

Scripts to install windows-terminal with my settings applied


## Install

- Note: You should read scripts before running them

```powershell
irm https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main/install.ps1 | iex
```


## Uninstall

```powershell
irm https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main/uninstall.ps1 | iex
```


## Todo

- set default profile to pwsh
- set default font to firacode
- probably want to use a read language for json manipulation, find/replace, deduplication


## Problems

- you have to launch the gui in order to generate the default config, which means interactive shell attached to gui 
  session is the only way to make this work
  

---

# Manual Steps Taken by this Script

#### Disable Multiline Paste Warning, Close All Tabs
At the root of the settings file:
```json
{
  "multiLinePasteWarning": false,
  "confirmCloseAllTabs": false
}
```

#### Fix multiline paste breaking on lines
Copy-paste breaks on multiline paste. Fix by commenting these in settings.json:
```jsonc
// {
//   "command": "paste",
//   "keys": "ctrl+v"
// },
```

#### Git Bash Profile
Add to settings.json under "profile" section or whatever
```json
{
  "commandline": "C:\\Program Files\\Git\\bin\\bash.exe",
  "guid": "{b0f5ce57-a6d6-46d8-bc20-38b0b769789a}",
  "hidden": false,
  "name": "Git Bash"
},
```
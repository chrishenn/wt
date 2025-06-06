# Windows Terminal Settings

Scripts to install windows-terminal with my settings applied


# Install

- Note: You should read scripts before running them

```powershell
irm https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main/install.ps1 | iex
```


# Uninstall

```powershell
irm https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main/uninstall.ps1 | iex
```


# Todo

- set default profile to pwsh
- set default font to firacode
- probably want to use a read language for json manipulation, find/replace, deduplication


# Problems

- you have to launch the gui in order to generate the default config, which means interactive shell attached to gui 
  session is the only way to make this work
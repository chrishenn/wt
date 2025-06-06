pushd "$HOME"

if ($null -eq (Get-Command scoop -ErrorAction SilentlyContinue)) {
    irm get.scoop.sh -outfile 'scoop.ps1'
    .\scoop.ps1 -RunAsAdmin | out-null
    rm scoop.ps1
}
scoop bucket add extras
scoop install windows-terminal

$repo = "https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main"
$cfg = "$HOME/scoop/persist/windows-terminal/settings/settings.json"


popd

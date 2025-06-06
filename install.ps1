pushd "$HOME"

if ($null -eq (Get-Command scoop -ErrorAction SilentlyContinue)) {
    irm get.scoop.sh -o 'scoop.ps1'
    .\scoop.ps1 -RunAsAdmin | out-null
    rm scoop.ps1
}
scoop install git
scoop bucket add extras
scoop install windows-terminal jq gow

$repo = "https://raw.githubusercontent.com/chrishenn/wt/refs/heads/main"
$cfg = "$HOME/scoop/persist/windows-terminal/settings/settings.json"

curl $repo/globals.json -o globals.json
curl $repo/profiles.tpl -o profiles.tpl

# add settings to the json root and overwrite settings file with new
jq -s '.[0] * .[1]' globals.json $cfg | set-content $cfg

# add git-bash path to template and save intermediate
$bash = "$(scoop prefix git)\bin\bash.exe"
jq -n --arg BASH_EXE $bash -f profiles.tpl | set-content profiles.json

# merge profiles lists via flatten and write to settings
# note: does not deduplicate ::crying::
jq -s '.[0].profiles.list=([.[].profiles.list]|flatten)|.[0]' $cfg profiles.json | set-content $cfg

# rm tmp files
rm -r -force globals.json
rm -r -force profiles.tpl
rm -r -force profiles.json

popd

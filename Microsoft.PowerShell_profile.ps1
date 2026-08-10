function prompt {
	$path = Split-Path -Leaf -Path (Get-Location)
	"$path> "
}

function ll {
	Get-ChildItem -Force
}

function .. {
	cd ..
}

function dsync {
	Invoke-Command -ComputerName aog-aad02 -ScriptBlock {
		Start-ADSyncSyncCycle -PolicyType Delta
	}
}

function nvif {
	$file = Get-ChildItem -Recurse -File | ForEach-Object FullName | fzf

	if ($file) {
		nvim -- $file
	}
}

Set-PSReadLineOption -Colors @{
	"Command"	= "Yellow"
	"Parameter"	= "Blue"
	"String"	= "Cyan"
	"Variable"	= "Red"
	"Operator"	= "Red"
	"Default"	= "White"
}

& fastfetch
& "C:\Scripts\load_env.ps1"
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Import-Module "C:\Scripts\ADTools\ADTools.psm1" -Force
Import-Module "C:\Scripts\AssetManagerTools\AssetManagerTools.psm1" -Force

function Set-AssetHeaders {
    return @{
        Authorization = $env:ASSET_API_KEY
        "Content-Type" = "application/json"
        "Accept" = "application/json"
        "User-Agent" = "Kawikas CLI Scripts"
    }
}

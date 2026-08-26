function prompt {
	$path = Split-Path -Leaf -Path (Get-Location)
	if ((Get-Location).Path -eq $HOME) {
		$path = "~"
	}

	"`e[33mkawiggles@uss-yorktown`e[0m $path > "
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
	"Command"	= "Red"
	"Parameter"	= "Yellow"
	"String"	= "Green"
	"Variable"	= "Blue"
	"Operator"	= "DarkYellow"
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

function Get-DiskUsage {
	Get-ChildItem -Recurse -File . |
	Group-Object DirectoryName |
	ForEach-Object {
		[PSCustomObject]@{
			Name = $_.Name
			SizeMB = [math]::Round(
				(($_.Group | Measure-Object Length -Sum).Sum / 1MB), 2
			)
		}
	}
	Sort-Object SizeMB
}

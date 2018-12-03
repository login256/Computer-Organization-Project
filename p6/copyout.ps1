Get-ChildItem .\mips\ -recurse | ForEach-Object -Process{
	if($_ -is [System.IO.FileInfo] -and $_.Extension -eq '.v')
	{
		Copy-Item $_.FullName .\upload\ 
	}
}
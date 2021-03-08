$ErrorActionPreference = 'Stop'

msbuild -v:m -restore -t:Build -p:Configuration=Release -p:TargetFramework=net48 de4dot.netframework.sln
if ($LASTEXITCODE) { exit $LASTEXITCODE }
Remove-Item Release\net48\*.pdb, Release\net48\*.xml, Release\net48\Test.Rename.*

dotnet publish -c Release -f net5.0 -o Release\net5.0 de4dot
if ($LASTEXITCODE) { exit $LASTEXITCODE }
Remove-Item Release\net5.0\*.pdb, Release\net5.0\*.xml

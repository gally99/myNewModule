Get-Module $env:BHProjectName | Remove-Module -Force
$ModuleManifestPath = Join-Path -Path $env:BHBuildOutput -ChildPath "$($env:BHProjectName).psd1"
Import-Module $ModuleManifestPath -Force

Describe 'Get-Something' {
    function GetSomething {}
    context 'returns something as expected' {
        it "should return you got something" {
            Get-Something | should -be 'you got something'
        }
    }
}
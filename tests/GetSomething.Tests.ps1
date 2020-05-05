Get-Module $env:BHProjectName | Remove-Module -Force
$ModuleManifestPath = Join-Path -Path $env:BHBuildOutput -ChildPath "$($env:BHProjectName).psd1"
Import-Module $ModuleManifestPath -Force

InModuleScope myNewModule {
    Describe 'GetSomething' {
        context 'returns something as expected' {
            it "should return you got something" {
                GetSomething | should -be 'you got something'
            }
        }
    }
}
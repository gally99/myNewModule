properties {
    # Disable "compiling" module into monolithinc PSM1.
    # This modifies the default behavior from the "Build" task
    # in the PowerShellBuild shared psake task module
    $PSBPreference.Build.CompileModule = $false

    $testResultsPath = Join-Path -Path $PSScriptRoot -ChildPath "output/$env:BHProjectName/testResults.xml"
    $PSBPreference.Test.OutputFile = $testResultsPath
}

task default -depends Test

task Test -FromModule PowerShellBuild -Version '0.4.0'

task UploadTestResults {
    $wc = New-Object 'System.Net.WebClient'
    $wc.UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", $testResultsPath)
} -description 'Uploading tests'

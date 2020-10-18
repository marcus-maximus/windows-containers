Write-Output "=== MSBuild ==="
msbuild /version
Write-Output ""
Write-Output "------------------------------"
Write-Output ""

Write-Output "=== CMake ==="
cmake --version
Write-Output "------------------------------"
Write-Output ""

Write-Output "=== Vcpkg ==="
Set-Location C:\vcpkg; .\vcpkg version
Write-Output "------------------------------"
Write-Output ""

Write-Output "=== Git ==="
git --version
Write-Output "------------------------------"
Write-Output ""
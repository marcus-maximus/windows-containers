Param(
    [string] [Parameter(mandatory=$true)] $imageName
)

$MSBuildFound = docker run --rm $imageName msbuild /version `
    | Select-String -Pattern "Microsoft (R) Build Engine" -SimpleMatch -Quiet
$MSBuildFound ? "msbuild present" : "msbuild missing"
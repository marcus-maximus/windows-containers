Param(
    [string] [Parameter(mandatory=$true)] $imageName
)

$MSBuildFound = docker run --rm $imageName msbuild /version `
    | Select-String -Pattern "Microsoft (R) Build Engine" -SimpleMatch -Quiet
$MSBuildFound ? $("msbuild present"; exit 0) : $("msbuild missing"; exit 1)
# escape=`

ARG FROM_IMAGE=marcusmaximus/msvc-buildtools-base:2019-servercore-ltsc2019
FROM ${FROM_IMAGE}

SHELL [ "powershell", "-Command" ]

RUN & 'C:\Program Files (x86)\Microsoft Visual Studio\installer\vs_installer.exe' modify `
    --installPath 'C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools' `
    --quiet --norestart --nocache `
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended

RUN choco install -y cmake --installargs "ADD_CMAKE_TO_PATH=System"

RUN git clone https://github.com/Microsoft/vcpkg.git; `
    cd vcpkg; `
    .\bootstrap-vcpkg.bat

COPY .\Tests.ps1 C:\Tests.ps1

CMD [ "powershell" ]
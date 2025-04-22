#!/usr/bin/env bash
docker run --rm \
    -v /runtime:/runtime \
    -v /package:/package \
    -w /runtime \
    -e ROOTFS_DIR="/crossrootfs/x64" \
    mcr.microsoft.com/dotnet-buildtools/prereqs:azurelinux-3.0-net9.0-cross-amd64-musl \
    bash -c "ls -al \
    ./build.sh --subset clr.aot+libs --configuration Release -arch x64 --cross \
    && mkdir -p /package/runtime.linux-musl-x64.microsoft.dotnet.ilcompiler/sdk/ \
    && mkdir -p /package/runtime.linux-musl-x64.microsoft.dotnet.ilcompiler/framework/ \
    && cp -p ./artifacts/bin/coreclr/linux.x64.Release/aotsdk/* /package/runtime.linux-musl-x64.microsoft.dotnet.ilcompiler/sdk/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-x64/*.a /package/runtime.linux-musl-x64.microsoft.dotnet.ilcompiler/framework/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-x64/*.dbg /package/runtime.linux-musl-x64.microsoft.dotnet.ilcompiler/framework/"

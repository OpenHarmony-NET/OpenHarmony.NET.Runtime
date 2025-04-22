#!/usr/bin/env bash
docker run --rm \
    -v ../runtime:/runtime \
    -v ../package:/package \
    -e ROOTFS_DIR="/crossrootfs/arm64" \
    mcr.microsoft.com/dotnet-buildtools/prereqs:azurelinux-3.0-net9.0-cross-arm64-musl \
    bash -c "./build.sh --subset clr.aot+libs --configuration Release -arch arm64 --cross \
    && mkdir -p /package/runtime.linux-musl-arm64.microsoft.dotnet.ilcompiler/sdk/ \
    && mkdir -p /package/runtime.linux-musl-arm64.microsoft.dotnet.ilcompiler/framework/ \
    && cp -p ./artifacts/bin/coreclr/linux.arm64.Release/aotsdk/* /package/runtime.linux-musl-arm64.microsoft.dotnet.ilcompiler/sdk/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-arm64/*.a /package/runtime.linux-musl-arm64.microsoft.dotnet.ilcompiler/framework/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-arm64/*.dbg /package/runtime.linux-musl-arm64.microsoft.dotnet.ilcompiler/framework/"
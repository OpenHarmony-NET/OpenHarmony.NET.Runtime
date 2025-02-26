# 介绍
这里是[适配OpenHarmony的.NET仓库](https://github.com/OpenHarmony-NET/runtime)编译出的NativeAOT运行时

# 使用方式
1. 确保你的项目类型是"类库", 并且.NET版本为9.0
2. 将仓库clone到你的项目目录，并在你的项目种引入本仓库的runtime.targets文件

```xml
 <Import Project="../OpenHarmonyRuntime.Net/runtime.targets" />
```

3. 通过NativeAOT发布, Rid为linux-musl-arm64或者linux-musl-x64

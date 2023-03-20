# Flutter版微信（WeChat）V2.0

使用Flutter框架开发微信页面

## 版本

### 当前版本[V2.0版本](README.md)

### 历史版本
- [V1.0版本](README_V1.0.md)

## 特点
 - 支持国际化（中文、英文）
 - 支持主题自适应（浅色/深色）
 - 支持对接后台进行真实接口对接
 - 使用GetX框架
 - 使用Dio进行数据交互
 - 使用getwidget做为UI库
## 预览效果

![2](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/00e6ef83ccfb439bab65144882395e33~tplv-k3u1fbpfcp-watermark.image)
![3](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6de20fa4f16b4c7c9b4ffc00cc7855e3~tplv-k3u1fbpfcp-watermark.image)
![4](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9927454ef858450c8879648e17e2d3cb~tplv-k3u1fbpfcp-watermark.image)
![5](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7e67a452d6e0434d92ac23813202f1a2~tplv-k3u1fbpfcp-watermark.image)
![6](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/613c04c8262e403da5416e590fb27fc7~tplv-k3u1fbpfcp-watermark.image)
![7](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0501678dfee049cd92427e6a503a4251~tplv-k3u1fbpfcp-watermark.image?)
![8](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2d4613e8cc3245d896defae83627f2d6~tplv-k3u1fbpfcp-watermark.image?)
![9](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/010422cfd96b4d9a91635118dcfd6d9e~tplv-k3u1fbpfcp-watermark.image?)
![10](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c9f2a82d4ac942399824e9691bb134ee~tplv-k3u1fbpfcp-watermark.image?)
![11](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/04d3760d633448df809ac43d9fd2d8c6~tplv-k3u1fbpfcp-watermark.image?)

## 快速开始

这个项目是 Flutter 应用程序。
### 获取依赖
```shell
flutter pub get 
```

### 生成国际化相关的代码
```shell
flutter gen-l10n 
```
### 生成JSON相关的代码
```shell
flutter pub run build_runner build   --delete-conflicting-outputs
```
### 运行项目
```shell
flutter run 
```

### 命令介绍
```shell
flutter --help
#或者
flutter -h
```
如果这是您的第一个 Flutter 项目，一些资源可以帮助您入门：

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

有关 Flutter 开发入门的帮助，请查看
[online documentation](https://docs.flutter.dev/), 提供教程，
示例、移动开发指南和完整的 API 参考。

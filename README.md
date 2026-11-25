# model_flutter

从 `mst_flutter_443` 提取的纯 Dart 接口模型包，可用于 Android、iOS Flutter 项目。无 Flutter 运行时依赖、原生代码、MethodChannel 或网络请求逻辑。

## 接入

在使用方项目的 `pubspec.yaml` 添加：

```yaml
dependencies:
  model_flutter:
    path: ../model_flutter
```

执行 `flutter pub get` 后：

```dart
import 'package:model_flutter/model_flutter.dart';

final body = const GuestLoginRequest(pkgId: 1).toJson();
final login = GuestLoginResponse.fromJson(responseJson);
final user = login.userVo;
```

共享到其他电脑时，将本包放入团队 Git 仓库，使用 Git 依赖并固定 tag：

```yaml
dependencies:
  model_flutter:
    git:
      url: <替换为团队模型仓库地址>
      ref: v0.1.0
```

当前配置 `publish_to: none`，用于本地或私有 Git 共享；尚未上传仓库或发布。

## 覆盖范围

44 个接口模型源文件，按活动、归因、设备、剧目/播放、收藏、反馈、首页、登录、订阅、用户、钱包划分，外加统一响应 `RestReply<T>`。完整名称映射见 [模型目录](docs/model_catalog.md)。

请求沿用原项目 `toJson`，响应沿用 `fromJson/toJson`，保留 JSON 字段和原解析约定。序列化为手写代码，无需 build_runner。不是所有请求都有 fromJson；请求用于编码发送，响应用于解析与再次编码。

## 统一响应

```dart
final reply = RestReply<GuestLoginResponse>.parseMap(
  responseJson,
  (data) => GuestLoginResponse.fromJson(data as Map<String, dynamic>),
);
final json = reply.toJson(encodeBody: (value) => value.toJson());
```

成功码沿用原项目 `200`、`0`；缺失 code 沿用 `00000`，不判定成功。接口域名、路由混淆值、请求头、鉴权、设备信息与请求发送由使用方管理。

## 平台与支付参数

`PushTokenReportRequest` 必须显式传 `platform: 1`（Android）或 `2`（iOS）。`PurchaseContext.toReportRequest` 必须显式传 `paymentStore: PaymentStore.appStore` 或 `PaymentStore.googlePlay`，也支持 Stripe/Paddle。包内不读取操作系统，不引入支付或推送 SDK。

## 从原项目迁移

推荐按模型目录替换为业务名称。也可先使用 `package:model_flutter/legacy.dart`，其中 typedef 保留原混淆类型名；原扩展名不保留，使用新扩展名。平台自动判断方法已移除，上述两处调用需要补充参数。原应用尚未修改，可逐步迁移并由应用自身回归验证。

排除全部 8 个 `models/adapty` 文件（商品展示、SDK 类型、目录快照和购买状态），以及 `RestFault` 的 Dio 异常转换、API 服务和环境配置。本包仅服务于相同接口协议的项目；不同后端协议仍需适配。

## 开发验证

```sh
dart pub get
dart analyze
dart test
dart run example/main.dart
```

新增或修改接口模型时同步更新序列化、模型目录、测试与版本号。SDK 要求 Dart >=3.11（原项目使用 3.11.1）。

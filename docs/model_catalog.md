# 模型迁移对照

从 mst_flutter_443/lib/models 提取；保留 JSON 键、类型、空值和默认值处理。

| 原文件 | 原名称 | 新名称 |
| --- | --- | --- |
| `activity/coral_jasper.dart` | `DuskGlow` | `CheckInStatus` |
| `activity/coral_jasper.dart` | `PearlFlare` | `CheckInStatusCodec` |
| `activity/coral_jasper.dart` | `CoralTide` | `CheckInDay` |
| `activity/coral_jasper.dart` | `CoralJasper` | `CheckInResponse` |
| `activity/dawn_keel.dart` | `DawnKeel` | `WatchReportResponse` |
| `activity/fern_pavilion.dart` | `MeadowIris` | `EarlyAccessAction` |
| `activity/fern_pavilion.dart` | `TerracePetal` | `EarlyAccessActionCodec` |
| `activity/fern_pavilion.dart` | `FernPavilion` | `EarlyAccessDrama` |
| `activity/gentle_horizon.dart` | `GentleHorizon` | `TaskClaimRequest` |
| `activity/islet_echo.dart` | `IsletEcho` | `ActivityTask` |
| `activity/kettle_coral.dart` | `OnyxGlade` | `ActivityHubViewType` |
| `activity/kettle_coral.dart` | `KettleCoral` | `ActivityHub` |
| `activity/olive_anchor.dart` | `OliveAnchor` | `WatchReportRequest` |
| `activity/opal_ledge.dart` | `OpalLedge` | `TaskClaimResponse` |
| `attribution/horizon_mist.dart` | `HorizonMist` | `DramaAttributionRequest` |
| `device/linen_cedar.dart` | `LinenCedar` | `DevicePriceTierRequest` |
| `device/sage_saddle.dart` | `SageSaddle` | `PushTokenReportRequest` |
| `device/willow_vista.dart` | `WillowVista` | `DevicePriceTierResponse` |
| `drama/amber_delta.dart` | `AmberDelta` | `ProgressReportRequest` |
| `drama/dawn_dapple.dart` | `DawnDapple` | `Episode` |
| `drama/dusk_marsh.dart` | `DuskMarsh` | `DramaVoteResponse` |
| `drama/islet_cedar.dart` | `IsletCedar` | `SideStoryEpisode` |
| `drama/ivory_linen.dart` | `IvoryLinen` | `UnlockRequest` |
| `drama/ivory_loom.dart` | `IvoryLoom` | `DramaIdRequest` |
| `drama/jade_glen.dart` | `JadeGlen` | `UnlockResponse` |
| `drama/moss_fjord.dart` | `MossFjord` | `DramaDetail` |
| `drama/orchard_delta.dart` | `OrchardDelta` | `PlayPreviewRequest` |
| `drama/pebble_quay.dart` | `PebbleQuay` | `PlayPreviewResponse` |
| `drama/willow_pebble.dart` | `WillowPebble` | `DramaVoteRequest` |
| `favorite/grove_dapple.dart` | `GroveDapple` | `FavoriteDrama` |
| `favorite/grove_harbor.dart` | `GroveHarbor` | `FavoriteListRequest` |
| `feedback/garden_inlet.dart` | `GardenInlet` | `FeedbackRequest` |
| `home/fountain_knoll.dart` | `DuskReef` | `DramaCardAction` |
| `home/fountain_knoll.dart` | `ReefNook` | `DramaCardActionCodec` |
| `home/fountain_knoll.dart` | `FountainKnoll` | `DramaCard` |
| `home/horizon_bridge.dart` | `HorizonBridge` | `HomeSection` |
| `home/kettle_loom.dart` | `KettleLoom` | `HomePageResponse` |
| `home/kettle_orbit.dart` | `KettleOrbit` | `HomeBanner` |
| `home/reef_iris.dart` | `ReefIris` | `PageRequest` |
| `home/sage_knoll.dart` | `SageKnoll` | `HomeFeed` |
| `login/feather_window.dart` | `FeatherWindow` | `GuestLoginRequest` |
| `login/onyx_spire.dart` | `OnyxSpire` | `GuestLoginResponse` |
| `subscription/inlet_quartz.dart` | `InletQuartz` | `SubscriptionStatus` |
| `subscription/moss_petal.dart` | `MossPetal` | `SubscriptionStatusRequest` |
| `subscription/moss_petal.dart` | `PearlGlen` | `SubscriptionStatusCodes` |
| `userinfo/fountain_ledge.dart` | `FountainLedge` | `UserProfile` |
| `wallet/brook_compass.dart` | `BronzeCedar` | `PurchaseSource` |
| `wallet/brook_compass.dart` | `RippleGlen` | `PaymentStore` |
| `wallet/brook_compass.dart` | `FeatherWharf` | `PurchaseContext` |
| `wallet/brook_compass.dart` | `BrookCompass` | `PurchaseContextReportRequest` |
| `wallet/copper_oasis.dart` | `CopperOasis` | `WalletSummary` |
| `wallet/fern_glow.dart` | `FernGlow` | `PaymentRewardCheckRequest` |
| `wallet/fern_glow.dart` | `GentleDelta` | `PaymentRewardCodes` |
| `wallet/linen_willow.dart` | `LinenWillow` | `WalletRecordsResponse` |
| `wallet/olive_zephyr.dart` | `OliveZephyr` | `CoinExpenseRecord` |
| `wallet/sage_jasper.dart` | `SageJasper` | `WalletRecordsRequest` |
| `wallet/slate_delta.dart` | `SlateDelta` | `CoinIncomeRecord` |

排除 models/adapty 的 8 个文件：它们用于商品 SDK、UI 快照及购买流程，不属于服务端接口模型。

请求模型沿用原项目的 toJson；响应模型沿用 fromJson/toJson。不引入代码生成依赖。

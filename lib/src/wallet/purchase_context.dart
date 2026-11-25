/// 购买入口来源（`/wallet/purchase/report` 的 `source`）。
///
/// 1=首页 HOME；2=活动中心 ACTIVITY_HUB；3=个人中心 PROFILE；
/// 4=正片 MAIN；5=支线 SIDE_STORY；6=其他 OTHER。
enum PurchaseSource {
  home(1),
  activityHub(2),
  profile(3),
  main(4),
  sideStory(5),
  other(6);

  const PurchaseSource(this.value);
  final int value;

  /// 非法或未传时按 6=OTHER。
  static PurchaseSource fromValue(int? raw) {
    for (final item in values) {
      if (item.value == raw) return item;
    }
    return other;
  }
}

/// 实际支付商店 PaymentStore（`/wallet/purchase/report` 的 `store`）。
///
/// 1=App Store；2=Google Play；3=Stripe；4=Paddle。
enum PaymentStore {
  appStore(1),
  googlePlay(2),
  stripe(3),
  paddle(4);

  const PaymentStore(this.value);
  final int value;

  static PaymentStore? fromValue(int? raw) {
    for (final item in values) {
      if (item.value == raw) return item;
    }
    return null;
  }
}

/// 购买场景上下文：发起购买时携带，支付成功后一次性上报。
///
/// 订阅/充值来源上报：带 [source]、[store]、[productSku] 与 [paymentRef]。
/// 仅剧目归因时可只传 [paymentRef] / [dramaId] / [episodeId]。
class PurchaseContext {
  /// 商店页等非播放场景：剧目 / 分集均传 0，来源默认个人中心。
  static const store = PurchaseContext(
    dramaId: 0,
    episodeId: 0,
    source: PurchaseSource.profile,
  );

  /// 剧目 ID；未传时服务端默认为 0。
  final int? dramaId;

  /// 分集 ID；未传时服务端默认为 0。
  final int? episodeId;

  /// 购买入口来源；未传按 [PurchaseSource.other]。
  final PurchaseSource? source;

  /// 商品 SKU（Adapty/商店实时商品码）。
  final String? productSku;

  /// 实际支付商店；由调用方提供，不在模型层推断系统。
  final PaymentStore? paymentStore;

  const PurchaseContext({
    this.dramaId,
    this.episodeId,
    this.source,
    this.productSku,
    this.paymentStore,
  });

  /// 支付成功后生成完整上报体；[paymentRef] 可与 `/wallet/balance/check` 一致。
  PurchaseContextReportRequest toReportRequest({
    required String paymentRef,
    String? productSku,
    required PaymentStore paymentStore,
  }) {
    final ref = paymentRef.trim();
    return PurchaseContextReportRequest(
      dramaId: dramaId,
      episodeId: episodeId,
      paymentRef: ref.isNotEmpty ? ref : null,
      productSku: productSku ?? this.productSku,
      source: source,
      store: paymentStore,
    );
  }
}

/// PurchaseContextReportDto：订阅/充值购买上下文（POST `/wallet/purchase/report`）。
///
/// 支付成功后一次性上报来源与 [paymentRef]；仅剧目归因时可只传
/// [paymentRef] / [dramaId] / [episodeId]。响应无业务 data。
class PurchaseContextReportRequest {
  /// 发起购买时所在剧目 ID；未传默认 0。
  final int? dramaId;

  /// 发起购买时所在分集 ID；未传默认 0。
  final int? episodeId;

  /// 支付关联标识（商店 transaction_id 或系统 order_no）；
  /// 订阅来源上报时必填，可与 `/wallet/balance/check` 一致。未传按空串。
  final String? paymentRef;

  /// 商品 SKU（Adapty/商店实时商品码）。
  final String? productSku;

  /// 购买入口来源；未传按 [PurchaseSource.other]。
  final PurchaseSource? source;

  /// 实际支付商店；订阅来源上报时必填。
  final PaymentStore? store;

  const PurchaseContextReportRequest({
    this.dramaId,
    this.episodeId,
    this.paymentRef,
    this.productSku,
    this.source,
    this.store,
  });

  /// 仅剧目归因：paymentRef + dramaId + episodeId。
  factory PurchaseContextReportRequest.dramaAttribution({
    required String paymentRef,
    int? dramaId,
    int? episodeId,
  }) {
    final ref = paymentRef.trim();
    return PurchaseContextReportRequest(
      dramaId: dramaId,
      episodeId: episodeId,
      paymentRef: ref.isNotEmpty ? ref : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ref = paymentRef?.trim() ?? '';
    final sku = productSku?.trim();
    return <String, dynamic>{
      'dramaId': dramaId ?? 0,
      'episodeId': episodeId ?? 0,
      'paymentRef': ref,
      if (sku != null && sku.isNotEmpty) 'productSku': sku,
      if (source != null) 'source': source!.value,
      if (store != null) 'store': store!.value,
    };
  }
}

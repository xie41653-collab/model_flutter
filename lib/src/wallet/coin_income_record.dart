/// 金币入账流水一条（CoinIncomeRecord）。
class CoinIncomeRecord {
  /// 入账后余额快照。
  final int? balanceAfter;

  /// 流水时间（毫秒）。
  final int? createdAt;

  /// 入账金币数。
  final int? gainCoins;

  /// 订单状态文案。
  final String? payStatus;

  /// 订单状态多语言 key。
  final String? payStatusI18nKey;

  /// 按 lang 翻译后的订单状态。
  final String? payStatusText;

  /// 渠道，如 GOOGLE、APPLE。
  final String? platform;

  /// IAP 商品 SKU。
  final String? productId;

  /// 幂等事务 ID。
  final String? txId;

  /// 业务类型整型。
  final int? type;

  /// 类型多语言 key。
  final String? typeI18nKey;

  /// 按 lang 翻译后的类型文案。
  final String? typeText;

  const CoinIncomeRecord({
    this.balanceAfter,
    this.createdAt,
    this.gainCoins,
    this.payStatus,
    this.payStatusI18nKey,
    this.payStatusText,
    this.platform,
    this.productId,
    this.txId,
    this.type,
    this.typeI18nKey,
    this.typeText,
  });

  factory CoinIncomeRecord.fromJson(Map<String, dynamic> json) {
    return CoinIncomeRecord(
      balanceAfter: _toInt(json['balanceAfter']),
      createdAt: _toInt(json['createdAt']),
      gainCoins: _toInt(json['gainCoins']),
      payStatus: json['payStatus']?.toString(),
      payStatusI18nKey: json['payStatusI18nKey']?.toString(),
      payStatusText: json['payStatusText']?.toString(),
      platform: json['platform']?.toString(),
      productId: json['productId']?.toString(),
      txId: json['txId']?.toString(),
      type: _toInt(json['type']),
      typeI18nKey: json['typeI18nKey']?.toString(),
      typeText: json['typeText']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balanceAfter': balanceAfter,
      'createdAt': createdAt,
      'gainCoins': gainCoins,
      'payStatus': payStatus,
      'payStatusI18nKey': payStatusI18nKey,
      'payStatusText': payStatusText,
      'platform': platform,
      'productId': productId,
      'txId': txId,
      'type': type,
      'typeI18nKey': typeI18nKey,
      'typeText': typeText,
    };
  }

  static int? _toInt(dynamic value) {
    return value is num ? value.toInt() : int.tryParse('$value');
  }
}

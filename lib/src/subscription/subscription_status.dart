/// SubscriptionStatus：当前用户订阅会员状态。
class SubscriptionStatus {
  /// 当前是否拥有有效会员权益；前端会员态判断优先使用该字段。
  final bool? active;

  /// 是否自动续费；取消续费后可能为 false，但到期前 active 仍可为 true。
  final bool? autoRenew;

  /// 会员权益到期时间，Unix 毫秒时间戳。
  final int? expiresAt;

  /// 套餐标识，如 week、month、year。
  final String? planCode;

  /// 后台配置的订阅商品名称。
  final String? productName;

  /// Adapty / 商店商品 ID，例如 week.vip1、year.vip1。
  final String? productSku;

  /// 订阅状态 code：1=有效，2=宽限期，3=已取消续费但未过期，4=已过期，5=已退款，6=已暂停。
  final int? status;

  /// 订阅状态展示名。
  final String? statusName;

  const SubscriptionStatus({
    this.active,
    this.autoRenew,
    this.expiresAt,
    this.planCode,
    this.productName,
    this.productSku,
    this.status,
    this.statusName,
  });

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) {
    return SubscriptionStatus(
      active: _readBool(json['active']),
      autoRenew: _readBool(json['autoRenew']),
      expiresAt: _readInt(json['expiresAt']),
      planCode: json['planCode']?.toString(),
      productName: json['productName']?.toString(),
      productSku: json['productSku']?.toString(),
      status: _readInt(json['status']),
      statusName: json['statusName']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'autoRenew': autoRenew,
      'expiresAt': expiresAt,
      'planCode': planCode,
      'productName': productName,
      'productSku': productSku,
      'status': status,
      'statusName': statusName,
    };
  }

  static bool? _readBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    final text = value.toString().toLowerCase();
    if (text == 'true') return true;
    if (text == 'false') return false;
    return null;
  }

  static int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}

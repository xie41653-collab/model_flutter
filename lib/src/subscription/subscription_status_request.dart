/// SubscriptionStatusDto：当前用户订阅会员状态查询入参。
class SubscriptionStatusRequest {
  /// Adapty / 商店 transaction_id；刷新会员态时可不传，购买后轮询必须传。
  final String? transactionId;

  const SubscriptionStatusRequest({this.transactionId});

  Map<String, dynamic> toJson() {
    final id = transactionId?.trim();
    return {if (id != null && id.isNotEmpty) 'transaction_id': id};
  }
}

/// 订阅权益发放轮询业务码。
class SubscriptionStatusCodes {
  SubscriptionStatusCodes._();

  /// 未发送权益，继续轮询。
  static const String pending = '202002';

  /// 订单不存在。
  static const String orderNotFound = '404004';
}

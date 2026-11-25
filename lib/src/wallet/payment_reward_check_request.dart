/// PaymentRewardCheckDto：支付发币轮询入参。
/// [paymentRef] 为商店 transaction_id（推荐）或系统 order_no。
class PaymentRewardCheckRequest {
  /// Adapty/Google Play Transaction ID（vp_payment.channel_trade_no）或 ORD 系统订单号。
  final String paymentRef;

  const PaymentRewardCheckRequest({required this.paymentRef});

  Map<String, dynamic> toJson() => {'paymentRef': paymentRef};
}

/// 支付发币轮询业务码。
class PaymentRewardCodes {
  PaymentRewardCodes._();

  /// 未发币，继续轮询。
  static const String pending = '202001';

  /// 订单不存在，停止轮询。
  static const String orderNotFound = '404004';
}

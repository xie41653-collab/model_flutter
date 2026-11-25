/// 钱包余额摘要（WalletSummary）。
class WalletSummary {
  /// 当前用户金币总余额。
  final int? coinBalance;

  const WalletSummary({this.coinBalance});

  factory WalletSummary.fromJson(Map<String, dynamic> json) {
    return WalletSummary(
      coinBalance: json['coinBalance'] is num
          ? (json['coinBalance'] as num).toInt()
          : int.tryParse('${json['coinBalance']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {'coinBalance': coinBalance};
  }
}

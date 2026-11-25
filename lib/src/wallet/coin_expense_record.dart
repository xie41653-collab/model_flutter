/// 金币消耗流水一条（CoinExpenseRecord）。
class CoinExpenseRecord {
  /// 扣费后余额快照。
  final int? balanceAfter;

  /// 流水时间（毫秒）。
  final int? createdAt;

  /// 剧目标题。
  final String? dramaTitle;

  /// 集序号。
  final int? episodeIndex;

  /// 幂等事务 ID。
  final String? txId;

  /// 业务类型整型。
  final int? type;

  /// 类型多语言 key。
  final String? typeI18nKey;

  /// 按 lang 翻译后的类型文案。
  final String? typeText;

  /// 本次消耗金币（正数展示）。
  final int? usedCoins;

  const CoinExpenseRecord({
    this.balanceAfter,
    this.createdAt,
    this.dramaTitle,
    this.episodeIndex,
    this.txId,
    this.type,
    this.typeI18nKey,
    this.typeText,
    this.usedCoins,
  });

  factory CoinExpenseRecord.fromJson(Map<String, dynamic> json) {
    return CoinExpenseRecord(
      balanceAfter: _toInt(json['balanceAfter']),
      createdAt: _toInt(json['createdAt']),
      dramaTitle: json['dramaTitle']?.toString(),
      episodeIndex: _toInt(json['episodeIndex']),
      txId: json['txId']?.toString(),
      type: _toInt(json['type']),
      typeI18nKey: json['typeI18nKey']?.toString(),
      typeText: json['typeText']?.toString(),
      usedCoins: _toInt(json['usedCoins']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balanceAfter': balanceAfter,
      'createdAt': createdAt,
      'dramaTitle': dramaTitle,
      'episodeIndex': episodeIndex,
      'txId': txId,
      'type': type,
      'typeI18nKey': typeI18nKey,
      'typeText': typeText,
      'usedCoins': usedCoins,
    };
  }

  static int? _toInt(dynamic value) {
    return value is num ? value.toInt() : int.tryParse('$value');
  }
}

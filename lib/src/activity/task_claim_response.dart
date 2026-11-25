/// TaskClaimResponse：任务领奖结果；成功时金币已到账。
class TaskClaimResponse {
  /// 领取后余额。
  final int? balanceAfter;

  /// true=重复领取（已领过），按成功态展示即可。
  final bool? duplicateRequest;

  /// 本次到账金币。
  final int? rewardCoins;

  /// 成功后为 3=已领取。
  final int? taskStatus;

  const TaskClaimResponse({
    this.balanceAfter,
    this.duplicateRequest,
    this.rewardCoins,
    this.taskStatus,
  });

  factory TaskClaimResponse.fromJson(Map<String, dynamic> json) {
    return TaskClaimResponse(
      balanceAfter: _readInt(json['balanceAfter']),
      duplicateRequest: _readBool(json['duplicateRequest']),
      rewardCoins: _readInt(json['rewardCoins']),
      taskStatus: _readInt(json['taskStatus']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balanceAfter': balanceAfter,
      'duplicateRequest': duplicateRequest,
      'rewardCoins': rewardCoins,
      'taskStatus': taskStatus,
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

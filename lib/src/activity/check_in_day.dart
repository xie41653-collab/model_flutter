/// 签到日历一天状态：SIGNED / MISSED / TODAY / FUTURE。
enum CheckInStatus { signed, missed, today, future }

extension CheckInStatusCodec on CheckInStatus {
  String get apiValue {
    switch (this) {
      case CheckInStatus.signed:
        return 'SIGNED';
      case CheckInStatus.missed:
        return 'MISSED';
      case CheckInStatus.today:
        return 'TODAY';
      case CheckInStatus.future:
        return 'FUTURE';
    }
  }

  static CheckInStatus? fromApi(String? raw) {
    switch (raw?.trim().toUpperCase()) {
      case 'SIGNED':
        return CheckInStatus.signed;
      case 'MISSED':
        return CheckInStatus.missed;
      case 'TODAY':
        return CheckInStatus.today;
      case 'FUTURE':
        return CheckInStatus.future;
      default:
        return null;
    }
  }
}

/// CheckInDay：签到日历一天。
class CheckInDay {
  /// 是否大奖日。
  final bool? bigReward;

  /// 周期内日序 1～7。
  final int? dayNo;

  /// 当地日期 yyyy-MM-dd。
  final String? localDate;

  /// 该日奖励金币。
  final int? rewardAmount;

  /// SIGNED / MISSED / TODAY / FUTURE。
  final CheckInStatus? status;

  const CheckInDay({
    this.bigReward,
    this.dayNo,
    this.localDate,
    this.rewardAmount,
    this.status,
  });

  factory CheckInDay.fromJson(Map<String, dynamic> json) {
    return CheckInDay(
      bigReward: _readBool(json['bigReward']),
      dayNo: _readInt(json['dayNo']),
      localDate: json['localDate']?.toString(),
      rewardAmount: _readInt(json['rewardAmount']),
      status: CheckInStatusCodec.fromApi(json['status']?.toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bigReward': bigReward,
      'dayNo': dayNo,
      'localDate': localDate,
      'rewardAmount': rewardAmount,
      'status': status?.apiValue,
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

/// CheckInResponse：签到结果；成功时当天金币已到账。
class CheckInResponse {
  /// 签到后余额。
  final int? balanceAfter;

  /// 刷新签到日历 UI。
  final List<CheckInDay>? calendar;

  /// 当前连续签到天数。
  final int? currentStreak;

  /// 签到周期序号。
  final int? cycleNo;

  /// 当前 7 日周期内的日序 1～7。
  final int? dayNo;

  /// true=今日已签过，不会二次发币。
  final bool? duplicateRequest;

  /// 本次签到到账金币（重复签到可为 0）。
  final int? rewardCoins;

  const CheckInResponse({
    this.balanceAfter,
    this.calendar,
    this.currentStreak,
    this.cycleNo,
    this.dayNo,
    this.duplicateRequest,
    this.rewardCoins,
  });

  factory CheckInResponse.fromJson(Map<String, dynamic> json) {
    return CheckInResponse(
      balanceAfter: CheckInDay._readInt(json['balanceAfter']),
      calendar: json['calendar'] is List
          ? (json['calendar'] as List)
                .whereType<Map>()
                .map((e) => CheckInDay.fromJson(Map<String, dynamic>.from(e)))
                .toList()
          : null,
      currentStreak: CheckInDay._readInt(json['currentStreak']),
      cycleNo: CheckInDay._readInt(json['cycleNo']),
      dayNo: CheckInDay._readInt(json['dayNo']),
      duplicateRequest: CheckInDay._readBool(json['duplicateRequest']),
      rewardCoins: CheckInDay._readInt(json['rewardCoins']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balanceAfter': balanceAfter,
      'calendar': calendar?.map((e) => e.toJson()).toList(),
      'currentStreak': currentStreak,
      'cycleNo': cycleNo,
      'dayNo': dayNo,
      'duplicateRequest': duplicateRequest,
      'rewardCoins': rewardCoins,
    };
  }
}

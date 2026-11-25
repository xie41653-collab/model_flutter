/// WatchReportResponse：活动观看累计上报结果。
class WatchReportResponse {
  /// 本次是否计入活动进度。
  final bool? accepted;

  /// 本次接受的整秒增量；未接受为 0。
  final int? acceptedDeltaSec;

  /// 未计入原因（INVALID_DELTA / VIP / NO_PARTICIPATION / CAMPAIGN_DISABLED 等）。
  final String? rejectReason;

  const WatchReportResponse({
    this.accepted,
    this.acceptedDeltaSec,
    this.rejectReason,
  });

  factory WatchReportResponse.fromJson(Map<String, dynamic> json) {
    return WatchReportResponse(
      accepted: _readBool(json['accepted']),
      acceptedDeltaSec: _readInt(json['acceptedDeltaSec']),
      rejectReason: json['rejectReason']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accepted': accepted,
      'acceptedDeltaSec': acceptedDeltaSec,
      'rejectReason': rejectReason,
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

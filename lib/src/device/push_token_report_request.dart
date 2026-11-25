/// PushTokenReportDto：上报 FCM registration token 和/或系统通知权限状态。
///
/// [fcmToken] 与 [notificationEnabled] 至少传一个；须已登录。
/// [platform] 固定必传：Android=1，iOS=2。
class PushTokenReportRequest {
  /// FCM registration token；可为空，仅上报权限状态时不传。
  final String? fcmToken;

  /// 是否开启系统通知权限；可为空，仅上报 token 时可不传。
  final bool? notificationEnabled;

  /// Android=1，iOS=2。
  final int platform;

  PushTokenReportRequest({
    required this.platform,
    this.fcmToken,
    this.notificationEnabled,
  }) : assert(platform == 1 || platform == 2),
       assert(
         (fcmToken != null && fcmToken.trim().isNotEmpty) ||
             notificationEnabled != null,
         'fcmToken and notificationEnabled require at least one',
       );

  Map<String, dynamic> toJson() {
    final token = fcmToken?.trim();
    return <String, dynamic>{
      'platform': platform,
      if (token != null && token.isNotEmpty) 'fcmToken': token,
      if (notificationEnabled != null)
        'notificationEnabled': notificationEnabled,
    };
  }
}

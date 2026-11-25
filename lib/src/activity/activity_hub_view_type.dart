import 'check_in_day.dart';
import 'early_access_drama.dart';
import 'activity_task.dart';

/// Activity Hub 视图类型：1=FREE；2=VIP；3=NONE。
abstract final class ActivityHubViewType {
  static const int free = 1;
  static const int vip = 2;
  static const int none = 3;
}

/// ActivityHub：Activity Hub 主页面（扁平结构）。
///
/// 先看 [viewType]：
/// - 1=FREE：用 [calendar] / [tasks] / [earlyAccessDramas]
/// - 2=VIP：用 [earlyAccessDramas]（+ [vipExpiresAt]）
/// - 3=NONE：无活动；若 [earlyAccessDramas] 有值仍展示早鸟 UI
///
/// 页面空态：`viewType` 为 1/2/3 时，仅当 calendar、tasks、earlyAccessDramas
/// 均为空才展示。
class ActivityHub {
  /// FREE 的 7 日签到日历（只读）。VIP/NONE 为空数组。
  ///
  /// 每天含 rewardAmount、bigReward、status（SIGNED/MISSED/TODAY/FUTURE）。
  /// 点签到后用 `/activity/check-in` 返回的 calendar 刷新。
  final List<CheckInDay>? calendar;

  /// 当前命中活动 ID；VIP/NONE 为 null。
  final int? campaignId;

  /// 活动名称（后台配置，可展示）。
  final String? campaignName;

  /// 当前连续签到天数；仅 FREE 有值。
  final int? currentStreak;

  /// 抢先看列表；FREE/VIP 均可有值，可为空数组。
  final List<EarlyAccessDrama>? earlyAccessDramas;

  /// 参与代次序号；VIP/NONE 为 null。
  final int? generation;

  /// FREE 时的参与代次 ID；播放上报活动字段用此值。VIP/NONE 为 null。
  final int? participationId;

  /// 服务端当前时间毫秒，可用于倒计时校准。
  final int? serverTime;

  /// More ways to earn 任务列表（不含每日签到）。VIP/NONE 为空数组。
  final List<ActivityTask>? tasks;

  /// 本参与使用的时区（IANA）；VIP/NONE 为 null。
  final String? timezone;

  /// 1=FREE 普通活动页；2=VIP 会员页；3=NONE 无活动。
  final int? viewType;

  /// 会员到期时间毫秒；非 VIP 为 null。
  final int? vipExpiresAt;

  /// 当前金币余额（可用于页头展示）。
  final int? walletBalance;

  const ActivityHub({
    this.calendar,
    this.campaignId,
    this.campaignName,
    this.currentStreak,
    this.earlyAccessDramas,
    this.generation,
    this.participationId,
    this.serverTime,
    this.tasks,
    this.timezone,
    this.viewType,
    this.vipExpiresAt,
    this.walletBalance,
  });

  ActivityHub copyWith({List<ActivityTask>? tasks}) {
    return ActivityHub(
      calendar: calendar,
      campaignId: campaignId,
      campaignName: campaignName,
      currentStreak: currentStreak,
      earlyAccessDramas: earlyAccessDramas,
      generation: generation,
      participationId: participationId,
      serverTime: serverTime,
      tasks: tasks ?? this.tasks,
      timezone: timezone,
      viewType: viewType,
      vipExpiresAt: vipExpiresAt,
      walletBalance: walletBalance,
    );
  }

  factory ActivityHub.fromJson(Map<String, dynamic> json) {
    return ActivityHub(
      calendar: _readCalendar(json['calendar']),
      campaignId: _readInt(json['campaignId']),
      campaignName: json['campaignName']?.toString(),
      currentStreak: _readInt(json['currentStreak']),
      earlyAccessDramas: _readEarlyAccessList(json['earlyAccessDramas']),
      generation: _readInt(json['generation']),
      participationId: _readInt(json['participationId']),
      serverTime: _readInt(json['serverTime']),
      tasks: _readTaskList(json['tasks']),
      timezone: json['timezone']?.toString(),
      viewType: _readInt(json['viewType']),
      vipExpiresAt: _readInt(json['vipExpiresAt']),
      walletBalance: _readInt(json['walletBalance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calendar': calendar?.map((e) => e.toJson()).toList(),
      'campaignId': campaignId,
      'campaignName': campaignName,
      'currentStreak': currentStreak,
      'earlyAccessDramas': earlyAccessDramas?.map((e) => e.toJson()).toList(),
      'generation': generation,
      'participationId': participationId,
      'serverTime': serverTime,
      'tasks': tasks?.map((e) => e.toJson()).toList(),
      'timezone': timezone,
      'viewType': viewType,
      'vipExpiresAt': vipExpiresAt,
      'walletBalance': walletBalance,
    };
  }

  static int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }

  /// 抢先看列表解析（兼容元素为 Map 的各种运行时类型）。
  static List<EarlyAccessDrama>? _readEarlyAccessList(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    final out = <EarlyAccessDrama>[];
    for (final item in value) {
      if (item is Map) {
        out.add(EarlyAccessDrama.fromJson(Map<String, dynamic>.from(item)));
      }
    }
    return out;
  }

  /// 任务列表解析。
  static List<ActivityTask>? _readTaskList(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    final out = <ActivityTask>[];
    for (final item in value) {
      if (item is Map) {
        out.add(ActivityTask.fromJson(Map<String, dynamic>.from(item)));
      }
    }
    return out;
  }

  /// 签到日历解析。
  static List<CheckInDay>? _readCalendar(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;
    final out = <CheckInDay>[];
    for (final item in value) {
      if (item is Map) {
        out.add(CheckInDay.fromJson(Map<String, dynamic>.from(item)));
      }
    }
    return out;
  }
}

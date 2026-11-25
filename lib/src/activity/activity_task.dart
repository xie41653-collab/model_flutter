/// ActivityTask：任务卡片。
///
/// 用 [status] / [actionType] 决定按钮；进度文案用 progress + target + unit 拼接，
/// 不要把 progress 拼进 description。
class ActivityTask {
  /// 建议动作：0=无；1=打开系统通知设置；2=打开剧目（用 dramaId）；3=调用领取接口。
  final int? actionType;

  /// 副标题/说明（可空；不是进度行）。指定剧时多为剧名。
  final String? description;

  /// 指定剧剧名（若接口单独下发；优先于 description）。
  final String? dramaTitle;

  /// 指定剧任务的剧目 ID；其它任务多为 0。
  final int? dramaId;

  /// 当前进度数值。
  final int? progress;

  /// 完成后可领金币数。
  final int? rewardCoins;

  /// 列表排序，升序。
  final int? sortOrder;

  /// 1=进行中；2=待领取（可点领取）；3=已领取。
  final int? status;

  /// 目标数值。
  final int? target;

  /// 任务主标题（直接展示）。
  final String? title;

  /// 2=连续签到；3=开启通知；4=指定剧集；5=看剧时长。每日签到不在本列表。
  final int? type;

  /// 1=秒；2=集；3=天；4=布尔（完成与否）。客户端据此拼「18/30 min」等。
  final int? unit;

  /// 用户任务 ID；领取接口必传。
  final int? userTaskId;

  const ActivityTask({
    this.actionType,
    this.description,
    this.dramaTitle,
    this.dramaId,
    this.progress,
    this.rewardCoins,
    this.sortOrder,
    this.status,
    this.target,
    this.title,
    this.type,
    this.unit,
    this.userTaskId,
  });

  /// 指定剧副标题用的剧名：dramaTitle > description。
  String get displayDramaName {
    final a = dramaTitle?.trim();
    if (a != null && a.isNotEmpty) return a;
    final b = description?.trim();
    if (b != null && b.isNotEmpty) return b;
    return '';
  }

  ActivityTask copyWith({
    int? actionType,
    String? description,
    String? dramaTitle,
    int? progress,
    int? status,
    int? target,
  }) {
    return ActivityTask(
      actionType: actionType ?? this.actionType,
      description: description ?? this.description,
      dramaTitle: dramaTitle ?? this.dramaTitle,
      dramaId: dramaId,
      progress: progress ?? this.progress,
      rewardCoins: rewardCoins,
      sortOrder: sortOrder,
      status: status ?? this.status,
      target: target ?? this.target,
      title: title,
      type: type,
      unit: unit,
      userTaskId: userTaskId,
    );
  }

  factory ActivityTask.fromJson(Map<String, dynamic> json) {
    return ActivityTask(
      actionType: _readInt(json['actionType']),
      description: json['description']?.toString(),
      dramaTitle: (json['dramaTitle'] ?? json['dramaName'])?.toString(),
      dramaId: _readInt(json['dramaId']),
      progress: _readInt(json['progress']),
      rewardCoins: _readInt(json['rewardCoins']),
      sortOrder: _readInt(json['sortOrder']),
      status: _readInt(json['status']),
      target: _readInt(json['target']),
      title: json['title']?.toString(),
      type: _readInt(json['type']),
      unit: _readInt(json['unit']),
      userTaskId: _readInt(json['userTaskId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'actionType': actionType,
      'description': description,
      'dramaTitle': dramaTitle,
      'dramaId': dramaId,
      'progress': progress,
      'rewardCoins': rewardCoins,
      'sortOrder': sortOrder,
      'status': status,
      'target': target,
      'title': title,
      'type': type,
      'unit': unit,
      'userTaskId': userTaskId,
    };
  }

  static int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}

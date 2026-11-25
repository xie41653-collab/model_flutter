/// 卡片点击建议动作。
///
/// SUBSCRIBE=去订阅；OPEN_DRAMA=打开剧目；WAIT_PUBLIC=等待公开发布。
enum EarlyAccessAction { openDrama, subscribe, waitPublic }

extension EarlyAccessActionCodec on EarlyAccessAction {
  String get apiValue {
    switch (this) {
      case EarlyAccessAction.openDrama:
        return 'OPEN_DRAMA';
      case EarlyAccessAction.subscribe:
        return 'SUBSCRIBE';
      case EarlyAccessAction.waitPublic:
        return 'WAIT_PUBLIC';
    }
  }

  static EarlyAccessAction? fromApi(String? raw) {
    switch (raw?.trim().toUpperCase()) {
      case 'OPEN_DRAMA':
        return EarlyAccessAction.openDrama;
      case 'SUBSCRIBE':
        return EarlyAccessAction.subscribe;
      case 'WAIT_PUBLIC':
        return EarlyAccessAction.waitPublic;
      default:
        return null;
    }
  }
}

/// EarlyAccessDrama：抢先看剧目卡片。
class EarlyAccessDrama {
  /// 访问状态（与剧目详情 accessState 同语义）。
  final String? accessState;

  /// 卡片点击建议动作。
  final EarlyAccessAction? actionType;

  /// 封面 URL。
  final String? coverUrl;

  /// 剧目 ID。
  final int? dramaId;

  /// 相对公开发布提前可看的天数。
  final int? earlyAccessDays;

  /// 最近播放分集 ID；无进度时为 null。
  final int? lastEpisodeId;

  /// 会员可开始观看的时间（毫秒）。
  final int? memberAccessAt;

  /// 公开发布时间（毫秒）。
  final int? publicReleaseAt;

  /// 剧名。
  final String? title;

  const EarlyAccessDrama({
    this.accessState,
    this.actionType,
    this.coverUrl,
    this.dramaId,
    this.earlyAccessDays,
    this.lastEpisodeId,
    this.memberAccessAt,
    this.publicReleaseAt,
    this.title,
  });

  factory EarlyAccessDrama.fromJson(Map<String, dynamic> json) {
    return EarlyAccessDrama(
      accessState: json['accessState']?.toString(),
      actionType: EarlyAccessActionCodec.fromApi(
        json['actionType']?.toString(),
      ),
      coverUrl: (json['coverUrl'] ?? json['cover'] ?? json['posterUrl'])
          ?.toString(),
      dramaId: _readInt(json['dramaId']),
      earlyAccessDays: _readInt(
        json['earlyAccessDays'] ?? json['earlyAccessDay'],
      ),
      lastEpisodeId: _readInt(json['lastEpisodeId']),
      memberAccessAt: _readInt(json['memberAccessAt']),
      publicReleaseAt: _readInt(
        json['publicReleaseAt'] ?? json['publicReleaseTime'],
      ),
      title: (json['title'] ?? json['dramaTitle'] ?? json['name'])?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessState': accessState,
      'actionType': actionType?.apiValue,
      'coverUrl': coverUrl,
      'dramaId': dramaId,
      'earlyAccessDays': earlyAccessDays,
      'lastEpisodeId': lastEpisodeId,
      'memberAccessAt': memberAccessAt,
      'publicReleaseAt': publicReleaseAt,
      'title': title,
    };
  }

  static int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}

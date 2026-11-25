/// UserVo，用户对外展示资料与钱包摘要。
class UserProfile {
  /// 用户主键。
  final int? userId;

  /// 昵称。
  final String? nickname;

  /// 头像完整 URL。
  final String? avatarUrl;

  /// 性别 1 男 2 女。
  final int? gender;

  /// 生日毫秒时间戳；0 表示未填。
  final int? birthdate;

  /// 偏好语言代码。
  final String? lang;

  /// 国家/地区简码。
  final String? country;

  /// 当前金币余额（钱包表聚合）。
  final int? coinBalance;

  /// 是否充值过（`true`=已充值/非首充，`false`=未充值/首充）。
  final bool hasRecharged;

  /// 是否为审核员账号。
  final bool? reviewer;

  /// 当前设备归因价格档位（vp_device_attr.price_tier）；无 deviceId 或无记录时为 0。
  final int? priceTier;

  const UserProfile({
    this.userId,
    this.nickname,
    this.avatarUrl,
    this.gender,
    this.birthdate,
    this.lang,
    this.country,
    this.coinBalance,
    this.hasRecharged = false,
    this.reviewer,
    this.priceTier,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: _readInt(json['userId']),
      nickname: json['nickname']?.toString(),
      avatarUrl: json['avatarUrl']?.toString(),
      gender: _readInt(json['gender']),
      birthdate: _readInt(json['birthdate']),
      lang: json['lang']?.toString(),
      country: json['country']?.toString(),
      coinBalance: _readInt(json['coinBalance']),
      hasRecharged: _readBool(json['hasRecharged']) ?? false,
      reviewer: _readBool(json['reviewer']),
      priceTier: _readInt(json['priceTier']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'gender': gender,
      'birthdate': birthdate,
      'lang': lang,
      'country': country,
      'coinBalance': coinBalance,
      'hasRecharged': hasRecharged,
      'reviewer': reviewer,
      'priceTier': priceTier,
    };
  }

  UserProfile copyWith({
    int? userId,
    String? nickname,
    String? avatarUrl,
    int? gender,
    int? birthdate,
    String? lang,
    String? country,
    int? coinBalance,
    bool? hasRecharged,
    bool? reviewer,
    int? priceTier,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      lang: lang ?? this.lang,
      country: country ?? this.country,
      coinBalance: coinBalance ?? this.coinBalance,
      hasRecharged: hasRecharged ?? this.hasRecharged,
      reviewer: reviewer ?? this.reviewer,
      priceTier: priceTier ?? this.priceTier,
    );
  }

  static int? _readInt(dynamic v) {
    if (v is num) return v.toInt();
    return int.tryParse('$v');
  }

  static bool? _readBool(dynamic v) {
    if (v is bool) return v;
    if (v is num) return v != 0;
    return null;
  }
}

import '../userinfo/user_profile.dart';

/// GuestLoginResponse，/auth/guest 返回 data 节点。
class GuestLoginResponse {
  /// JWT 原始串（不含 Bearer），客户端自行拼接 Authorization。
  final String? token;

  /// 用户资料摘要。
  final UserProfile? userVo;

  const GuestLoginResponse({this.token, this.userVo});

  factory GuestLoginResponse.fromJson(Map<String, dynamic> json) {
    return GuestLoginResponse(
      token: json['token']?.toString(),
      userVo: json['userVo'] is Map<String, dynamic>
          ? UserProfile.fromJson(json['userVo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {'token': token, 'userVo': userVo?.toJson()};
}

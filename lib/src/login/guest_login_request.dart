/// /auth/guest 请求参数
class GuestLoginRequest {
  /// 应用包 ID，可选
  final int? pkgId;

  const GuestLoginRequest({this.pkgId});

  Map<String, dynamic> toJson() => {if (pkgId != null) 'pkgId': pkgId};
}

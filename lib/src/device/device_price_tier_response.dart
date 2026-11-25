/// DevicePriceTierResponse：当前设备 priceTier 归因档位查询结果。
class DevicePriceTierResponse {
  /// 0=不可见隐藏剧集，1=可见隐藏剧集；无 vp_device_attr 记录时为 0。
  final int? priceTier;

  const DevicePriceTierResponse({this.priceTier});

  factory DevicePriceTierResponse.fromJson(Map<String, dynamic> json) {
    return DevicePriceTierResponse(priceTier: _readInt(json['priceTier']));
  }

  Map<String, dynamic> toJson() => {'priceTier': priceTier};

  static int? _readInt(dynamic v) {
    if (v is num) return v.toInt();
    return int.tryParse('$v');
  }
}

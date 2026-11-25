/// DevicePriceTierDto：设备 priceTier 归因档位（控制是否可见隐藏剧集）。
class DevicePriceTierRequest {
  /// 0=不可见隐藏剧集，1=可见隐藏剧集。
  final int priceTier;

  const DevicePriceTierRequest({required this.priceTier});

  Map<String, dynamic> toJson() => {'priceTier': priceTier};
}

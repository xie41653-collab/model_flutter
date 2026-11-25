/// DramaAttributionActivateDto：指定剧目归因即时激活请求。
class DramaAttributionRequest {
  /// 客户端从深链或广告落地页解析到的剧目 ID。
  final int dramaId;

  const DramaAttributionRequest({required this.dramaId});

  Map<String, dynamic> toJson() => {'dramaId': dramaId};
}

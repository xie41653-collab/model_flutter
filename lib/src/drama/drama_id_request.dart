/// DramaIdDto：仅含剧目 ID 的请求体（如剧目详情、分集列表、续播分集查询等）。
class DramaIdRequest {
  /// 剧目 ID。
  final int dramaId;

  const DramaIdRequest({required this.dramaId});

  Map<String, dynamic> toJson() => {'dramaId': dramaId};
}

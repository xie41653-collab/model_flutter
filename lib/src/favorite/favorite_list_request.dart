/// 我的收藏列表分页参数（PageDto）。
class FavoriteListRequest {
  /// 页码，默认 1。
  final int? pageNo;

  /// 每页条数，默认 20，服务端限制最大 100。
  final int? pageSize;

  const FavoriteListRequest({this.pageNo, this.pageSize});

  Map<String, dynamic> toJson() {
    return {
      if (pageNo != null) 'pageNo': pageNo,
      if (pageSize != null) 'pageSize': pageSize,
    };
  }
}

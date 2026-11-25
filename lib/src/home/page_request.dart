/// 通用分页参数（PageDto，POST Body）。
class PageRequest {
  /// 页码，默认 1。
  final int? pageNo;

  /// 每页条数，默认 20，服务端限制最大 100。
  final int? pageSize;

  const PageRequest({this.pageNo, this.pageSize});

  Map<String, dynamic> toJson() {
    return {
      if (pageNo != null) 'pageNo': pageNo,
      if (pageSize != null) 'pageSize': pageSize,
    };
  }
}

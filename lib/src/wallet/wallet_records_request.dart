/// 钱包流水分页查询（WalletRecordDto，继承通用分页字段）。
class WalletRecordsRequest {
  /// 页码，默认 1。
  final int? pageNo;

  /// 每页条数，默认 20，服务端限制最大 100。
  final int? pageSize;

  /// 筛选结束时间（毫秒，可选）。
  final int? endTime;

  /// 筛选起始时间（毫秒，可选）。
  final int? startTime;

  /// 1 消耗记录；2 获得记录。
  final int? type;

  const WalletRecordsRequest({
    this.pageNo,
    this.pageSize,
    this.endTime,
    this.startTime,
    this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      if (pageNo != null) 'pageNo': pageNo,
      if (pageSize != null) 'pageSize': pageSize,
      if (endTime != null) 'endTime': endTime,
      if (startTime != null) 'startTime': startTime,
      if (type != null) 'type': type,
    };
  }
}

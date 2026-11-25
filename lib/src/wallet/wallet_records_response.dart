import 'coin_income_record.dart';
import 'coin_expense_record.dart';

/// 钱包流水分页（WalletRecordsResponse，消耗与获得二选一填充）。
class WalletRecordsResponse {
  /// type 为获得时有效。
  final List<CoinIncomeRecord>? gainRecords;

  /// 当前页码。
  final int? pageNo;

  /// 每页条数。
  final int? pageSize;

  /// 总条数。
  final int? total;

  /// 与请求 WalletRecordDto.type 一致。
  final int? type;

  /// type 为消耗时有效。
  final List<CoinExpenseRecord>? usageRecords;

  const WalletRecordsResponse({
    this.gainRecords,
    this.pageNo,
    this.pageSize,
    this.total,
    this.type,
    this.usageRecords,
  });

  factory WalletRecordsResponse.fromJson(Map<String, dynamic> json) {
    return WalletRecordsResponse(
      gainRecords: json['gainRecords'] is List
          ? (json['gainRecords'] as List<dynamic>)
                .map(
                  (e) => CoinIncomeRecord.fromJson(
                    Map<String, dynamic>.from(e as Map),
                  ),
                )
                .toList()
          : null,
      pageNo: _toInt(json['pageNo']),
      pageSize: _toInt(json['pageSize']),
      total: _toInt(json['total']),
      type: _toInt(json['type']),
      usageRecords: json['usageRecords'] is List
          ? (json['usageRecords'] as List<dynamic>)
                .map(
                  (e) => CoinExpenseRecord.fromJson(
                    Map<String, dynamic>.from(e as Map),
                  ),
                )
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gainRecords': gainRecords?.map((e) => e.toJson()).toList(),
      'pageNo': pageNo,
      'pageSize': pageSize,
      'total': total,
      'type': type,
      'usageRecords': usageRecords?.map((e) => e.toJson()).toList(),
    };
  }

  static int? _toInt(dynamic value) {
    return value is num ? value.toInt() : int.tryParse('$value');
  }
}

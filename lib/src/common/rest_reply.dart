/// 统一API响应模型
class RestReply<T> {
  /// 响应数据
  final T? result;

  /// 响应码
  final String resultCode;

  /// 响应消息
  final String resultMessage;

  RestReply({
    required this.resultCode,
    required this.resultMessage,
    this.result,
  });

  /// 是否请求失败
  bool get failed => !succeeded;

  /// 是否请求成功
  bool get succeeded => resultCode == '200' || resultCode == '0';

  /// 编码泛型对象时传入 encodeBody；基础 JSON 数据可直接输出。
  Map<String, dynamic> toJson({Object? Function(T value)? encodeBody}) => {
    'code': resultCode,
    'message': resultMessage,
    'data': result == null
        ? null
        : (encodeBody == null ? result : encodeBody(result as T)),
  };

  @override
  String toString() {
    return 'RestReply{code: $resultCode, message: $resultMessage, data: $result}';
  }

  /// 从JSON构造响应对象
  factory RestReply.parseMap(
    Map<String, dynamic> json,
    T? Function(dynamic)? decodeBody,
  ) {
    return RestReply<T>(
      resultCode: json['code']?.toString() ?? '00000',
      resultMessage: (json['message'] ?? json['msg'])?.toString() ?? '',
      result: json['data'] != null && decodeBody != null
          ? decodeBody(json['data'])
          : json['data'] as T?,
    );
  }
}

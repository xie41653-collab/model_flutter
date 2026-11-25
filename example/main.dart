import 'dart:convert';
import 'package:model_flutter/model_flutter.dart';

void main() {
  final request = const GuestLoginRequest(pkgId: 1);
  print(jsonEncode(request.toJson()));

  // 实际项目中将 HTTP 响应传给模型，网络请求由项目自行实现。
  final reply = RestReply<GuestLoginResponse>.parseMap({
    'code': 200,
    'data': {'token': 'example-token'},
  }, (data) => GuestLoginResponse.fromJson(data as Map<String, dynamic>));
  print(reply.result?.token);
}

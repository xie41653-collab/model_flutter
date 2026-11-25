import 'dart:convert';
import 'package:model_flutter/model_flutter.dart';
import 'package:model_flutter/legacy.dart' as legacy;
import 'package:test/test.dart';

void main() {
  test('请求省略未提供字段，保留 false 与分页参数', () {
    expect(const GuestLoginRequest().toJson(), isEmpty);
    expect(const PageRequest(pageNo: 2, pageSize: 20).toJson(), {
      'pageNo': 2,
      'pageSize': 20,
    });
    expect(
      PushTokenReportRequest(platform: 2, notificationEnabled: false).toJson(),
      {'platform': 2, 'notificationEnabled': false},
    );
    expect(PushTokenReportRequest(platform: 1, fcmToken: ' token ').toJson(), {
      'platform': 1,
      'fcmToken': 'token',
    });
  });
  test('首页嵌套模型、宽松数值与枚举解析并往返编码', () {
    final feed = HomeFeed.fromJson({
      'forYou': {
        'items': [
          {
            'dramaId': '12',
            'favoriteFlag': '1',
            'heatScore': '2.5',
            'actionType': 'OPEN_DRAMA',
            'title': '示例',
          },
        ],
      },
    });
    final card = feed.forYou!.items!.single;
    expect(card.dramaId, 12);
    expect(card.favoriteFlag, true);
    expect(card.heatScore, 2.5);
    expect(card.actionType, DramaCardAction.openDrama);
    expect(
      HomeFeed.fromJson(jsonDecode(jsonEncode(feed.toJson()))).toJson(),
      feed.toJson(),
    );
  });
  test('登录嵌套响应及旧名称兼容', () {
    final response = legacy.OnyxSpire.fromJson({
      'token': 'sample',
      'userVo': {'userId': 7},
    });
    expect(response, isA<GuestLoginResponse>());
    expect(response.userVo, isA<UserProfile>());
    expect(jsonDecode(jsonEncode(response.toJson()))['token'], 'sample');
  });
  test('支付商店由调用方提供，保留后端枚举值', () {
    final request = const PurchaseContext(
      source: PurchaseSource.profile,
    ).toReportRequest(paymentRef: ' tx ', paymentStore: PaymentStore.appStore);
    expect(request.toJson(), {
      'dramaId': 0,
      'episodeId': 0,
      'paymentRef': 'tx',
      'source': 3,
      'store': 1,
    });
    expect(PaymentStore.fromValue(99), isNull);
    expect(PurchaseSource.fromValue(null), PurchaseSource.other);
  });
  test('统一响应码、泛型解码与序列化', () {
    for (final code in [200, '0', '202001']) {
      final reply = RestReply<GuestLoginResponse>.parseMap({
        'code': code,
        'msg': 'ok',
        'data': {'token': 'sample'},
      }, (data) => GuestLoginResponse.fromJson(data as Map<String, dynamic>));
      expect(reply.succeeded, code != '202001');
      expect(
        reply.toJson(encodeBody: (value) => value.toJson())['data'],
        containsPair('token', 'sample'),
      );
    }
    expect(RestReply<Object>.parseMap({'code': '200'}, null).result, isNull);
  });
}

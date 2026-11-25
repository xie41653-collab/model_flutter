import 'drama_card.dart';

/// HomeSection：首页横向分区条（无分页）。
///
/// 对应接口中 forYou / topChart / newReleased / earlyAccess / coming-soon 各分区结构。
class HomeSection {
  /// 剧目卡片列表。无内容时为空数组，不为 null。
  final List<DramaCard>? items;

  /// 分区业务编码（如 FOR_YOU）。
  final String? sectionCode;

  /// 分区展示标题。
  final String? sectionTitle;

  const HomeSection({this.items, this.sectionCode, this.sectionTitle});

  factory HomeSection.fromJson(Map<String, dynamic> json) {
    return HomeSection(
      items: json['items'] is List
          ? (json['items'] as List)
                .whereType<Map>()
                .map((e) => DramaCard.fromJson(Map<String, dynamic>.from(e)))
                .toList()
          : const <DramaCard>[],
      sectionCode: json['sectionCode']?.toString(),
      sectionTitle: json['sectionTitle']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((e) => e.toJson()).toList(),
      'sectionCode': sectionCode,
      'sectionTitle': sectionTitle,
    };
  }
}

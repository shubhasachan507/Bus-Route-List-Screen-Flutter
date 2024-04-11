import 'package:json_annotation/json_annotation.dart';

part 'route_info.g.dart';

@JsonSerializable()
class RouteInfo {
  RouteInfo({
    required this.id,
    required this.name,
    required this.source,
    required this.tripDuration,
    required this.destination,
    required this.icon,
  });

  String id;
  String name;
  String source;
  String tripDuration;
  String destination;
  String icon;

  factory RouteInfo.fromJson(Map<String, dynamic> json) =>
      _$RouteInfoFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/data/model/route_timing.dart';
import 'package:test_app/data/model/route_info.dart';

part 'routes.g.dart';

@JsonSerializable()
class Routes {
  Routes({
    required this.routeInfo,
    required this.routeTimings,
  });

  List<RouteInfo> routeInfo;
  Map<String, List<RouteTiming>> routeTimings;

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
}

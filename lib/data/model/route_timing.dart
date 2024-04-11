import 'package:json_annotation/json_annotation.dart';

part 'route_timing.g.dart';

@JsonSerializable()
class RouteTiming {
  RouteTiming({
    required this.totalSeats,
    required this.avaiable,
    required this.tripStartTime,
  });

  int totalSeats;
  int avaiable;
  String tripStartTime;

  factory RouteTiming.fromJson(Map<String, dynamic> json) =>
      _$RouteTimingFromJson(json);
}

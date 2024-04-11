// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteTiming _$RouteTimingFromJson(Map<String, dynamic> json) => RouteTiming(
      totalSeats: json['totalSeats'] as int,
      avaiable: json['avaiable'] as int,
      tripStartTime: json['tripStartTime'] as String,
    );

Map<String, dynamic> _$RouteTimingToJson(RouteTiming instance) =>
    <String, dynamic>{
      'totalSeats': instance.totalSeats,
      'avaiable': instance.avaiable,
      'tripStartTime': instance.tripStartTime,
    };

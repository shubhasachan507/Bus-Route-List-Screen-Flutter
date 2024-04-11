// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) => RouteInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      source: json['source'] as String,
      tripDuration: json['tripDuration'] as String,
      destination: json['destination'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$RouteInfoToJson(RouteInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'source': instance.source,
      'tripDuration': instance.tripDuration,
      'destination': instance.destination,
      'icon': instance.icon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routes _$RoutesFromJson(Map<String, dynamic> json) => Routes(
      routeInfo: (json['routeInfo'] as List<dynamic>)
          .map((e) => RouteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeTimings: (json['routeTimings'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => RouteTiming.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$RoutesToJson(Routes instance) => <String, dynamic>{
      'routeInfo': instance.routeInfo,
      'routeTimings': instance.routeTimings,
    };

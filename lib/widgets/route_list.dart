import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/data/model/route_info.dart';
import 'package:test_app/data/model/route_timing.dart';
import 'package:test_app/widgets/route_detail_card.dart';

class RouteList extends StatefulWidget {
  const RouteList(
      {super.key, required this.routeInfo, required this.futureTrips});
  final List<RouteInfo> routeInfo;
  final Map<String, List<RouteTiming>> futureTrips;

  @override
  State<RouteList> createState() => _RouteListState();
}

class _RouteListState extends State<RouteList> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 60),
      (Timer t) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.routeInfo.length,
          itemBuilder: (context, index) {
            return widget.futureTrips[widget.routeInfo[index].id] != null
                ? Column(
                    children: [
                      ...widget.futureTrips[widget.routeInfo[index].id]!.map(
                        (e) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: RouteDetailCard(
                              seatsAvailable: e.avaiable,
                              source: widget.routeInfo[index].source,
                              destination: widget.routeInfo[index].destination,
                              duration: widget.routeInfo[index].tripDuration,
                              tripStartTime: e.tripStartTime,
                            ),
                          );
                        },
                      )
                    ],
                  )
                : const SizedBox();
          }),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

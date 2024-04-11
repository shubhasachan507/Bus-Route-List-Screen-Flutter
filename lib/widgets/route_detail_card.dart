import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/utility/utility.dart';
import 'package:test_app/widgets/circle_with_dropdown.dart';
import 'package:test_app/widgets/journey_detail.dart';

class RouteDetailCard extends StatelessWidget {
  const RouteDetailCard(
      {super.key,
      required this.seatsAvailable,
      required this.source,
      required this.destination,
      required this.duration,
      required this.tripStartTime});
  final int seatsAvailable;
  final String source;
  final String destination;
  final String duration;
  final String tripStartTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(47, 125, 121, 0.1),
            offset: Offset(0, 6),
            blurRadius: 12,
            spreadRadius: 6,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: [
        IntrinsicHeight(
          child: _TripInformation(
            source: source,
            destination: destination,
            duration: duration,
            tripStartTime: tripStartTime,
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        JourneyDetails(
          seatAvailbale: seatsAvailable,
          tripStartTime: tripStartTime,
        ),
      ]),
    );
  }
}

class _TripInformation extends StatelessWidget {
  const _TripInformation({
    super.key,
    required this.source,
    required this.destination,
    required this.duration,
    required this.tripStartTime,
  });

  final String source;
  final String destination;
  final String duration;
  final String tripStartTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleWithDropdown(
                      color: Colors.blueAccent,
                      icon: Icons.arrow_drop_up,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      source,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 5,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '${DateFormat("MMM d").format(DateTime.now())}, $tripStartTime ',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 5,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleWithDropdown(
                      color: Colors.orange,
                      icon: Icons.arrow_drop_down,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          DateFormat("MMM d, hh:mm").format(DateTime.now()
                              .add(Duration(minutes: Random().nextInt(60)))),
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 1,
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: _DepartureInformation(
            duration: duration,
            departureTime: tripStartTime.differenceFromNow(),
          )),
        ],
      ),
    );
  }
}

class _DepartureInformation extends StatelessWidget {
  const _DepartureInformation({
    super.key,
    required this.duration,
    required this.departureTime,
  });

  final String duration;
  final String departureTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Departure on:',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        _DepartureTime(departureTime: departureTime),
        Text(
          'Travel time: $duration',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DepartureTime extends StatelessWidget {
  const _DepartureTime({
    super.key,
    required this.departureTime,
  });
  final String departureTime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            departureTime,
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              'min',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

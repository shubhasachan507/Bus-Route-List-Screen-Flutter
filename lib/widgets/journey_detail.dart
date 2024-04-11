import 'package:flutter/material.dart';

class JourneyDetails extends StatelessWidget {
  const JourneyDetails(
      {super.key, required this.seatAvailbale, required this.tripStartTime});
  final int seatAvailbale;
  final String tripStartTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        children: [
          const JourneyDetailsWidget(
            title: 'Start',
          ),
          JourneyDetailsWidget(
            title: tripStartTime,
            seatAvailbale: seatAvailbale,
          ),
          const JourneyDetailsWidget(
            title: 'Finish',
          ),
        ],
      ),
    );
  }
}

class JourneyDetailsWidget extends StatelessWidget {
  const JourneyDetailsWidget(
      {super.key, required this.title, this.seatAvailbale});

  final String title;
  final int? seatAvailbale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          title != 'Start' && title != 'Finish'
              ? Row(
                  children: [
                    const Icon(Icons.directions_bus_filled_sharp),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chair,
                            size: 15,
                          ),
                          Text('$seatAvailbale'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(Icons.chevron_right),
                    ),
                  ],
                )
              : const SizedBox(),
          Visibility(
            visible: title == 'Start' || title == 'Finish',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Icon(Icons.directions_walk),
                const Text('200m'),
                title != 'Finish'
                    ? const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.chevron_right),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

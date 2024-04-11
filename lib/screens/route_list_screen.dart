import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_app/data/store/routes_store.dart';
import 'package:test_app/widgets/background_container.dart';
import 'package:test_app/widgets/route_list.dart';

class RouteListScreen extends StatelessWidget {
  const RouteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RoutesStore>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFCE09B),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const BackgroundContainer(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * .13,
            child: Observer(builder: (context) {
              return store.routes.value?.status == FutureStatus.pending
                  ? const CircularProgressIndicator()
                  : store.routes.value?.status == FutureStatus.rejected
                      ? const Text('Error fetching data')
                      : RouteList(
                          routeInfo: store.routes.value?.value?.routeInfo ?? [],
                          futureTrips: store.futureTrips,
                        );
            }),
          ),
        ],
      ),
    );
  }
}

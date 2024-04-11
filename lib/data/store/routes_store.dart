import 'package:mobx/mobx.dart';
import 'package:test_app/data/api/fetch_data.dart';
import 'package:test_app/data/model/route_timing.dart';
import 'package:test_app/data/model/routes.dart';
import 'package:intl/intl.dart';

class RoutesStore with Store {
  final Observable<ObservableFuture<Routes>?> routes = Observable(null);
  Map<String, List<RouteTiming>> futureTrips = {};

  @action
  getFutureTrips() {
    runInAction(() {
      final routeValue = routes.value?.value?.routeTimings;
      if (routeValue != null) {
        routeValue.forEach((routeId, timings) {
          List<RouteTiming> futureTripTimings = [];

          for (var timing in timings) {
            DateFormat dateFormat = DateFormat.Hm();
            DateTime now = dateFormat.parse(dateFormat.format(DateTime.now()));
            DateTime tripStartTime = dateFormat.parse(timing.tripStartTime);
            if (tripStartTime.isAfter(now)) {
              futureTripTimings.add(timing);
            }
          }

          if (futureTripTimings.isNotEmpty) {
            futureTrips[routeId] = futureTripTimings;
          }
        });
      }
    });
  }

  RoutesStore() {
    fetchRoutesData();
  }

  @action
  Future<void> fetchRoutesData() async {
    final response = await readJson();
    runInAction(
      () => routes.value = ObservableFuture.value(response!),
    );
    getFutureTrips();
  }
}

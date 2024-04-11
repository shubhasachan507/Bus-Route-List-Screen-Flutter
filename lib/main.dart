import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/data/store/routes_store.dart';
import 'package:test_app/screens/route_list_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Provider(
        create: (BuildContext context) => RoutesStore(),
        child: const RouteListScreen()),
  ));
}

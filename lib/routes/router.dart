import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../page/home.dart';
import '../page/find.dart';
import '../page/friend.dart';
import '../page/http.dart';
import '../page/my.dart';
final router = FluroRouter();

void defineRoutes() {
  router.define("/", handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Home();
  }));

  router.define("/find", handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Find();
  }));
  router.define("/friend", handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Friend();
  }));
  router.define("/httpPage", handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HttpPage();
  }));
}
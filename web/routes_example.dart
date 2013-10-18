library routes_example;

import 'dart:html';
import 'package:route/client.dart';

// Alternatively we could define multiple static routes as such:
// new UrlPattern('/routes_example/web/routes_example.html#one');
// ..
final MyUrl = new UrlPattern(r'/routes_example/web/routes_example.html#(\w+)');

main() {
  var router = new Router()..addHandler(MyUrl, route_handler)..listen();
  
}

void route_handler(String path) {
  var page = MyUrl.parse(path)[0];
  var exampleApp = document.query('example-app').xtag;
  exampleApp.page = page;
}

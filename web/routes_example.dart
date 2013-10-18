library routes_example;

import 'dart:html';
import 'package:route/client.dart';

// Alternatively we could define multiple static routes as such:
// new UrlPattern('/routes_example/web/routes_example.html#one');
// ..
final MyUrl = new UrlPattern(r'/routes_example/web/routes_example.html#(\w+)');

main() {
  // Create our router and handlers then start listening.
  // See route package documentation for more details.
  var router = new Router()..addHandler(MyUrl, route_handler)..listen();
  
}

void route_handler(String path) {
  // Since we only have one match group, we're only worried about the
  // first result.
  var page = MyUrl.parse(path)[0];
  
  // Grab our custom element and assign to the page property.
  var exampleApp = document.query('example-app').xtag;
  exampleApp.page = page;
}

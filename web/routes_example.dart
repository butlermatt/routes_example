//library routes_example;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:route/client.dart';

// Alternatively we could define multiple static routes as such:
// new UrlPattern('/routes_example/web/routes_example.html#one');
// ..
final MyUrl = new UrlPattern(r'/routes_example/web/routes_example.html#(\w+)');
final HomeUrl = new UrlPattern(r'/routes_example/web/routes_example.html');

// This is temorary only until Polymer 0.8.6 and I should then be able to
// revert this back to main and drop the @initMethod annotation.
//@initMethod
//tmpMain() {
// After Polymer 0.8.6 use the following two lines instead.
main() {
  //initPolymer();
  // Create our router and handlers then start listening.
  // See route package documentation for more details.
  var router = new Router()..addHandler(MyUrl, route_handler)
      ..addHandler(HomeUrl, (_) { })
      ..listen();
  
}

void route_handler(String path) {
  // Since we only have one match group, we're only worried about the
  // first result.
  var page = MyUrl.parse(path)[0];
  
  // Grab our custom element and assign to the page property.
  var exampleApp = document.query('example-app');
  exampleApp.page = page;
}

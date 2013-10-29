library routes_example;

import 'dart:html';
//import 'dart:async'; // Needed if we use the scheduleMicrotask
import 'package:route/client.dart';
import 'package:polymer/polymer.dart';

// Alternatively we could define multiple static routes as such:
// new UrlPattern('/routes_example/web/routes_example.html#one');
// ..
final MyUrl = new UrlPattern(r'/routes_example/web/routes_example.html#(\w+)');
final HomeUrl = new UrlPattern(r'/routes_example/web/routes_example.html');

main() {
  // Dartium only allows one dart script per page. So we need to manually
  // call initPolymer ourselves.
  initPolymer(); // Start polymer

}

// Indicate to polymer this should be run in a dirtCheckZone
// Basically tells polymer to watch for changes to observables that may
// be triggered by this function.
// Alternative is to keep this in the main method and ensure when we update
// the observable we also call Observable.dirtyCheck in the event loop.
@initMethod 
void _init() {
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
  var exampleApp = document.querySelector('example-app');
  exampleApp.page = page;
  // Because we're using an @initMethod above we don't need to do this
//  scheduleMicrotask(Observable.dirtyCheck);
}

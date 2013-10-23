library example.app;

import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('example-app')
class ExampleApp extends PolymerElement {
  @published String page = '';
  
  // Required now for all Polymer Elements.
  ExampleApp.created() : super.created();
  
  // Triggered by the on-click event on the buttons.
  void updatePage(Event e, var detail, Node node) {
    // Get the data-name value from the element
    var pg = (node as Element).dataset['name'];
    
    // pass the data-name value as the location fragment
    // for the page. This lets route's Router handle passing
    // it off to the page attribute.
    window.location.hash = pg;
  }
  
  // Triggered by the on-change event for our observable
  // variable 'page'. Observe library is nice in which we only
  // have to create a callback which has the name of the variable
  // plus 'Changed' tacked onto it. Receives the old value it used
  // to contain.
  void pageChanged(oldValue) {
    // This check shouldn't be necessary as the observe library should
    // handle this for us. But I'm paranoid ;)
    if(page == oldValue) {
      return;
    } else if(page == '') {
      
      // If page is blank just remove anything in the container.
      var container =  $['container'];
      container.children.clear();
    } else {
      var element = '';
      
      // Determine which element we should be displaying based on
      // what was passed to the location fragment.
      switch(page.toLowerCase()) {
        case 'one':
        case '1':
          element = 'one-element';
          break;
        case 'two':
        case '2':
          element = 'two-element';
          break;
        default:
          element = 'help-me';
      }
      print('Element: $element page: $page');
      _addElement(element);
    }
    
  }
  
  // Take the element we determined needed to be added, create it and add it.
  void _addElement(String elementName) {
    if(elementName == '') throw new ArgumentError('Must provide an element name');
    
    var content = new Element.tag(elementName);
    print('elementName: $elementName Element: ${content.tagName}');
    if(content != null) {
      var container = $['container'];
      container.children..clear()..add(content);
    }
  }
}
library example.app;

import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('example-app')
class ExampleApp extends PolymerElement {
  @published String page = '';
  
  void updatePage(Event e, var detail, Node node) {
    var pg = (node as Element).dataset['name'];
    window.location.hash = pg;
  }
  
  void pageChanged(oldValue) {
    if(page == oldValue) {
      return;
    } else if(page == '') {
      
      var container =  $['container'];
      container.children.clear();
    } else {
      var element = '';
      
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
  
  void _addElement(String elementName) {
    if(elementName == '') throw new ArgumentError('Must provide an element name');
    
    var content = createElement(elementName);
    print('elementName: $elementName Element: ${content.tagName}');
    if(content != null) {
      var container = $['container'];
      container.children..clear()..add(content);
    }
  }
}
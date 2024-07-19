import 'dart:io';

import 'package:decor/decor.dart';
import 'example_data.dart';



///
/// Base class of Page
/// This class builds Head and Footer sections
///
class Base{

  Decor $ = Decor();

  DecorHTML globalStyle = Decor().style(""" 
    html, body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
      background:  #DCDCDC;
    }
    """
  );

  DecorHTML build( String title, String desc, List<DecorHTML> content ){
    return $.html(c:[
        head(title, desc),
        $.body()(c: content ),
      footer()
      ]);
  }

  DecorHTML head( String title, String desc){
    return $.head(c:[
      $.title(title, desc),
      $.link({"rel": "stylesheet", "href": "https://cdn.jsdelivr.net/npm/bulma@1.0.1/css/bulma.min.css"}),
      $.script("", {"src": "https://kit.fontawesome.com/7dc3015a44.js", "crossorigin": "anonymous"}),
      globalStyle
    ]);
  }

  DecorHTML footer( ){
    return $.div("footer has-background-primary-15")(c:[
      $.div("columns is-mobile is-centered")(c:[
        $.div("column is-narrow")(c:[
          $.div("tags has-addons")(c:[
            $.a("https://pub.dev/packages/decor","tag is-link")(before: "Decor Package"),
            $.a("https://github.com/alierkanimrek/decor","tag is-info")(before: "Decor Repo"),
          ])
        ])
      ])
    ]);
  }

}




class MainPage extends Base{

  String title = "Decor";
  String desc = "Flutter way HTML builder package for Dart";


  DecorHTML mainStyle = Decor().style(""" 
    .message {
      background-color: #d7ecff;
    }
    pre {
      background-color: #333333;
      border-radius: 5px;
      color: #eeeeee;
      letter-spacing: .1rem;
    }
    .focus{
      color: orange !important;
    }
  """);


  DecorHTML call(){
    return build(title, desc, [
      mainStyle,
      hero(),
      $.section("section")(c:[
        $.div("container")(c:[
          content()
        ])
      ])
    ]);
  }


  DecorHTML hero(){
    return $.section("hero is-primary")(c:[
      $.div("hero-body")(c:[
        $.div("columns")(c:[
          $.div("column is-12")(c:[
            $.div("container content")(c:[
              $.h1("title is-1 mytitle")(before: title),
              $.h3("subtitle")(before: desc),
              $.a("https://github.com/alierkanimrek/decor", "button is-w is-middle")(c:[
                $.span("icon")(c:[
                  $.i("fab fa-github")()
                ]),
                $.span()(before: "Github")
              ]),
            ])
          ])
        ])
      ])
    ]);

    }


  DecorHTML content(){
    return $.div("content is-medium")(c:[
      $.h3("title is-3")(before: "Features"),
        $.forEach(data, (element) {
          return box(element);
        })
    ]);
  }


  DecorHTML box(ContentData topic){
    return $.div("box mt-6")(c:[
      $.h4("title is-4")(before: topic.title),
      $.article("message is-primary mb-0")(c:[
        $.div("message-body")(before: topic.body),
      ]),
      $.article("message is-danger mb-0")(c:[
        $.div("message-body is-family-monospace")(before: topic.tip),
      ]),
      $.article("message is-dark")(c:[
        $.div()(before: topic.code)
      ])
    ]);
  }

}






void main() {

  DecorHTML render = MainPage()();

  File fh = File("example.html");
  fh.writeAsString(render.join());
  print("Open example.html on browser.");

  /// For shelf server.
  ///
  /// return Response.ok(
  ///    render.join(),
  ///    headers: { "content-type": "text/html"}
  /// );
}

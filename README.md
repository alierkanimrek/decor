
Decor
=====

### Flutter way HTML builder package for Dart

#### Main concept

A simple way to represents HTML structures in code.
> $.a(_class and required variables_)(_attributes, inline data and children_)

```dart
Decor $ = Decor();
$.a("/settings", "button")(after: "Settings");   
      
// output: <a class="button", href="/settings">Settings</a>
```

#### Children elements

It is very easy to define and change the structure.

> $(...)(**c**:\[...\]);

```dart
$.section("hero is-primary")(c:\[
  $.div("hero-body")(c:\[
    $.div("columns")(c:\[
      $.div("column is-12")(c:\[
        $.div("container content")(c:\[
          $.h1("title")(before: title),
          $.h3("subtitle")(before: desc),
        \])
      \])
    \])
  \])
\]);
```

#### Attributes

Just use Dart maps for HTML attributes.

> $(...)(**a**:{"key":"value", ...});

```dart
$.input("button")(a:{"animation-delay": "800", "animation-style": "fade-in"});
```

#### Inline contents

You can place content before or after children.

> $(...)(**before**:"before text", **after**:"after text", c:\[...\]);

```dart
$.p()(before:"Here is example;<br>", after: "some content", c:\[ $.pre()(...) \]);

// output: 
// <p>Here is example; 
// <pre>...</pre> 
// some content 
// </p>
```

#### Iterable jobs

You're already used to this.

> $.forEach(data, (element) { return $...; });

```dart
DecorHTML content(){
    return $.div("content is-medium")(c:\[
      $.h3("title is-3")(before: "Features"),
        $.forEach(data, (element) {
          return box(element);
        })
    \]);
  }

DecorHTML box(ContentData topic){ return $...; }

```


#### Focus on design

You can divide your design into smaller parts and work more functionally.

> class MainPage extends Base{ ...

```dart
class Base{

  Decor $ = Decor();

  DecorHTML build( String title, String desc, List<DecorHTML> content ){
    return $.html(c:\[
      head(title, desc),
      $.body()(c: content ), 
      footer()
      \]);
  }

  DecorHTML head( String title, String desc){ return $...; }

  DecorHTML footer( ){ return $...; }

}


class MainPage extends Base{

  String title = "Decor";
  String desc = "Flutter way HTML builder package for Dart";
  
  DecorHTML mainStyle = Decor().style(""" .... """);
      
  DecorHTML call(){
    return build(title, desc, \[
      mainStyle,
      hero(),
      $.section("section")(c:\[
        $.div("container")(c:\[
          content()
        \])
      \])
    \]);
  }
  
  DecorHTML hero(){ return $...; }
  
  DecorHTML content(){ return $...; }
  
}

void main() async {
  DecorHTML render = MainPage()();
  ...
}

```

#### Serve easy

Serving your design is that easy.

> typedef DecorHTML = List<String>;

```dart
class MainPage extends Base{

  Future<Response> handler(Request req) async {

    DecorHTML render = await build(...);
    
    return Response.ok(
      render.join(),
      headers: { "content-type": "text/html"}
    );      
}


void main() async {
  
  MainPage index = MainPage();

  // shelf\_router  
  final router = Router()
      ..get('/', index.handler)
  ...  
```
[Decor Package](https://pub.dev/packages/decor) 
import 'dart:mirrors';
import 'package:decor/src/htmltags.dart';
import 'package:decor/src/builder.dart';


typedef DecorHTML = List<String>;





class Decor extends HTMLTags{



  /// Base function of HTML tag of Decor
  ///
  /// [tagAndClasses] is combination of HTML tag name and class attribute
  /// Return object is [DecorBuilder] for definition of tag attributes,
  /// children tags and inline values.
  /// Decor("p is-big color-red txt-shadow")()
  /// output: <p class="is-big color-red txt-shadow">
  ///
  /// Example:
  /// ```dart
  ///
  /// Decor $ = Decor();
  ///
  /// String title = "Decor";
  /// String subtitle = "Subtitle of Decor";
  /// String content = "Some text with <b>bold text</b> or <br> html content";
  /// String img = "/content/decor01.jpg";
  ///
  /// return $("div content half-sized)(c:[
  ///   $("h3 txt-shadow title")(before: title),
  ///   $("p subtitle")(before: subtitle),
  ///   $("p txt-justify content-body")(after: content, c:[
  ///     $("img content-img")(a:{"src": img})
  ///   ])
  /// ]);
  ///
  /// ...
  /// ```
  DecorBuilder call(String tagAndClasses){

    late String tag;
    late Map<String,String> attr;
    List<String> tags = tagAndClasses.trimRight().split(" ");

    // Tag has class names?
    if(tags.length>1){
      tag = tags.removeAt(0); // Remove tag name from list and get tag name
      attr = {"class": tags.join(" ")};
    }
    else{
      tag = tagAndClasses;
      attr = {};
    }

    return DecorBuilder(tag, a: attr);
  }




  DecorBuilder noSuchMethod(Invocation invocation) {
    String tag = MirrorSystem.getName(invocation.memberName);
    try{
      invocation.positionalArguments[0]!=null
        ? tag += " ${invocation.positionalArguments[0]}"
        : null;
    }catch(e){null;}
    return call(tag);
  }




  /// Invokes [wrapper] on each element of this iterable in iteration order.
  ///
  /// Example:
  /// ```dart
  /// final List<String> options = ["text1", "text2"];
  /// ...
  /// $.select()(c:[
  ///    $.forEach(options, (element){
  ///       return $.option(element);
  ///    })
  /// ]),
  /// ...
  /// ```
  DecorHTML forEach<T>(List<T> content, DecorHTML wrapper(T element)) {
    List<DecorHTML> c = [];
    content.forEach((T element) {
      try{ c.add(wrapper(element)); }
      catch(e){ null; }
    });
    return fake(c);
  }




  /// Encapsulate many tags into a fake tag
  /// Converts List<DecorHTML> to DecorHTML
  ///
  DecorHTML fake(List<DecorHTML> c){
    DecorHTML content = [];
    c.forEach((child) {
      for (var c in child) {
        content.add(c);
      }
    });
    return content;
  }





  DecorHTML html({required List<DecorHTML> c, Map<String,String>? a}) {
    return DecorBuilder("html", prefix: [
      DecorBuilder("!doctype", a:{"@info": "html"})()
    ])(c:c);
  }



  DecorHTML head({required List<DecorHTML> c, Map<String,String>? a}) {
    return DecorBuilder("head", c:c)();
  }


  DecorHTML title(String title, String description){
    return DecorBuilder("title", before: title, appendix: [
      DecorBuilder("meta", a:{"name": "description", "content": description})()
    ])();
  }


  DecorHTML meta(Map<String,String> attributes){
    return DecorBuilder("meta", a:attributes)();
  }


  DecorHTML link(Map<String,String> attributes){
    return DecorBuilder("link", a:attributes)();
  }


  DecorHTML base(Map<String,String> attributes){
    return DecorBuilder("meta", a:attributes)();
  }


  DecorHTML col(Map<String,String> attributes){
    return DecorBuilder("col", a:attributes)();
  }


  DecorHTML comment(String comment){
    return ["<!-- $comment -->\n"];
  }


  DecorHTML script(String script, [Map<String,String>? attributes]){
    Map<String,String> attr = attributes??{};
    attr.containsKey("type") ?null :attr.addAll({"type":"text/javascript"});
    return DecorBuilder("script", before: script, a:attr)();
  }


  DecorHTML style(String css, [Map<String,String>? attributes]){
    return DecorBuilder("style", before: css, a:attributes)();
  }


  DecorBuilder img(String src, String alt, [String? clss]){
    Map<String,String> a = {"src": src, "alt":alt};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("img", a:a);
  }


  DecorBuilder input(String type, [String? clss]){
    Map<String,String> a = {"type": type};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("input", a:a);
  }


  DecorBuilder option(String value, [String? clss]){
    Map<String,String> a = {"value": value};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("option", a:a);
  }


  DecorBuilder label(String for_, [String? clss]){
    Map<String,String> a = {"for": for_};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("label", a:a);
  }


  DecorBuilder datalist(String id){
    return DecorBuilder("datalist", a:{"id": id});
  }


  DecorBuilder map(String name, [String? clss]){
    Map<String,String> a = {"name": name};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("map", a:a);
  }


  DecorBuilder blockquote(String cite, [String? clss]){
    Map<String,String> a = {"cite": cite};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("blockquote", a:a);
  }


  DecorBuilder abbr(String title, [String? clss]){
    Map<String,String> a = {"title": title};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("abbr", a:a);
  }


  DecorBuilder a(String href, [String? clss]){
    Map<String,String> a = {"href": href};
    clss!=null ?a.addAll({"class":clss}) :null;
    return DecorBuilder("a", a:a);
  }


  DecorHTML br(){
    return DecorBuilder("br")();
  }


  DecorHTML wbr(){
    return DecorBuilder("wbr")();
  }


  DecorBuilder data(String value){
    return DecorBuilder("data", a:{"value":value});
  }


  DecorHTML param(String name, String value){
    return DecorBuilder("param", a:{"name":name, "value":value})();
  }


  DecorHTML source(String source, String type, [Map<String,String>? attributes]){
    Map<String,String> a = attributes ?? {};
    a.addAll({"src":source, "type":type});
    return DecorBuilder("source", a:a)();
  }


  DecorHTML track(String source, String kind, [Map<String,String>? attributes]){
    Map<String,String> a = attributes ?? {};
    a.addAll({"src":source, "kind":kind});
    return DecorBuilder("source", a:a)();
  }


}



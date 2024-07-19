import 'package:decor/decor.dart';




final List<String> _emptytags = [
  "",
  "!doctype",
  "br",
  "hr",
  "meta",
  "base",
  "embed",
  "col",
  "img",
  "input",
  "keygen",
  "link",
  "param",
  "source",
  "track",
  "wbr"
];



class DecorBuilder{

  late String ind = "  ";
  late final String tag;
  late Map<String,String>? a;
  late String? before;
  late String? after;
  late List<DecorHTML>? appendix;
  late List<DecorHTML>? prefix;
  late List<DecorHTML>? c;


  DecorBuilder(this.tag, {
    Map<String,String>? this.a,
    String? this.before,
    String? this.after,
    List<DecorHTML>? this.prefix,
    List<DecorHTML>? this.appendix,
    List<DecorHTML>? this.c}){
    tag==""?ind = "":ind = "  ";
  }




  // Generate HTML tag with attributes
  String _createTag(){
    // Fake tag
    if(tag==""){ return "\n";  }

    List<String> t = ["<${tag.trimRight()}"];

    if(a!=null) {

      // Fist class and id attributes
      try{ t.add("class=\"${a!["class"]!}\""); a!.remove("class"); } catch (e){ null; }
      try{ t.add("id=\"${a!["id"]!}\""); a!.remove("id"); } catch (e){ null; }

      // Then other parameters
      a!.forEach((key, value) {

        // a:{"@key": "value"} directive interpret as <div value>
        if(key.substring(0,1)=="@"){ t.add(value); }

        else{ t.add("$key=\"$value\""); }
      });
    }

    return "${t.join(' ')}>\n";
  }




  ///
  /// [c] is children tags
  ///
  /// [a] html element attributes
  ///
  /// [before] inlineHTML before [c] children
  ///
  /// [after] inlineHTML after [c] children
  ///
  DecorHTML call({
    Map<String,String>? a,
    String ?before,
    String ?after,
    List<DecorHTML>? c}){

    a!=null?_updateA(a):null;
    c!=null?_updateC(c):null;
    before!=null?_updateBefore(before):null;
    after!=null?_updateAfter(after):null;

    DecorHTML content = [];

    // Add prefixes
    prefix?.forEach((child) {
      for (var ch in child) { content.add(ch); }
    });

    // Create tag
    content.add(_createTag());

    // Add before content at before children
    this.before!=null?content.add("${this.before}\n"):null;

    // Add children
    this.c?.forEach((child) {
      for (var ch in child) {
        if(ch.trimLeft().substring(0,1) == "<"){ content.add("$ind$ch"); }
        else{ content.add(ch); }
      }
    });

    // Add content at after children
    this.after!=null?content.add("${this.after}\n"):null;

    // Mix tag and inline content
    if(this.before!=null || this.after!=null){
      // Remove newline from tag ending
      content[0] = content[0].substring(0,content[0].length-1);
      content = [content.join()]; // mix
    }

    // Add closer tag
    _emptytags.contains(tag)?null:content.add("</${tag.trimRight()}>\n");

    // Add prefixes
    appendix?.forEach((child) {
      for (var ch in child) { content.add(ch); }
    });

    return content;

  }




  void _updateA(Map<String,String> attr){
    a = a??{};
    attr.forEach((key, value) {
      a!.containsKey(key)
          ? a![key] = [a![key], value].join(" ")
          : a![key] = value;
    });
  }


  void _updateC(List<DecorHTML> children){
    c!=null
        ? c!.addAll(children)
        : c = children;
  }


  void _updateBefore(String bef){
    before!=null
        ? before = [before!, bef].join(" ")
        : before = bef;
  }


  void _updateAfter(String aft){
    after!=null
        ? after = [after!, aft].join(" ")
        : after = aft;
  }


}


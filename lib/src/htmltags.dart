
import 'package:decor/src/decor_base.dart';
import 'package:decor/src/builder.dart';


/// HTML tags that referenced from https://www.w3schools.com/tags/ref_byfunc.asp
///
abstract class HTMLTags {


  // Basic
  DecorHTML html({required List<DecorHTML> c, Map<String,String>? a});
  DecorHTML head({required List<DecorHTML> c, Map<String,String>? a});

  /// [title] Page title
  ///
  /// [description] Description value of meta tag
  ///
  DecorHTML title(String title, String description);
  DecorBuilder body([String? clss]);
  DecorBuilder h1([String? clss]);
  DecorBuilder h2([String? clss]);
  DecorBuilder h3([String? clss]);
  DecorBuilder h4([String? clss]);
  DecorBuilder h5([String? clss]);
  DecorBuilder h6([String? clss]);
  DecorBuilder p([String? clss]);
  DecorHTML br();
  DecorBuilder hr([String? clss]);

  /// <!-- [comment] -->
  ///
  DecorHTML comment(String comment);

  // Formatting
  DecorBuilder abbr(String title, [String? clss]);
  DecorBuilder address([String? clss]);
  DecorBuilder b([String? clss]);
  DecorBuilder bdi([String? clss]);
  DecorBuilder bdo([String? clss]);
  DecorBuilder blockquote(String cite, [String? clss]);
  DecorBuilder cite([String? clss]);
  DecorBuilder code([String? clss]);
  DecorBuilder del([String? clss]);
  DecorBuilder dfn([String? clss]);
  DecorBuilder em([String? clss]);
  DecorBuilder i([String? clss]);
  DecorBuilder ins([String? clss]);
  DecorBuilder kbd([String? clss]);
  DecorBuilder mark([String? clss]);
  DecorBuilder meter([String? clss]);
  DecorBuilder pre([String? clss]);
  DecorBuilder progress([String? clss]);
  DecorBuilder q([String? clss]);
  DecorBuilder rp([String? clss]);
  DecorBuilder rt([String? clss]);
  DecorBuilder ruby([String? clss]);
  DecorBuilder s([String? clss]);
  DecorBuilder samp([String? clss]);
  DecorBuilder small([String? clss]);
  DecorBuilder strong([String? clss]);
  DecorBuilder sub([String? clss]);
  DecorBuilder sup([String? clss]);
  DecorBuilder template([String? clss]);
  DecorBuilder time([String? clss]);
  DecorBuilder u([String? clss]);
  DecorBuilder var_([String? clss]);
  DecorHTML wbr();

// Forms and Input
  DecorBuilder form([String? clss]);
  DecorBuilder input(String type, [String? clss]);
  DecorBuilder textarea([String? clss]);
  DecorBuilder button([String? clss]);
  DecorBuilder select([String? clss]);
  DecorBuilder optgroup([String? clss]);
  DecorBuilder option(String value, [String? clss]);
  DecorBuilder label(String for_, [String? clss]);
  DecorBuilder fieldset([String? clss]);
  DecorBuilder legend([String? clss]);
  DecorBuilder datalist(String id);
  DecorBuilder output([String? clss]);

  // Frames
  DecorBuilder iframe([String? clss]);

  // Images
  DecorBuilder img(String src, String alt, [String? clss]);
  DecorBuilder map(String name, [String? clss]);
  DecorBuilder area([String? clss]);
  DecorBuilder canvas([String? clss]);
  DecorBuilder figcaption([String? clss]);
  DecorBuilder figure([String? clss]);
  DecorBuilder picture([String? clss]);
  DecorBuilder svg([String? clss]);

  // Audio video
  DecorBuilder audio([String? clss]);
  DecorHTML source(String source, String type);
  DecorHTML track(String source, String kind, [Map<String,String>? attributes]);
  DecorBuilder video([String? clss]);

  // Link
  DecorBuilder a(String href, [String? clss]);
  DecorHTML link(Map<String,String> attributes);
  DecorBuilder nav([String? clss]);

  // Lists
  DecorBuilder menu([String? clss]);
  DecorBuilder ul([String? clss]);
  DecorBuilder ol([String? clss]);
  DecorBuilder li([String? clss]);
  DecorBuilder dl([String? clss]);
  DecorBuilder dt([String? clss]);
  DecorBuilder dd([String? clss]);

  // Tables
  DecorBuilder table([String? clss]);
  DecorBuilder caption([String? clss]);
  DecorBuilder th([String? clss]);
  DecorBuilder tr([String? clss]);
  DecorBuilder td([String? clss]);
  DecorBuilder thead([String? clss]);
  DecorBuilder tbody([String? clss]);
  DecorBuilder tfoot([String? clss]);
  DecorHTML col(Map<String,String> attributes);
  DecorBuilder colgroup([String? clss]);

  // Style and Semantics

  /// [css] is your style elements
  ///
  DecorHTML style(String css, [Map<String,String>? attributes]);
  DecorBuilder div([String? clss]);
  DecorBuilder span([String? clss]);
  DecorBuilder header([String? clss]);
  DecorBuilder hgroup([String? clss]);
  DecorBuilder footer([String? clss]);
  DecorBuilder main([String? clss]);
  DecorBuilder section([String? clss]);
  DecorBuilder search([String? clss]);
  DecorBuilder article([String? clss]);
  DecorBuilder aside([String? clss]);
  DecorBuilder details([String? clss]);
  DecorBuilder dialog([String? clss]);
  DecorBuilder summary([String? clss]);
  DecorBuilder data(String value);

  // Meta Info
  DecorHTML meta(Map<String,String> attributes);
  DecorHTML base(Map<String,String> attributes);

  // Programming

  /// [script] value is your script code
  ///
  /// a:{"type", "text/javascript"} will be add if you don't define
  ///
  DecorHTML script(String script, [Map<String,String>? attributes]);
  DecorBuilder noscript([String? clss]);
  DecorBuilder embed([String? clss]);
  DecorBuilder object([String? clss]);
  DecorHTML param(String name, String value);

}

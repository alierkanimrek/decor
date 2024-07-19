

class ContentData {
  late String title;
  late String body;
  late String tip;
  late String code;
  ContentData(this.title, this.body, this.tip, this.code);
}



List<ContentData> data = [
  ContentData(
      "Main concept",
      "A simple way to represents HTML structures in code.",
      "\$.a(<i>class and required variables</i>)(<i>attributes, inline data and children</i>)",
      """
<pre>Decor \$ = Decor();
\$.a("/settings", "button")(after: "Settings");   
      
// output: &lt;a class="button", href="/settings"&gt;Settings\&lt;/a&gt;</pre>
"""
  ),
  ContentData("Children elements", "It is very easy to define and change the structure.",
      "\$(...)(<b>c</b>:[...]);",
      """
<pre>\$.section("hero is-primary")(<strong class="focus">c:[</strong>
  \$.div("hero-body")(c:[
    \$.div("columns")(c:[
      \$.div("column is-12")(c:[
        \$.div("container content")(c:[
          \$.h1("title")(before: title),
          \$.h3("subtitle")(before: desc),
        ])
      ])
    ])
  ])
]);</pre>
      """
  ),
  ContentData("Attributes", "Just use Dart maps for HTML attributes.",
      "\$(...)(<b>a</b>:{\"key\":\"value\", ...});",
      """
<pre>\$.input("button")(<strong class="focus">a</strong>:{"animation-delay": "800", "animation-style": "fade-in"});</pre>
      """
  ),
  ContentData("Inline contents", "You can place content before or after children.",
      "\$(...)(<b>before</b>:\"before text\", <b>after</b>:\"after text\", c:[...]);",
      """
<pre>\$.p()(<strong class="focus">before</strong>:"Here is example;&lt;br&gt;", <strong class="focus">after</strong>: "some content", c:[ \$.pre()(...) ]);</pre>
// output: 
// &lt;p&gt;Here is example;
// &lt;pre&gt;...&lt;/pre&gt;
// some content
// &lt;/p&gt;
      """
  ),
  ContentData("Iterable jobs", "You're already used to this.",
      "\$.forEach(data, (element) { return \$...; });",
      """
<pre>DecorHTML content(){
    return \$.div("content is-medium")(c:[
      \$.h3("title is-3")(before: "Features"),
        <strong class="focus">\$.forEach(data, (element) {</strong>
          return box(element);
        })
    ]);
  }

DecorHTML box(ContentData topic){ return \$...; }
</pre>
      """
  ),
  ContentData("Focus on design", "You can divide your design into smaller parts and work more functionally.",
      "class MainPage extends Base{ ...",
      """
<pre>class Base{

  Decor \$ = Decor();

  DecorHTML build( String title, String desc, List&lt;DecorHTML> content ){
    return \$.html(c:[
      <strong class="focus">head(title, desc),</strong>
      \$.body()(c: <strong class="focus">content</strong> ), 
      footer()
      ]);
  }

  DecorHTML head( String title, String desc){ return \$...; }

  DecorHTML footer( ){ return \$...; }

}


class MainPage extends Base{

  String title = "Decor";
  String desc = "Flutter way HTML builder package for Dart";
  
  DecorHTML mainStyle = Decor().style(\""" .... \""");
      
  DecorHTML call(){
    return build(title, desc, [
      <strong class="focus">mainStyle,</strong>
      hero(),
      \$.section("section")(c:[
        \$.div("container")(c:[
          content()
        ])
      ])
    ]);
  }
  
  DecorHTML hero(){ return \$...; }
  
  DecorHTML content(){ return \$...; }
  
}

void main() async {
  DecorHTML render = MainPage()();
  ...
}
</pre>      
      """

  ),
  ContentData("Serve easy", "Serving your design is that easy.",
      "typedef DecorHTML = List&ltString&gt;;",
      """
<pre>

class MainPage extends Base{

  Future&lt;Response&gt; handler(Request req) async {

    DecorHTML render = await build(...);
    
    return Response.ok(
      <strong class="focus">render.join(),</strong>
      headers: { "content-type": "text/html"}
    );      
}


void main() async {
  
  MainPage index = MainPage();

  // shelf_router  
  final router = Router()
      ..get('/', index.handler)
  
  ...
</pre>
      """
  ),
];
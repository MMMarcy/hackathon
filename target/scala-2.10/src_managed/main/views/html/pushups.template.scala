
package views.html

import play.templates._
import play.templates.TemplateMagic._

import play.api.templates._
import play.api.templates.PlayMagic._
import models._
import controllers._
import play.api.i18n._
import play.api.mvc._
import play.api.data._
import views.html._
/**/
object pushups extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""

"""),_display_(Seq[Any](/*3.2*/main(color)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""
<div class="container">
	<div class="btn btn-danger pushup-container" >
		<span class="pushup">15</span>
	</div>
</div>

<script type="text/javascript">

	const pushup_div = $(".pushup");

	

	
	pushup_div.bind("click",pushUp);
	function pushUp()"""),format.raw/*18.19*/("""{"""),format.raw/*18.20*/("""
		var pushupsToGo = parseInt(pushup_div.text());
		console.log(pushupsToGo)
		if(pushupsToGo > 0)"""),format.raw/*21.22*/("""{"""),format.raw/*21.23*/("""
			pushup_div.text(pushupsToGo-1);
		"""),format.raw/*23.3*/("""}"""),format.raw/*23.4*/(""" else """),format.raw/*23.10*/("""{"""),format.raw/*23.11*/("""
			pushup_div.unbind("click");
		"""),format.raw/*25.3*/("""}"""),format.raw/*25.4*/("""
	"""),format.raw/*26.2*/("""}"""),format.raw/*26.3*/(""";


</script>
""")))})))}
    }
    
    def render(color:String): play.api.templates.HtmlFormat.Appendable = apply(color)
    
    def f:((String) => play.api.templates.HtmlFormat.Appendable) = (color) => apply(color)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Sun Jan 12 11:36:20 CET 2014
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/pushups.scala.html
                    HASH: c26068b6d14ca945222c683927d37a19491c7614
                    MATRIX: 558->1|667->16|704->19|723->30|762->32|1037->279|1066->280|1192->378|1221->379|1286->417|1314->418|1348->424|1377->425|1438->459|1466->460|1495->462|1523->463
                    LINES: 19->1|22->1|24->3|24->3|24->3|39->18|39->18|42->21|42->21|44->23|44->23|44->23|44->23|46->25|46->25|47->26|47->26
                    -- GENERATED --
                */
            
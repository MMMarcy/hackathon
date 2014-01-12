
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
object index extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""

"""),_display_(Seq[Any](/*3.2*/main(color)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""
<div class="container">

	<div class="row">
		<div class="col-xs-12 green-bkg">
			<div class="row">
				<div class="col-xs-1 col-xs-offset-1">
					<span class="text-center" id="level">3</span>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-9 col-xs-offset-1">
					<div class="row">
						<div class="col-xs-12 link">Jonas</div>
						<div class="col-xs-12">
							<div class="progress link">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 link"><small>Power</small></div>
						<div class="col-xs-9">
							<div class="progress link">
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
									<span class="sr-only">30% Complete (warning)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<span id="pic-frame"></span>
		</div>
	</div>
	

	<a href=""""),_display_(Seq[Any](/*40.12*/routes/*40.18*/.MainController.mission1(color))),format.raw/*40.49*/("""">
		<div id="mission-plc">
			<h3>Current active mission</h3>
			<p>Eat breakfast</p>
		</div>
	</a>

	<script type="text/javascript">
		const canvas = $("#pic-frame");
		const pageHeight = $(document).height();
		const pageWidth = $(document).width();
		canvas.css("height", (pageHeight-231)+"px");


		const mission = $("#mission-plc");
		mission.css("top", pageHeight- 200);
		mission.css("left", (pageWidth-mission.width())/2);

		$("#level, .link").click(function()"""),format.raw/*58.38*/("""{"""),format.raw/*58.39*/("""
			location.href = """"),_display_(Seq[Any](/*59.22*/routes/*59.28*/.MainController.story(color))),format.raw/*59.56*/("""";
		"""),format.raw/*60.3*/("""}"""),format.raw/*60.4*/(""");

	</script>

</div>
""")))})))}
    }
    
    def render(color:String): play.api.templates.HtmlFormat.Appendable = apply(color)
    
    def f:((String) => play.api.templates.HtmlFormat.Appendable) = (color) => apply(color)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Sun Jan 12 11:36:20 CET 2014
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/index.scala.html
                    HASH: 5eb16df317ae381cdd1107a0ca2e20a31d5785ff
                    MATRIX: 556->1|665->16|702->19|721->30|760->32|1936->1172|1951->1178|2004->1209|2503->1680|2532->1681|2590->1703|2605->1709|2655->1737|2687->1742|2715->1743
                    LINES: 19->1|22->1|24->3|24->3|24->3|61->40|61->40|61->40|79->58|79->58|80->59|80->59|80->59|81->60|81->60
                    -- GENERATED --
                */
            
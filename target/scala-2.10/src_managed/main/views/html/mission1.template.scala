
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
object mission1 extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""

"""),_display_(Seq[Any](/*3.2*/main(color)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""
<div class="container">
  <div class="row">
    <div class="col-xs-12 green-bkg text-center">
      <div class="box">
        <h3>Time mission</h3>
        <h4>Goal: Eat breakfast between 07:00-08:00</h4>
        <br>
        <h4>Take an image of your meal to complete this mission!</h4>
      </div>
      <img src="/assets/images/add-image-256.png">
    </div>
  </div>
</div>

<script type="text/javascript">
  /*const canvas = $(".box");
    const pageHeight = $(document).height();
    canvas.css("height", pageHeight+"px");*/
</script>


""")))})),format.raw/*25.2*/("""
"""))}
    }
    
    def render(color:String): play.api.templates.HtmlFormat.Appendable = apply(color)
    
    def f:((String) => play.api.templates.HtmlFormat.Appendable) = (color) => apply(color)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Sun Jan 12 11:36:20 CET 2014
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/mission1.scala.html
                    HASH: 7b89dd757dd8a6020557bf6fe9d4e091c41f3306
                    MATRIX: 559->1|668->16|705->19|724->30|763->32|1340->578
                    LINES: 19->1|22->1|24->3|24->3|24->3|46->25
                    -- GENERATED --
                */
            
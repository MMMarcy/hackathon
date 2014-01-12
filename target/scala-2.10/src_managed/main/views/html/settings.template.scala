
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
object settings extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""
"""),_display_(Seq[Any](/*2.2*/main(color)/*2.13*/ {_display_(Seq[Any](format.raw/*2.15*/("""

<div class="container">
  <div class="row">
    <div class="col-xs-6">

      <form role="form">
        <div class="form-group">
          <label>Age</label>
          <input class="form-control" id="age" placeholder="7"></div>
        <div class="form-group">
          <label>Weight (kg)</label>
          <input class="form-control" id="weight" placeholder="20"></div>
        <div class="form-group">
          <label>Height (cm)</label>
          <input class="form-control" id="height" placeholder="70"></div>
        <div class="checkbox">
          <label>
            <input type="checkbox">Private mode</label>
        </div>
        <!-- <button type="submit" class="btn btn-default">Submit</button> -->
    </form>

  </div>
</div>
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
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/settings.scala.html
                    HASH: 5be1db3b6ea2c44485953db4a2b66b97f6bec4da
                    MATRIX: 559->1|668->16|704->18|723->29|762->31
                    LINES: 19->1|22->1|23->2|23->2|23->2
                    -- GENERATED --
                */
            
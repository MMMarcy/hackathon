
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
object missions extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""
"""),_display_(Seq[Any](/*2.2*/main(color)/*2.13*/ {_display_(Seq[Any](format.raw/*2.15*/("""
<div class="container">

  <div class="row">
    <div class="col-xs-6">
      <h3>Missions</h3>
      <h5>Today, 11/1</h5>
    </div>
    <div class="col-xs-6">
      <h3>
        Jonas
        <span class="glyphicon glyphicon-user"></span>
      </h3>
      <h5>Level 3</h5>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-12">
      <div class="panel-group" id="accordion">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                <span class="glyphicon glyphicon-cutlery"></span>
                Time mission! Eat breakfast between 07.00-08.00
              </a>
            </h4>
          </div>
          <div id="collapseOne" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-5">GOAL:</div>
                <div class="col-xs-7">Eat the healty food before aliens arrive</div>
              </div>
              <div class="row">
                <div class="col-xs-5">TIME FRAME:</div>
                <div class="col-xs-7">07.00 - 08.00</div>
              </div>
              <div class="row">
                <div class="col-xs-5">EXPERIENCE GAINED:</div>
                <div class="col-xs-7">100XP POINTS</div>
              </div>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a href=""""),_display_(Seq[Any](/*48.29*/routes/*48.35*/.MainController.mission1(color))),format.raw/*48.66*/("""" class="btn btn-success">Start the mission</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                <span class="glyphicon glyphicon-globe"></span>
                Aliens are attacking!! Escape for 1KM to be safe
              </a>
            </h4>
          </div>
          <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-5">GOAL:</div>
                <div class="col-xs-7">Escape the attack area by walking or running!</div>
              </div>
              <div class="row">
                <div class="col-xs-5">TIME FRAME:</div>
                <div class="col-xs-7">30 Minutes</div>
              </div>
              <div class="row">
                <div class="col-xs-5">EXPERIENCE GAINED:</div>
                <div class="col-xs-7">50XP POINTS</div>
              </div>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a href=""""),_display_(Seq[Any](/*80.29*/routes/*80.35*/.MainController.map(color))),format.raw/*80.61*/("""" class="btn btn-success">Start the mission</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                <span class="glyphicon glyphicon-wrench"></span>
                Exercise mission! Exercise as indicate to strenghten your defense
              </a>
            </h4>
          </div>
          <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-5">GOAL:</div>
                <div class="col-xs-7">Do 15 pushups</div>
              </div>
              <div class="row">
                <div class="col-xs-5">TIME FRAME:</div>
                <div class="col-xs-7">NO LIMIT</div>
              </div>
              <div class="row">
                <div class="col-xs-5">EXPERIENCE GAINED:</div>
                <div class="col-xs-7">50XP POINTS</div>
              </div>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a href=""""),_display_(Seq[Any](/*112.29*/routes/*112.35*/.MainController.pushups(color))),format.raw/*112.65*/("""" class="btn btn-success">Start the mission</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                <span class="glyphicon glyphicon-cutlery"></span>
                Time mission! Eat breakfast between 07.00-08.00
              </a>
            </h4>
          </div>
          <div id="collapseFour" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-5">GOAL:</div>
                <div class="col-xs-7">Escape the attack area by walking or running!</div>
              </div>
              <div class="row">
                <div class="col-xs-5">TIME FRAME:</div>
                <div class="col-xs-7">30 Minutes</div>
              </div>
              <div class="row">
                <div class="col-xs-5">EXPERIENCE GAINED:</div>
                <div class="col-xs-7">50XP POINTS</div>
              </div>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a href="#" class="btn btn-success">Start the mission</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                <span class="glyphicon glyphicon-globe"></span>
                Reach the safe house!
              </a>
            </h4>
          </div>
          <div id="collapseFive" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-5">GOAL:</div>
                <div class="col-xs-7">Reach the safe house shown in the map</div>
              </div>
              <div class="row">
                <div class="col-xs-5">TIME FRAME:</div>
                <div class="col-xs-7">45 Minutes</div>
              </div>
              <div class="row">
                <div class="col-xs-5">EXPERIENCE GAINED:</div>
                <div class="col-xs-7">50XP POINTS</div>
              </div>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a href=""""),_display_(Seq[Any](/*176.29*/routes/*176.35*/.MainController.mapP2P(color))),format.raw/*176.64*/("""" class="btn btn-success">Start the mission</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/missions.scala.html
                    HASH: 31ac9c4fbc5cf534fc50bdcee5be86ffa1518622
                    MATRIX: 559->1|668->16|704->18|723->29|762->31|2320->1553|2335->1559|2388->1590|3696->2862|3711->2868|3759->2894|5056->4154|5072->4160|5125->4190|7676->6704|7692->6710|7744->6739
                    LINES: 19->1|22->1|23->2|23->2|23->2|69->48|69->48|69->48|101->80|101->80|101->80|133->112|133->112|133->112|197->176|197->176|197->176
                    -- GENERATED --
                */
            
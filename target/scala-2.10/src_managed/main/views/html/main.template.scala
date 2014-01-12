
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
object main extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template2[String,Html,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String)(content: Html):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.32*/("""
<!DOCTYPE html>
<html>
<head>
    <title>test</title>
    <link rel='shortcut icon' type='image/png' href='"""),_display_(Seq[Any](/*6.55*/routes/*6.61*/.Assets.at("images/favicon.png"))),format.raw/*6.93*/("""'>
    <link rel='stylesheet' href='"""),_display_(Seq[Any](/*7.35*/routes/*7.41*/.Assets.at("css/bootstrap.min.css"))),format.raw/*7.76*/("""'>
    <link rel='stylesheet' href='"""),_display_(Seq[Any](/*8.35*/routes/*8.41*/.Assets.at("stylesheets/home.css"))),format.raw/*8.75*/("""'>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src='"""),_display_(Seq[Any](/*10.42*/routes/*10.48*/.Assets.at("js/bootstrap.min.js"))),format.raw/*10.81*/("""'></script>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIo1FKI9xqFQl7M7dUR_Ds7ZDXt3RrWT4&sensor=true"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

    <style type="text/css">
        body"""),format.raw/*19.13*/("""{"""),format.raw/*19.14*/("""
            """),_display_(Seq[Any](/*20.14*/{

                if(color.toLowerCase == "green"){
                    """ background: #7ace61; /* Old browsers */
                        background: -moz-radial-gradient(center, ellipse cover,  #7ace61 0%, #97cc80 38%, #78ce6d 60%, #63b747 85%); /* FF3.6+ */
                        background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#7ace61), color-stop(38%,#97cc80), color-stop(60%,#78ce6d), color-stop(85%,#63b747)); /* Chrome,Safari4+ */
                        background: -webkit-radial-gradient(center, ellipse cover,  #7ace61 0%,#97cc80 38%,#78ce6d 60%,#63b747 85%); /* Chrome10+,Safari5.1+ */
                        background: -o-radial-gradient(center, ellipse cover,  #7ace61 0%,#97cc80 38%,#78ce6d 60%,#63b747 85%); /* Opera 12+ */
                        background: -ms-radial-gradient(center, ellipse cover,  #7ace61 0%,#97cc80 38%,#78ce6d 60%,#63b747 85%); /* IE10+ */
                        background: radial-gradient(ellipse at center,  #7ace61 0%,#97cc80 38%,#78ce6d 60%,#63b747 85%); /* W3C */
                        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7ace61', endColorstr='#63b747',GradientType=1 );
                        """
                } else if (color.toLowerCase == "yellow") {
                    """ background: #fefcea; /* Old browsers */
                        background: -moz-radial-gradient(center, ellipse cover,  #fefcea 0%, #f1da36 100%); /* FF3.6+ */
                        background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#fefcea), color-stop(100%,#f1da36)); /* Chrome,Safari4+ */
                        background: -webkit-radial-gradient(center, ellipse cover,  #fefcea 0%,#f1da36 100%); /* Chrome10+,Safari5.1+ */
                        background: -o-radial-gradient(center, ellipse cover,  #fefcea 0%,#f1da36 100%); /* Opera 12+ */
                        background: -ms-radial-gradient(center, ellipse cover,  #fefcea 0%,#f1da36 100%); /* IE10+ */
                        background: radial-gradient(ellipse at center,  #fefcea 0%,#f1da36 100%); /* W3C */
                        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#f1da36',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
                    """
                } else {
                    """background: #fefcea; /* Old browsers */
                        background: -moz-radial-gradient(center, ellipse cover,  #fefcea 0%, #d83131 100%); /* FF3.6+ */
                        background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#fefcea), color-stop(100%,#d83131)); /* Chrome,Safari4+ */
                        background: -webkit-radial-gradient(center, ellipse cover,  #fefcea 0%,#d83131 100%); /* Chrome10+,Safari5.1+ */
                        background: -o-radial-gradient(center, ellipse cover,  #fefcea 0%,#d83131 100%); /* Opera 12+ */
                        background: -ms-radial-gradient(center, ellipse cover,  #fefcea 0%,#d83131 100%); /* IE10+ */
                        background: radial-gradient(ellipse at center,  #fefcea 0%,#d83131 100%); /* W3C */
                        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#d83131',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
                    """
                }
            })),format.raw/*53.14*/("""
        """),format.raw/*54.9*/("""}"""),format.raw/*54.10*/("""
    </style>
</head>
<body>
    """),_display_(Seq[Any](/*58.6*/content)),format.raw/*58.13*/("""
    <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href=""""),_display_(Seq[Any](/*68.44*/routes/*68.50*/.MainController.index(color))),format.raw/*68.78*/("""">Time Aliens</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href=""""),_display_(Seq[Any](/*75.31*/routes/*75.37*/.MainController.missions(color))),format.raw/*75.68*/("""">
                        <span class="icon" id="mission"></span>
                        Missions
                    </a>
                </li>
                <li>
                    <a href=""""),_display_(Seq[Any](/*81.31*/routes/*81.37*/.MainController.story(color))),format.raw/*81.65*/("""">
                        <span class="icon" id="story"></span>
                        Story
                    </a>
                </li>
                <li class="divider">
                    <hr/>
                </li>
                <li>
                    <a href="#">
                        <span class="icon" id="facebook"></span>
                        Facebook
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon" id="twitter"></span>
                        Twitter
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon" id="gplus"></span>
                        Google +
                    </a>
                </li>
                <li class="divider">
                    <hr/>
                </li>
                <li>
                    <a href=""""),_display_(Seq[Any](/*111.31*/routes/*111.37*/.MainController.settings(color))),format.raw/*111.68*/("""">
                        <span id="setting" class="icon"></span>
                        Settings
                    </a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse --> </nav>
    <script type="text/javascript">
    const container = $(".container");
    container.css("height", ($(document).height()-51)+"px");
    container.css("max-height", ($(document).height()-51)+"px");

    try"""),format.raw/*125.8*/("""{"""),format.raw/*125.9*/("""
        pushup_div.css("height", $(".container").height()-35+"px");
    """),format.raw/*127.5*/("""}"""),format.raw/*127.6*/(""" catch (e)"""),format.raw/*127.16*/("""{"""),format.raw/*127.17*/("""
        console.log(e)
    """),format.raw/*129.5*/("""}"""),format.raw/*129.6*/("""
    </script>
</body>
</html>"""))}
    }
    
    def render(color:String,content:Html): play.api.templates.HtmlFormat.Appendable = apply(color)(content)
    
    def f:((String) => (Html) => play.api.templates.HtmlFormat.Appendable) = (color) => (content) => apply(color)(content)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Sun Jan 12 11:36:20 CET 2014
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/main.scala.html
                    HASH: 33a3d5c663e8690b784e267d01e2ffee83a2caa0
                    MATRIX: 560->1|684->31|828->140|842->146|895->178|967->215|981->221|1037->256|1109->293|1123->299|1178->333|1346->465|1361->471|1416->504|1913->973|1942->974|1992->988|5467->4441|5503->4450|5532->4451|5601->4485|5630->4492|6246->5072|6261->5078|6311->5106|6631->5390|6646->5396|6699->5427|6933->5625|6948->5631|6998->5659|7990->6614|8006->6620|8060->6651|8520->7083|8549->7084|8650->7157|8679->7158|8718->7168|8748->7169|8804->7197|8833->7198
                    LINES: 19->1|22->1|27->6|27->6|27->6|28->7|28->7|28->7|29->8|29->8|29->8|31->10|31->10|31->10|40->19|40->19|41->20|74->53|75->54|75->54|79->58|79->58|89->68|89->68|89->68|96->75|96->75|96->75|102->81|102->81|102->81|132->111|132->111|132->111|146->125|146->125|148->127|148->127|148->127|148->127|150->129|150->129
                    -- GENERATED --
                */
            
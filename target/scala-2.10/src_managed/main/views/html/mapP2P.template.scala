
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
object mapP2P extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""

"""),_display_(Seq[Any](/*3.2*/main(color)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""
<script>
function success(position) """),format.raw/*5.28*/("""{"""),format.raw/*5.29*/("""
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcontainer';
  mapcanvas.style.height = ($(document).height()-170)+"px";
  mapcanvas.style.width = $(document).width()+"px";

  document.querySelector('body').appendChild(mapcanvas);

  var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  
  var options = """),format.raw/*15.17*/("""{"""),format.raw/*15.18*/("""
    zoom: 11,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: """),format.raw/*19.31*/("""{"""),format.raw/*19.32*/("""
    	style: google.maps.NavigationControlStyle.SMALL
    """),format.raw/*21.5*/("""}"""),format.raw/*21.6*/(""",
    mapTypeId: google.maps.MapTypeId.ROADMAP
  """),format.raw/*23.3*/("""}"""),format.raw/*23.4*/(""";
  var map = new google.maps.Map(document.getElementById("mapcontainer"), options);

  var marker = new google.maps.Marker("""),format.raw/*26.39*/("""{"""),format.raw/*26.40*/("""
      map: map,
      title:"You are here!",
      position: coords
  """),format.raw/*30.3*/("""}"""),format.raw/*30.4*/(""");

  var arrival = new google.maps.LatLng(57.799833, 11.99735);

  var arrive = new google.maps.Marker("""),format.raw/*34.39*/("""{"""),format.raw/*34.40*/("""
      map: map,
      animation: google.maps.Animation.DROP,
      title: "Get here",
      position: arrival
  """),format.raw/*39.3*/("""}"""),format.raw/*39.4*/(""");



"""),format.raw/*43.1*/("""}"""),format.raw/*43.2*/("""

if (navigator.geolocation) """),format.raw/*45.28*/("""{"""),format.raw/*45.29*/("""
  navigator.geolocation.getCurrentPosition(success);
"""),format.raw/*47.1*/("""}"""),format.raw/*47.2*/(""" else """),format.raw/*47.8*/("""{"""),format.raw/*47.9*/("""
  error('Geo Location is not supported');
"""),format.raw/*49.1*/("""}"""),format.raw/*49.2*/("""

</script>
<div class="indication">
  <div class="container">
    <div class="row">
      <div class="col-xs-3">GOAL:</div>
      <div class="col-xs-9">Go from point A to point B</div>
    </div>
    <div class="row">
      <div class="col-xs-3">TIME REMAINING:</div>
      <div class="col-xs-9" id="countdown">1h 00m 00s</div>
    </div>
  </div>
</div>
<script type="text/javascript">
  const countdown = $("#countdown");

  function countDown()"""),format.raw/*67.23*/("""{"""),format.raw/*67.24*/("""

  var str = countdown.text();
  var values = str.split(" ");
  var hours = parseInt(values[0]);
  var min = parseInt(values[1]);
  var sec = parseInt(values[2]);

  var totalTime = 3600 * hours + 60 * min + sec -1;

  hours = Math.floor(totalTime / 3600);
  min = Math.floor((totalTime % 3600) / 60);
  sec = Math.floor((totalTime % 3600) % 60);

  countdown.text(hours+"h "+ min+"m "+ sec+"s ");

  return setTimeout(countDown, 1000);

  """),format.raw/*85.3*/("""}"""),format.raw/*85.4*/("""

  countDown();

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
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/mapP2P.scala.html
                    HASH: ffe9e28c8991760cc96faf6171384d175d30f1d8
                    MATRIX: 557->1|666->16|703->19|722->30|761->32|825->69|853->70|1246->435|1275->436|1395->528|1424->529|1509->587|1537->588|1613->637|1641->638|1793->762|1822->763|1920->834|1948->835|2080->939|2109->940|2249->1053|2277->1054|2310->1060|2338->1061|2395->1090|2424->1091|2505->1145|2533->1146|2566->1152|2594->1153|2664->1196|2692->1197|3168->1645|3197->1646|3665->2087|3693->2088
                    LINES: 19->1|22->1|24->3|24->3|24->3|26->5|26->5|36->15|36->15|40->19|40->19|42->21|42->21|44->23|44->23|47->26|47->26|51->30|51->30|55->34|55->34|60->39|60->39|64->43|64->43|66->45|66->45|68->47|68->47|68->47|68->47|70->49|70->49|88->67|88->67|106->85|106->85
                    -- GENERATED --
                */
            
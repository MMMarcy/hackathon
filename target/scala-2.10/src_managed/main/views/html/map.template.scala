
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
object map extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

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
    zoom: 12,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: """),format.raw/*19.31*/("""{"""),format.raw/*19.32*/("""
    	style: google.maps.NavigationControlStyle.SMALL
    """),format.raw/*21.5*/("""}"""),format.raw/*21.6*/(""",
    mapTypeId: google.maps.MapTypeId.ROADMAP
  """),format.raw/*23.3*/("""}"""),format.raw/*23.4*/(""";
  var map = new google.maps.Map(document.getElementById("mapcontainer"), options);

  var marker = new google.maps.Marker("""),format.raw/*26.39*/("""{"""),format.raw/*26.40*/("""
      position: coords,
      map: map,
      title:"You are here!"
  """),format.raw/*30.3*/("""}"""),format.raw/*30.4*/(""");


  var circleOptions = """),format.raw/*33.23*/("""{"""),format.raw/*33.24*/("""
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 0,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      center: coords,
      radius: 1000,
  """),format.raw/*42.3*/("""}"""),format.raw/*42.4*/(""";

  circle = new google.maps.Circle(circleOptions);



"""),format.raw/*48.1*/("""}"""),format.raw/*48.2*/("""

if (navigator.geolocation) """),format.raw/*50.28*/("""{"""),format.raw/*50.29*/("""
  navigator.geolocation.getCurrentPosition(success);
"""),format.raw/*52.1*/("""}"""),format.raw/*52.2*/(""" else """),format.raw/*52.8*/("""{"""),format.raw/*52.9*/("""
  error('Geo Location is not supported');
"""),format.raw/*54.1*/("""}"""),format.raw/*54.2*/("""

</script>
<div class="indication">
  <div class="container">
    <div class="row">
      <div class="col-xs-3">GOAL:</div>
      <div class="col-xs-9">Walk outside the circle</div>
    </div>
    <div class="row">
      <div class="col-xs-3">TIME REMAINING:</div>
      <div class="col-xs-9" id="countdown">1h 00m 00s</div>
    </div>
  </div>
</div>
<script type="text/javascript">
  const countdown = $("#countdown");

  function countDown()"""),format.raw/*72.23*/("""{"""),format.raw/*72.24*/("""

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

  """),format.raw/*90.3*/("""}"""),format.raw/*90.4*/("""

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
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/map.scala.html
                    HASH: c5ce6e7c7a77af7b4eb59fccb6fece25c6091480
                    MATRIX: 554->1|663->16|700->19|719->30|758->32|822->69|850->70|1243->435|1272->436|1392->528|1421->529|1506->587|1534->588|1610->637|1638->638|1790->762|1819->763|1917->834|1945->835|2000->862|2029->863|2249->1056|2277->1057|2360->1113|2388->1114|2445->1143|2474->1144|2555->1198|2583->1199|2616->1205|2644->1206|2714->1249|2742->1250|3215->1695|3244->1696|3712->2137|3740->2138
                    LINES: 19->1|22->1|24->3|24->3|24->3|26->5|26->5|36->15|36->15|40->19|40->19|42->21|42->21|44->23|44->23|47->26|47->26|51->30|51->30|54->33|54->33|63->42|63->42|69->48|69->48|71->50|71->50|73->52|73->52|73->52|73->52|75->54|75->54|93->72|93->72|111->90|111->90
                    -- GENERATED --
                */
            
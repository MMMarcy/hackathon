
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
object story extends BaseScalaTemplate[play.api.templates.HtmlFormat.Appendable,Format[play.api.templates.HtmlFormat.Appendable]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.HtmlFormat.Appendable] {

    /**/
    def apply/*1.2*/(color: String):play.api.templates.HtmlFormat.Appendable = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""

"""),_display_(Seq[Any](/*3.2*/main(color)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""
<div class="container">
	<span class="underlined">Level 1. The Invasion has began!!</span>
	<p class="justified">
		During a pacific and lazy afternoon the tranquillity of the sofa+television was broken by a loud and terryfing noise coming from the sky. Curios as always, you decided to go outside to have a better look at what was happening...
	</p>
	<span class="underlined">Level 2. What is that???</span>
	<p class="justified">
		Walking torward the door you noticed something weird.  The light filtering through the curtains was inusually cremisi. Even more curious, you dashed to reach the door and get a better look at the sky. While raising your head the heat coming from above forced you to raise your hand to create a shelter for your face. From between your fingers you could see the post-burners of a huge ship.
	</p>
	<span class="underlined">Level 3. The first encounter with the Time Aliens</span>
	<p class="justified">
		After your pupils shut to adapt to the strong light you saw something else. A swarm of smaller ships goes out of the belly of the metal giant which is still suspended in the sky. One of these went straight torwards you. As soon as it landed you saw through the transparent cockpit a life form that, with all certainity doesn't belong to this planet...
	</p>
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
                    SOURCE: /home/marcello/Projects/hackhathon/app/views/story.scala.html
                    HASH: 7d9ca0d50613dd386f2c3564d1e383b2c73b5079
                    MATRIX: 556->1|665->16|702->19|721->30|760->32
                    LINES: 19->1|22->1|24->3|24->3|24->3
                    -- GENERATED --
                */
            
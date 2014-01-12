// @SOURCE:/home/marcello/Projects/hackhathon/conf/routes
// @HASH:ec10f9127ba6d8c477be1a3e92a1a869892ee037
// @DATE:Sun Jan 12 11:36:18 CET 2014


import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._


import Router.queryString

object Routes extends Router.Routes {

private var _prefix = "/"

def setPrefix(prefix: String) {
  _prefix = prefix
  List[(String,Routes)]().foreach {
    case (p, router) => router.setPrefix(prefix + (if(prefix.endsWith("/")) "" else "/") + p)
  }
}

def prefix = _prefix

lazy val defaultPrefix = { if(Routes.prefix.endsWith("/")) "" else "/" }


// @LINE:5
private[this] lazy val controllers_MainController_index0 = Route("GET", PathPattern(List(StaticPart(Routes.prefix))))
        

// @LINE:6
private[this] lazy val controllers_MainController_index1 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:7
private[this] lazy val controllers_MainController_missions2 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("missions/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:8
private[this] lazy val controllers_MainController_map3 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("map/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:9
private[this] lazy val controllers_MainController_mapP2P4 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("mapp2p/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:10
private[this] lazy val controllers_MainController_mission15 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("mission/1/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:11
private[this] lazy val controllers_MainController_settings6 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:12
private[this] lazy val controllers_MainController_pushups7 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("pushups/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:13
private[this] lazy val controllers_MainController_story8 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("story/"),DynamicPart("color", """[^/]+""",true))))
        

// @LINE:17
private[this] lazy val controllers_Assets_at9 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("assets/"),DynamicPart("file", """.+""",false))))
        

// @LINE:18
private[this] lazy val controllers_WebJarAssets_at10 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("webjars/"),DynamicPart("file", """.+""",false))))
        
def documentation = List(("""GET""", prefix,"""controllers.MainController.index(color:String = "green")"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """$color<[^/]+>""","""controllers.MainController.index(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """missions/$color<[^/]+>""","""controllers.MainController.missions(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """map/$color<[^/]+>""","""controllers.MainController.map(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """mapp2p/$color<[^/]+>""","""controllers.MainController.mapP2P(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """mission/1/$color<[^/]+>""","""controllers.MainController.mission1(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings/$color<[^/]+>""","""controllers.MainController.settings(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """pushups/$color<[^/]+>""","""controllers.MainController.pushups(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """story/$color<[^/]+>""","""controllers.MainController.story(color:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """assets/$file<.+>""","""controllers.Assets.at(path:String = "/public", file:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """webjars/$file<.+>""","""controllers.WebJarAssets.at(file:String)""")).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
  case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
  case l => s ++ l.asInstanceOf[List[(String,String,String)]] 
}}
      

def routes:PartialFunction[RequestHeader,Handler] = {

// @LINE:5
case controllers_MainController_index0(params) => {
   call(Param[String]("color", Right("green"))) { (color) =>
        invokeHandler(controllers.MainController.index(color), HandlerDef(this, "controllers.MainController", "index", Seq(classOf[String]),"GET", """""", Routes.prefix + """"""))
   }
}
        

// @LINE:6
case controllers_MainController_index1(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.index(color), HandlerDef(this, "controllers.MainController", "index", Seq(classOf[String]),"GET", """""", Routes.prefix + """$color<[^/]+>"""))
   }
}
        

// @LINE:7
case controllers_MainController_missions2(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.missions(color), HandlerDef(this, "controllers.MainController", "missions", Seq(classOf[String]),"GET", """""", Routes.prefix + """missions/$color<[^/]+>"""))
   }
}
        

// @LINE:8
case controllers_MainController_map3(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.map(color), HandlerDef(this, "controllers.MainController", "map", Seq(classOf[String]),"GET", """""", Routes.prefix + """map/$color<[^/]+>"""))
   }
}
        

// @LINE:9
case controllers_MainController_mapP2P4(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.mapP2P(color), HandlerDef(this, "controllers.MainController", "mapP2P", Seq(classOf[String]),"GET", """""", Routes.prefix + """mapp2p/$color<[^/]+>"""))
   }
}
        

// @LINE:10
case controllers_MainController_mission15(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.mission1(color), HandlerDef(this, "controllers.MainController", "mission1", Seq(classOf[String]),"GET", """""", Routes.prefix + """mission/1/$color<[^/]+>"""))
   }
}
        

// @LINE:11
case controllers_MainController_settings6(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.settings(color), HandlerDef(this, "controllers.MainController", "settings", Seq(classOf[String]),"GET", """""", Routes.prefix + """settings/$color<[^/]+>"""))
   }
}
        

// @LINE:12
case controllers_MainController_pushups7(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.pushups(color), HandlerDef(this, "controllers.MainController", "pushups", Seq(classOf[String]),"GET", """""", Routes.prefix + """pushups/$color<[^/]+>"""))
   }
}
        

// @LINE:13
case controllers_MainController_story8(params) => {
   call(params.fromPath[String]("color", None)) { (color) =>
        invokeHandler(controllers.MainController.story(color), HandlerDef(this, "controllers.MainController", "story", Seq(classOf[String]),"GET", """""", Routes.prefix + """story/$color<[^/]+>"""))
   }
}
        

// @LINE:17
case controllers_Assets_at9(params) => {
   call(Param[String]("path", Right("/public")), params.fromPath[String]("file", None)) { (path, file) =>
        invokeHandler(controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]),"GET", """ Map static resources from the /public folder to the /assets URL path""", Routes.prefix + """assets/$file<.+>"""))
   }
}
        

// @LINE:18
case controllers_WebJarAssets_at10(params) => {
   call(params.fromPath[String]("file", None)) { (file) =>
        invokeHandler(controllers.WebJarAssets.at(file), HandlerDef(this, "controllers.WebJarAssets", "at", Seq(classOf[String]),"GET", """""", Routes.prefix + """webjars/$file<.+>"""))
   }
}
        
}

}
     
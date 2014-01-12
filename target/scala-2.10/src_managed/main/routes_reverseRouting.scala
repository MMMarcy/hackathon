// @SOURCE:/home/marcello/Projects/hackhathon/conf/routes
// @HASH:ec10f9127ba6d8c477be1a3e92a1a869892ee037
// @DATE:Sun Jan 12 11:36:18 CET 2014

import Routes.{prefix => _prefix, defaultPrefix => _defaultPrefix}
import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._


import Router.queryString


// @LINE:18
// @LINE:17
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
package controllers {

// @LINE:18
class ReverseWebJarAssets {
    

// @LINE:18
def at(file:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "webjars/" + implicitly[PathBindable[String]].unbind("file", file))
}
                                                
    
}
                          

// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
class ReverseMainController {
    

// @LINE:8
def map(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "map/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:6
// @LINE:5
def index(color:String): Call = {
   (color: @unchecked) match {
// @LINE:5
case (color) if color == "green" => Call("GET", _prefix)
                                                        
// @LINE:6
case (color) if true => Call("GET", _prefix + { _defaultPrefix } + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
                                                        
   }
}
                                                

// @LINE:12
def pushups(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "pushups/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:11
def settings(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "settings/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:13
def story(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "story/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:10
def mission1(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "mission/1/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:7
def missions(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "missions/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                

// @LINE:9
def mapP2P(color:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "mapp2p/" + implicitly[PathBindable[String]].unbind("color", dynamicString(color)))
}
                                                
    
}
                          

// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at(file:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[String]].unbind("file", file))
}
                                                
    
}
                          
}
                  


// @LINE:18
// @LINE:17
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
package controllers.javascript {

// @LINE:18
class ReverseWebJarAssets {
    

// @LINE:18
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.WebJarAssets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "webjars/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              

// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
class ReverseMainController {
    

// @LINE:8
def map : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.map",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "map/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:6
// @LINE:5
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.index",
   """
      function(color) {
      if (color == """ + implicitly[JavascriptLitteral[String]].to("green") + """) {
      return _wA({method:"GET", url:"""" + _prefix + """"})
      }
      if (true) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
      }
   """
)
                        

// @LINE:12
def pushups : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.pushups",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "pushups/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:11
def settings : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.settings",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "settings/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:13
def story : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.story",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "story/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:10
def mission1 : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.mission1",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "mission/1/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:7
def missions : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.missions",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "missions/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        

// @LINE:9
def mapP2P : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.MainController.mapP2P",
   """
      function(color) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "mapp2p/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("color", encodeURIComponent(color))})
      }
   """
)
                        
    
}
              

// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Assets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              
}
        


// @LINE:18
// @LINE:17
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
package controllers.ref {


// @LINE:18
class ReverseWebJarAssets {
    

// @LINE:18
def at(file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.WebJarAssets.at(file), HandlerDef(this, "controllers.WebJarAssets", "at", Seq(classOf[String]), "GET", """""", _prefix + """webjars/$file<.+>""")
)
                      
    
}
                          

// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
// @LINE:5
class ReverseMainController {
    

// @LINE:8
def map(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.map(color), HandlerDef(this, "controllers.MainController", "map", Seq(classOf[String]), "GET", """""", _prefix + """map/$color<[^/]+>""")
)
                      

// @LINE:5
def index(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.index(color), HandlerDef(this, "controllers.MainController", "index", Seq(classOf[String]), "GET", """""", _prefix + """""")
)
                      

// @LINE:12
def pushups(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.pushups(color), HandlerDef(this, "controllers.MainController", "pushups", Seq(classOf[String]), "GET", """""", _prefix + """pushups/$color<[^/]+>""")
)
                      

// @LINE:11
def settings(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.settings(color), HandlerDef(this, "controllers.MainController", "settings", Seq(classOf[String]), "GET", """""", _prefix + """settings/$color<[^/]+>""")
)
                      

// @LINE:13
def story(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.story(color), HandlerDef(this, "controllers.MainController", "story", Seq(classOf[String]), "GET", """""", _prefix + """story/$color<[^/]+>""")
)
                      

// @LINE:10
def mission1(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.mission1(color), HandlerDef(this, "controllers.MainController", "mission1", Seq(classOf[String]), "GET", """""", _prefix + """mission/1/$color<[^/]+>""")
)
                      

// @LINE:7
def missions(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.missions(color), HandlerDef(this, "controllers.MainController", "missions", Seq(classOf[String]), "GET", """""", _prefix + """missions/$color<[^/]+>""")
)
                      

// @LINE:9
def mapP2P(color:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.MainController.mapP2P(color), HandlerDef(this, "controllers.MainController", "mapP2P", Seq(classOf[String]), "GET", """""", _prefix + """mapp2p/$color<[^/]+>""")
)
                      
    
}
                          

// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at(path:String, file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]), "GET", """ Map static resources from the /public folder to the /assets URL path""", _prefix + """assets/$file<.+>""")
)
                      
    
}
                          
}
        
    
package controllers;

import play.mvc.Controller;
import play.mvc.Result;

public class MainController extends Controller {
    
    public static Result index() {
        return ok(views.html.index.render("Hello from Java"));
    }

    public static Result missions(){
    	return ok(views.html.missions.render());
    }
    
    public static Result map(){
    	return ok(views.html.map.render());
    }

    public static Result mapP2P(){
    	return ok(views.html.mapP2P.render());
    }

    public static Result mission1(){
    	return ok(views.html.mission1.render());
    }
}

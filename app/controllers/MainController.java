package controllers;

import play.mvc.Controller;
import play.mvc.Result;

public class MainController extends Controller {


    
    public static Result index(String color) {
        return ok(views.html.index.render(color));
    }

    public static Result missions(String color){
    	return ok(views.html.missions.render(color));
    }
    
    public static Result map(String color){
    	return ok(views.html.map.render(color));
    }

    public static Result mapP2P(String color){
    	return ok(views.html.mapP2P.render(color));
    }

    public static Result mission1(String color){
    	return ok(views.html.mission1.render(color));
    }

    public static Result settings(String color){
    	return ok(views.html.settings.render(color));
    }
}

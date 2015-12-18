class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"main", action:"index")
        "/index"(controller:"main", action:"index")
        "/responses"(controller:"main", action:"responses")
        "/publications"(controller:"main", action:"publications")
        "/about"(controller:"main", action:"about")
        "/login"(controller:"main", action:"login")
        "/signup"(controller:"main", action:"signup")
        
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

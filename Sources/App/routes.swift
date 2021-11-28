import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        //http://localhost:8080
        return "It works great!"
    }

    app.get("hello") { req -> String in
        //http://localhost:8080/hello
        return "Hello, World!"
    }
    
    app.get("hello", ":name") { req -> String in
        //http://localhost:8080/hello/tim
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        
        return "Hello, \(name)!"
    }
    
    app.post("info") { req -> String in
        let data = try req.content.decode(InfoData.self)
        return "Hello \(data.name)!"
    }
}

struct InfoData : Content {
    let name : String
}



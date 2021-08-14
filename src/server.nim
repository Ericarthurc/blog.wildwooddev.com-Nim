import prologue
import prologue/middlewares/staticfile

import router/router

let
  env = loadPrologueEnv(".env")
  settings = newSettings(port = Port(env.getOrDefault("port", 8080)),
      debug = env.getOrDefault("debug", true))

var app = newApp(settings)

# app.use(staticFileMiddleware(env.get("staticDir")))
app.use(staticFileMiddleware("static"))
app.addRoute(router.blogPatterns, "/blog")
app.run()

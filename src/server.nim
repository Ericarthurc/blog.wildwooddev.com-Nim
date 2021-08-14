import prologue
import prologue/middlewares/staticfile
from prologue/middlewares/staticfile import redirectTo

import router/router

let
  env = loadPrologueEnv(".env")
  settings = newSettings(port = Port(env.getOrDefault("port", 8080)),
      debug = env.getOrDefault("debug", true))

var app = newApp(settings)

# app.use(staticFileMiddleware(env.get("staticDir")))
app.use(staticFileMiddleware("/public"))
app.get("/manifest.webmanifest", redirectTo("/public/manifest.webmanifest"))
app.get("/robots.txt", redirectTo("/public/robots.txt"))
app.get("/sw.js", redirectTo("/public/sw.js"))
app.addRoute(router.blogPatterns, "/blog")
app.run()

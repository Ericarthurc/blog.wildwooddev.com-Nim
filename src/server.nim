import prologue
import prologue/middlewares/staticfile

import router/router

# import templates/index
# import utils/parsers

let
  env = loadPrologueEnv(".env")
  settings = newSettings(port = Port(env.getOrDefault("port", 8080)),
      debug = env.getOrDefault("debug", true))

var app = newApp(settings)

proc hello*(ctx: Context) {.async.} =
  resp "<h1>Hello, Pro!</h1>"

# proc indexCaller*(ctx: Context) {.async.} =
#   let parsedMarkdown = getHTMLMarkdown()
#   resp htmlResponse(indexPage(ctx, "INDEX", parsedMarkdown))

app.use(staticFileMiddleware(env.get("staticDir")))
app.addRoute(router.blogPatterns, "/blog")
app.run()

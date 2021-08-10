import prologue
import prologue/middlewares/staticfile

import templates/index

let
  env = loadPrologueEnv(".env")
  settings = newSettings(port = Port(env.getOrDefault("port", 8080)),
      debug = env.getOrDefault("debug", true))

var app = newApp(settings)

proc hello*(ctx: Context) {.async.} =
  resp "<h1>Hello, Pro!</h1>"

proc indexCaller*(ctx: Context) {.async.} =
  resp htmlResponse(indexPage(ctx, "INDEX"))

app.use(staticFileMiddleware(env.get("staticDir")))

app.get("/", indexCaller)

app.run()

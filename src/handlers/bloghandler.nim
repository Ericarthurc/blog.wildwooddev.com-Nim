import prologue

import ../templates/index
import ../utils/parsers

proc getBlog*(ctx: Context) {.async.} =
    let blog = ctx.getPathParams("blog")
    let parsedMarkdown = await getMarkdown(blog)
    resp htmlResponse(indexPage(ctx, "INDEX", parsedMarkdown))

proc getBlogIndex*(ctx: Context) {.async.} =
    resp htmlResponse("<h1>Blog Index</h1>")

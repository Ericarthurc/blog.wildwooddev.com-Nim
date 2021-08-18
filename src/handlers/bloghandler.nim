import prologue

import ../templates/index
import ../utils/parsers

proc getBlogIndex*(ctx: Context) {.async.} =
    # TODO: Needs template and parser finished
    discard await getMetaSeq()
    resp htmlResponse("<h1>Blog Index</h1>")

proc getBlog*(ctx: Context) {.async.} =
    let blog = ctx.getPathParams("blog")
    let parsedMarkdown = await getMarkdown(blog)
    resp htmlResponse(indexPage(ctx, "INDEX", parsedMarkdown))

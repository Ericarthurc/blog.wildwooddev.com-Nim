import prologue

import ../templates/blog
import ../utils/parsers

proc getBlogIndex*(ctx: Context) {.async.} =
    # TODO: Needs template and parser finished
    discard await getMetaSeq()
    resp htmlResponse("<h1>Blog Index</h1>")

proc getBlog*(ctx: Context) {.async.} =
    let blog = ctx.getPathParams("blog")
    let (parsedMarkdown, parsedMeta) = await getMarkdownAndMeta(blog)
    resp htmlResponse(blogPage(ctx, blog, parsedMarkdown, parsedMeta))

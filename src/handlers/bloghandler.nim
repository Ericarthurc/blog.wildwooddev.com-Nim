import prologue

import ../templates/blog
import ../utils/parsers

proc getBlogIndex*(ctx: Context) {.async.} =
    let parsedMetaSeq = await getMetaSeq()
    resp htmlResponse(blogIndex(ctx, parsedMetaSeq))

proc getBlog*(ctx: Context) {.async.} =
    let blog = ctx.getPathParams("blog")
    let (parsedMarkdown, parsedMeta) = await getMarkdownAndMeta(blog)
    resp htmlResponse(blogPage(ctx, blog, parsedMarkdown, parsedMeta))

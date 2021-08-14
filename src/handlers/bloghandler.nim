import prologue

import ../templates/index
import ../utils/parsers

proc getBlog*(ctx: Context) {.async.} =
    let parsedMarkdown = getHTMLMarkdown()
    resp htmlResponse(indexPage(ctx, "INDEX", parsedMarkdown))

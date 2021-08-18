import strtabs, strformat
import karax/[karaxdsl, vdom]
import prologue

import ../utils/parsers
import share/head
import share/navbar
import share/footer

proc indexSection*(ctx: Context, title: string, parsedMarkdown: string,
    parsedMeta: Meta): VNode =
  result = buildHtml(main(class = "content")):
    tdiv(class = "blog-container"): verbatim parsedMarkdown
    p(class = "tags"):
      for tag in parsedMeta.tags:
        verbatim fmt("`{tag}`") & """&#160;&#160;"""


proc blogPage*(ctx: Context, title: string,
    parsedMarkdown: string, parsedMeta: Meta): string =
  let head = sharedHead(ctx, parsedMeta.title)
  let navbar = sharedNav(ctx)
  let body = indexSection(ctx, title, parsedMarkdown, parsedMeta)
  let scripts = sharedFooter(ctx)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body
    scripts

  result = "<!DOCTYPE html>\n" & $vNode

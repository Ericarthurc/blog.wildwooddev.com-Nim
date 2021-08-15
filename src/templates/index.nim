import strtabs

import karax/[karaxdsl, vdom]
import prologue

import share/head

proc indexSection*(ctx: Context, title: string, parsedMarkdown: string): VNode =
  result = buildHtml(main(class = "content")):
    h3: text "TEST: " & title
    tdiv(): verbatim parsedMarkdown
    script(): verbatim "hljs.highlightAll();"
    script(): verbatim r"""console.log(`%cPowered by Nim {v0.0.1}!`, "color: #FF502A");"""

proc indexPage*(ctx: Context, title: string, parsedMarkdown: string): string =
  let head = sharedHead(ctx, title)
  let body = indexSection(ctx, title, parsedMarkdown)
  let vNode = buildHtml(html(lang = "en")):
    head
    body

  result = "<!DOCTYPE html>\n" & $vNode

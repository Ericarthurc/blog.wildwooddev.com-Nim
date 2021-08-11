import strtabs, strformat

import karax/[karaxdsl, vdom]
import prologue

import share/head

proc indexSection*(ctx: Context, title: string, parsedMarkdown: string): VNode =
  result = buildHtml(main(class = "content")):
    h3: text "TEST: " & title
    tdiv(): verbatim parsedMarkdown
    script(): text "hljs.highlightAll();"
    script(src = "/static/js/version.js")

proc indexPage*(ctx: Context, title: string, parsedMarkdown: string): string =
  let head = sharedHead(ctx, title)
  let body = indexSection(ctx, title, parsedMarkdown)
  let vNode = buildHtml(html):
    head
    body

  result = "<!DOCTYPE html>\n" & $vNode

import strtabs

import karax/[karaxdsl, vdom]
import prologue

import share/head
import share/navbar

proc indexSection*(ctx: Context, title: string, parsedMarkdown: string): VNode =
  result = buildHtml(main(class = "content")):
    h3: text "TEST: " & title
    tdiv(): verbatim parsedMarkdown
    script(): verbatim "hljs.highlightAll();"
    # script(): verbatim r"""if (!navigator.serviceWorker.controller) {
    #     navigator.serviceWorker.register("/sw.js").then(function(reg) {
    #     console.log("Service worker registered for scope: " + reg.scope);
    #     });
    #     }"""
    script(): verbatim r"""console.log(`%cPowered by Nim {v0.0.1}!`, "color: #FF502A");"""

proc indexPage*(ctx: Context, title: string, parsedMarkdown: string): string =
  let head = sharedHead(ctx, title)
  let navbar = sharedNav(ctx)
  let body = indexSection(ctx, title, parsedMarkdown)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body

  result = "<!DOCTYPE html>\n" & $vNode

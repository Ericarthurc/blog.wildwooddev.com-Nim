import prologue
import karax/[karaxdsl, vdom]

proc sharedHead*(ctx: Context, title: string): VNode =
  let vNode = buildHtml(head):
    title: text title & " - " & "testAPP"
    link(rel = "preconnect", href = "https://fonts.googleapis.com")
    link(rel = "preconnect", href = "https://fonts.gstatic.com",
        attrs = "crossorigin")
    link(href = "https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap",
        rel = "stylesheet")
    link(rel = "stylesheet", href = "/static/styles/main.css")
  return vNode

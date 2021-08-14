import prologue, strformat
import karax/[karaxdsl, vdom]

proc sharedHead*(ctx: Context, title: string): VNode =
  let vNode = buildHtml(head):
    meta(charset = "UTF-8")
    meta(name = "viewport", content = "width=device-width, initial-scale=1.0")
    meta(name = "description", content = "Wildwood Tech Blog For Learning")
    title(text fmt"{title} - testAPP")
    link(rel = "preconnect", href = "https://fonts.googleapis.com")
    link(rel = "preconnect", href = "https://fonts.gstatic.com",
        attrs = "crossorigin")
    link(href = "https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap",
        rel = "stylesheet")
    link(rel = "manifest", href = "/manifest.webmanifest")
    link(rel = "apple-touch-icon", sizes = "180x180",
        href = "/public/favicon/apple-touch-icon.png")
    link(rel = "icon", type = "image/png", sizes = "32x32",
        href = "/public/favicon/favicon-32x32.png")
    link(rel = "icon", type = "image/png", sizes = "16x16",
        href = "/public/favicon/favicon-16x16.png")
    link(rel = "manifest", href = "/public/favicon/site.webmanifest")
    link(rel = "stylesheet", href = "/public/styles/main.css")
    script(src = "/public/js/highlight.min.js")
  return vNode

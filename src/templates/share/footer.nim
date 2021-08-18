import prologue
import karax/[karaxdsl, vdom]

proc sharedFooter*(ctx: Context): VNode =
  let vNode = buildHtml(tdiv):
    script(): verbatim "hljs.highlightAll();"
    # script(): verbatim r"""if (!navigator.serviceWorker.controller) {
    #     navigator.serviceWorker.register("/sw.js").then(function(reg) {
    #     console.log("Service worker registered for scope: " + reg.scope);
    #     });
    #     }"""
    script(): verbatim r"""console.log(`%cPowered by Nim {v0.0.1}!`, "color: #FF502A");"""

  return vNode

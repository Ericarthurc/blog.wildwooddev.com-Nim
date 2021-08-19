import strtabs, strformat
import karax/[karaxdsl, vdom]
import prologue

import ../utils/parsers
import share/head
import share/navbar
import share/footer

proc blogIndexSection(ctx: Context, parsedMetaSeq: seq[Meta]): VNode =
  result = buildHtml(main(class = "content")):
    tdiv(class = "main-container"):
      h2(class = "main-header"): text "Wildwood Tech Posts"
      ul(class = "indexSeq"):
        for meta in parsedMetaSeq:
          li:
            a(class = "", href = fmt"/blog/{meta.fileName}"):
              tdiv(class = ""):
                span(class = "index-info__title"): text meta.title
                span(class = "index-info__date"): text meta.date

proc blogIndex*(ctx: Context, parsedMetaSeq: seq[Meta]): string =
  let head = sharedHead(ctx, "Blog")
  let navbar = sharedNav(ctx)
  let body = blogIndexSection(ctx, parsedMetaSeq)
  let scripts = sharedFooter(ctx)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body
    scripts

  result = "<!DOCTYPE html>\n" & $vNode



proc blogSection(ctx: Context, parsedMarkdown: string,
    parsedMeta: Meta): VNode =
  result = buildHtml(main(class = "content")):
    tdiv(class = "main-container"): verbatim parsedMarkdown
    p(class = "tags"):
      text "Tags "
      for tag in parsedMeta.tags:
        verbatim fmt("`{tag}` ")

proc blogPage*(ctx: Context, title: string,
    parsedMarkdown: string, parsedMeta: Meta): string =
  let head = sharedHead(ctx, parsedMeta.title)
  let navbar = sharedNav(ctx)
  let body = blogSection(ctx, parsedMarkdown, parsedMeta)
  let scripts = sharedFooter(ctx)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body
    scripts

  result = "<!DOCTYPE html>\n" & $vNode

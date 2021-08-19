import strtabs, strformat
import karax/[karaxdsl, vdom]
import prologue

import ../utils/parsers
import share/head
import share/navbar
import share/footer

proc seriesIndexSection(ctx: Context, parsedSeriesSeq: seq[string]): VNode =
  result = buildHtml(main(class = "content")):
    tdiv(class = "main-container"):
      h2(class = "main-header"): text "Series Categories"
      ul(class = "indexSeq"):
        for series in parsedSeriesSeq:
          li:
            a(class = "", href = fmt"/series/{series}"):
              tdiv(class = ""):
                span(class = "index-info__title"): text series

proc seriesIndex*(ctx: Context, parsedSeriesSeq: seq[string]): string =
  let head = sharedHead(ctx, "Series")
  let navbar = sharedNav(ctx)
  let body = seriesIndexSection(ctx, parsedSeriesSeq)
  let scripts = sharedFooter(ctx)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body
    scripts

  result = "<!DOCTYPE html>\n" & $vNode



proc seriesSection(ctx: Context, parsedMetaSeq: seq[Meta]): VNode =
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

proc seriesPage*(ctx: Context, parsedMetaSeq: seq[Meta]): string =
  let head = sharedHead(ctx, "Series")
  let navbar = sharedNav(ctx)
  let body = seriesSection(ctx, parsedMetaSeq)
  let scripts = sharedFooter(ctx)
  let vNode = buildHtml(html(lang = "en")):
    head
    navbar
    body
    scripts

  result = "<!DOCTYPE html>\n" & $vNode

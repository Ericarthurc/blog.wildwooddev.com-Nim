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
      ul(class = "index-list"):
        for series in parsedSeriesSeq:
          li:
            a(class = "list-anchor", href = fmt"/series/{series}"):
              tdiv(class = "list-anchor__info"):
                span(class = "info-title"): text series

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
      ul(class = "index-list"):
        for meta in parsedMetaSeq:
          li:
            a(class = "list-anchor", href = fmt"/blog/{meta.fileName}"):
              tdiv(class = "list-anchor__info"):
                span(class = "info-title"): text meta.title
                span(class = "info-date"): text meta.date

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

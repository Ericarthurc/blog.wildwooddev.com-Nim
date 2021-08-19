import prologue

import ../templates/series
import ../utils/parsers

proc getSeriesIndex*(ctx: Context) {.async.} =
  let seriesSeq = await getSeriesSeq()
  resp htmlResponse(seriesIndex(ctx, seriesSeq))

proc getSeries*(ctx: Context) {.async.} =
  let series = ctx.getPathParams("series")
  try:
    let parsedMetaSeq = await getMetaBySeries(series)
    resp htmlResponse(seriesPage(ctx, parsedMetaSeq))
  except:
    respDefault Http404

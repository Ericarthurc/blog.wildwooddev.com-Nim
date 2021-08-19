import prologue

import ../templates/series
import ../utils/parsers

proc getSeriesIndex*(ctx: Context) {.async.} =
  echo await getSeriesSeq()

proc getSeries*(ctx: Context) {.async.} =
  let series = ctx.getPathParams("series")
  echo await getMetaBySeries(series)

import prologue

import ../handlers/bloghandler
import ../handlers/serieshandler

let
    blogPatterns* = @[
        pattern("/", getBlogIndex, @[HttpGet]),
        pattern("/{blog}", getBlog, @[HttpGet])
    ]
    seriesPatterns* = @[
        pattern("/", getSeriesIndex, @[HttpGet]),
        pattern("/{series}", getSeriesIndex, @[HttpGet])
    ]

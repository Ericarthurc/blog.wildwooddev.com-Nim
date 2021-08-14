import prologue

import ../handlers/bloghandler

let
    blogPatterns* = @[
        pattern("/", getBlogIndex, @[HttpGet]),
        pattern("/{blog}", getBlog, @[HttpGet])
    ]
    # seriesPatterns* = @[
    #     pattern("/",, @[HttpGet])
    # ]

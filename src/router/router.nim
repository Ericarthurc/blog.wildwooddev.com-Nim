import prologue

import ../handlers/bloghandler

let
    blogPatterns* = @[
        pattern("/", getBlog, @[HttpGet])
    ]

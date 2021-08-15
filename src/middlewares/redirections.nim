import strutils, strformat, options, sequtils, sugar, os
from prologue/middlewares/staticfile import redirectTo

proc redirectDir(dir: string) =
    return

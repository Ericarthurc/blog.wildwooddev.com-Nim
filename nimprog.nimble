# Package

version       = "0.0.1"
author        = "Ericarthurc"
description   = "Nim backend tests"
license       = "MIT"
srcDir        = "src"
bin           = @["server"]


# Dependencies

requires "nim >= 1.4.8"
requires "prologue >= 0.4.8"
requires "karax >= 1.2.1"
requires "nmark >= 0.1.10"

task prodbuild, "Build for production":
    exec "nimble build -d:release --threads:on --tlsEmulation:off"

task extension, "Install all extensions":
  exec "nimble install prologue"
  exec "nimble install karax"
  exec "nimble install nmark"
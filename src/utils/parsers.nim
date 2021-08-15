import strutils, strformat, options, sequtils, sugar, os, asyncfile, asyncdispatch

import nmark
# import ../utils/nmark/nmark

type Meta* = object
    title*: string
    date*: string
    tags*: seq[string]
    series*: Option[string]

proc metaParser(rawData: string): Meta =
    var t = Meta()

    var lined = rawData.split("---")[1].split("\n")
    lined = map(lined, (x) => replace(x, "\c", ""))
    for line in lined:
        if not(isEmptyOrWhitespace(line)):
            case line.split(":")[0]:
                of "title":
                    t.title = line.split(":")[1].strip()
                of "date":
                    t.date = line.split(":")[1].strip()
                of "tags":
                    t.tags = line.split(":")[1].strip().split(", ")
                of "series":
                    t.series = some(line.split(":")[1].strip())
    return t

proc markdownParser(rawData: string): string {.gcsafe.} =
    var lined = rawData.split("---")[2]
    return lined.markdown

# proc file(path: string) {.async.} =
#     var file = openAsync("./markdown/" & path)
#     let data = await file.readAll()
#     echo metaParser(data)
#     file.close()

# proc readFiles() =
#     for kind, path in walkDir("./markdown", relative = true):
#         var data = readFile("./markdown/" & path)
#         echo metaParser(data)
#         echo markdownParser(data)

proc getMarkdown*(fileName: string): Future[string] {.async.} =
    var file = openAsync(fmt"./markdown/{fileName}.markdown")
    let data = await file.readAll()
    file.close()
    return markdownParser(data)

proc getMetaSeq*() {.async.} =
    for _, path in walkDir("./markdown", relative = true):
        var fileData = openAsync(fmt"./markdown/{path}")
        let data = await fileData.readAll()
        echo metaParser(data)


# Parse markdown to HTML and get Meta

# Get sequence of blog meta (filename, date) [sorted by date]

# Get set of series [sorted alphabetically]

# Get sequence of blog meta by series (filename, date) [sorted by date]

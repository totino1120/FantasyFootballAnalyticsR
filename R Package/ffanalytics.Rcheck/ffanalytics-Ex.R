pkgname <- "ffanalytics"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('ffanalytics')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("dataPeriod-class")
### * dataPeriod-class

flush(stderr()); flush(stdout())

### Name: dataPeriod-class
### Title: Class to represent the period for a datascrape
### Aliases: dataPeriod dataPeriod-class

### ** Examples

dataPeriod(weekNo = 1, season = 2015) # Week 1 of the 2015 season
dataPeriod(season = 2015)             # 2015 season
dataPeriod(weekNo = 3)                # Week 3 of the current year
dataPeriod()                          # Current season



cleanEx()
nameEx("firstLast")
### * firstLast

flush(stderr()); flush(stdout())

### Name: firstLast
### Title: Reverse Last and First Name
### Aliases: firstLast

### ** Examples

firstLast("Smith, John") # Will return John Smith



cleanEx()
nameEx("getProjections")
### * getProjections

flush(stderr()); flush(stdout())

### Name: getProjections
### Title: Calculate Projected Points
### Aliases: getProjections

### ** Examples

getProjections(scrapeData,                    ## Based on data in scrapeData
               avgMethod = "weighted",        ## calculate the projections using a weighted average
               leagueScoring = scoringRules,  ## using defined scoringRules,
               vorBaseline, vorType,          ## VOR Baselines and types
               teams = 12, format = "ppr",    ## for a 12 team ppr league
               mflMocks = 0, mflLeagues = 0,  ## using only real MFL redraft league
               adpSources =  c("FFC", "MFL")) ## and ADP data from MFL and FFC



cleanEx()
nameEx("runScrape")
### * runScrape

flush(stderr()); flush(stdout())

### Name: runScrape
### Title: Scrape Projections
### Aliases: runScrape

### ** Examples

runScrape(season = 2016, week = 0,         ## Scrape 2016 season data for all
         analysts = 99, positions = "all") ## available analysts and positions

runScrape(season = 2016, week = 1,               ## Scrape 2016 week 1 data for
         analysts = c(-1, 5),                    ## CBS Average and NFL.com
         positions = c("QB", "RB", "WR", "TE",)) ## and offensive positions



cleanEx()
nameEx("scoringRules")
### * scoringRules

flush(stderr()); flush(stdout())

### Name: scoringRules
### Title: Default scoring rules.
### Aliases: scoringRules
### Keywords: datasets

### ** Examples

scoringRules <- list(
   QB = data.table::data.table(dataCol = c("passYds", "passTds", "passInt", "rushYds", "rushTds", "twoPts", "fumbles"),
                               multiplier = c(1/25, 4, -3, 1/10, 6, 2, -3 )),
   RB = data.table::data.table(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                               multiplier = c(1/10, 6, 0, 1/8, 6, 6, 2, -3)),
   WR = data.table::data.table(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                               multiplier = c(1/10, 6, 0, 1/8, 6, 6, 2, -3)),
   TE = data.table::data.table(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                               multiplier = c(1/10, 6, 0, 1/8, 6, 6, 2, -3)),
   K = data.table::data.table(dataCol = c("xp", "fg0019", "fg2029", "fg3039", "fg4049", "fg50"),
                              multiplier = c(1,  3, 3, 3, 4, 5)),
   DST = data.table::data.table(dataCol = c("dstFumlRec", "dstInt", "dstSafety", "dstSack", "dstTd", "dstBlk"),
                                multiplier = c(2, 2, 2, 1, 6, 1.5)),
   DL = data.table::data.table(dataCol = c("idpSolo", "idpAst", "idpSack", "idpInt", "idpFumlForce", "idpFumlRec", "idpPD", "idpTd", "idpSafety"),
                               multiplier = c(1, 0.5, 2, 3, 3, 2, 1, 6, 2)),
   LB =  data.table::data.table(dataCol = c("idpSolo", "idpAst", "idpSack", "idpInt", "idpFumlForce", "idpFumlRec", "idpPD", "idpTd", "idpSafety"),
                                multiplier = c(1, 0.5, 2, 3, 3, 2, 1, 6, 2)),
   DB = data.table::data.table(dataCol = c("idpSolo", "idpAst", "idpSack", "idpInt", "idpFumlForce", "idpFumlRec", "idpPD", "idpTd", "idpSafety"),
                               multiplier = c(1, 0.5, 2, 3, 3, 2, 1, 6, 2)),
   ptsBracket = data.table::data.table(threshold = c(0, 6, 20, 34, 99),
                                       points = c(10, 7, 4, 0, -4))
)



cleanEx()
nameEx("sourceAnalyst-class")
### * sourceAnalyst-class

flush(stderr()); flush(stdout())

### Name: sourceAnalyst-class
### Title: Class to represent the source Analysts
### Aliases: sourceAnalyst sourceAnalyst-class

### ** Examples

cbs.avg <- sourceAnalyst(analystName = "Average",
                         sourceId = "avg",
                         analystId = "cbav")



cleanEx()
nameEx("sourceSite-class")
### * sourceSite-class

flush(stderr()); flush(stdout())

### Name: sourceSite-class
### Title: Class to represent source sites
### Aliases: sourceSite sourceSite-class

### ** Examples

sourceSite(siteName = "CBS",
           siteUrl = "http://www.cbssports.com/fantasy/football/stats/weeklyprojections/{$Pos}/season/{$SrcID}/standard?&print_rows=9999",
           urlType = "html",
           urlTable = "1",
           playerLink = "/fantasyfootball/players/playerpage/[0-9]{3,6}",
           playerId = "cbsId")



cleanEx()
nameEx("sourceTable-class")
### * sourceTable-class

flush(stderr()); flush(stdout())

### Name: sourceTable-class
### Title: Class to represent a data table from a source site
### Aliases: sourceTable sourceTable-class

### ** Examples

cbs.qb <- sourceTable(sourcePosition = "QB",
                      positionAlias = "QB",
                      startPage = 1,
                      endPage = 1,
                      stepPage = 1,
                      tableId = 1
                     )



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')

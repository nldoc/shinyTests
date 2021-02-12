## GLOBAL

source("textModule.R")

pool <- pool::dbPool(RSQLite::SQLite(),
                     dbname = "/Users/jan/Library/R/4.0/library/insciit/sqlite/sciit.sqlite")

## GLOBAL

source("textModule.R")
pool <- pool::dbPool(RSQLite::SQLite(),
                     dbname = "data/dummy.sqlite")

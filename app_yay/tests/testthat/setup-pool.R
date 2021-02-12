## Setup

## source global
print("Setup sqlite pool")
pool_location <- file.path(dirname(dirname(getwd())), "data/dummy.sqlite")
pool <- pool::dbPool(RSQLite::SQLite(),
                     dbname = pool_location)




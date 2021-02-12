con <- DBI::dbConnect(RSQLite::SQLite(), "app/data/dummy.sqlite")
DBI::dbWriteTable(con, "cars", mtcars, overwrite=TRUE)
DBI::dbWriteTable(con, "chicks", chickwts, overwrite=TRUE)
DBI::dbDisconnect(con)

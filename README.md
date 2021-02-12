# shinyTests
Minimal reproducible example for shiny test bug (referencing outputs)


## Bug description

shiny::testServer is stuck in endless loop when any reactive contains a call to a pool or sql database (DBI).

## Details

Usually, we can access output elements of modules during tests.
For example we can check if our textOutput exists like so: `output$text`.
However, this does not work any more if any reactive element within the tested module contains an SQL query.

You can check that with this reproducible example here.
There are two apps in this repo which are completely similar except the `textModule.R` function.
In app_yay, we define a reactive data frame which will report the mtcars dataset directly.
In app_nay, we load the mcars database from a pool object which is defined and loaded in `global.R`

Both apps run fine:
```
### Run app:
shiny::runApp("app_yay")
shiny::runApp("app_nay")
```

But when we run testthat, we see that app_nay is stuck in an endless loop:
```
### Run tests:
shiny::runTests("app_yay")
shiny::runTests("app_nay")
```

Whats also interesting: You need to restart your session in order to succesfully run app_yay after app_nay has failed.

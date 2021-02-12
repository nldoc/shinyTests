
testthat::test_that("Server textModule works correctly", {
  shiny::testServer(textModule, expr = {

    session$setInputs(switch = TRUE)

    print(dat())

    #testthat::expect_equal(output$text, "Selected data has: 578 rows")
    print(output$text)
    testthat::expect_equal(input$switch, TRUE)
  })
})


testthat::test_that("Server textModule works correctly", {
  shiny::testServer(textModule, expr = {

    session$setInputs(switch = FALSE)

    print(dat())

    #testthat::expect_equal(output$text, "Selected data has: 578 rows")
    output$text
    testthat::expect_equal(input$switch, FALSE)
  })
})

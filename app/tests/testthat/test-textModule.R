
testthat::test_that("Server textModule works correctly", {
  shiny::testServer(textModule, expr = {


    print(output$text)
    testthat::expect_equal(output$text, "Global")

  })
})


textModule <- function(id){
  shiny::moduleServer(
    id,
    function(input, output, session){

      dat <- shiny::reactive({
        if(input$switch) {
          x <- pool::dbGetQuery(pool, "SELECT * FROM cars")
        } else {
          x <- NULL
        }
        return(x)
      })

      ## test fails even if I do not reference any reactive object in output:
      output$text <- renderText("blabla")

    }
  )
}

textModuleUI <- function(id, label="textmod"){
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::checkboxInput(ns("switch"), label="switch"),
    shiny::textOutput(ns("text")))
}

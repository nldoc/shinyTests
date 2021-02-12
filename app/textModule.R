
textModule <- function(id){
  shiny::moduleServer(
    id,
    function(input, output, session){

      ## Prepare Data for Table view, it is reactive so use profilestable_filtered() to access it:
      dat <- shiny::reactive({
        if(input$switch) {
          x <- pool::dbGetQuery(pool, "SELECT * FROM metrics")
        } else {
          x <- pool::dbGetQuery(pool, "SELECT * FROM metrics")
        }
        return(x)
      })

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

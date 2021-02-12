
textModule <- function(id){
  shiny::moduleServer(
    id,
    function(input, output, session){

      ## Prepare Data for Table view, it is reactive so use profilestable_filtered() to access it:
      dat <- shiny::reactive({
        req(input$switch)
        if(input$switch) {
          x <- pool::dbGetQuery(poolINSCIIT, "SELECT * FROM profilestable")
        } else {
          x <- pool::dbGetQuery(poolINSCIIT, "SELECT * FROM metrics")
        }
        return(x)
      })

      output$text <- renderText(paste0("Selected data has: ", nrow(dat()), " rows"))

    }
  )
}

textModuleUI <- function(id, label="textmod"){
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::checkboxInput(ns("switch"), label="switch"),
    shiny::textOutput(ns("text")))
}

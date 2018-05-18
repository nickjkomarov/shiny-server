
# Server logic
server <- function(input, output) {
  
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  
  
  stockName <- reactive ({
  	getSymbols(input$symb, src = "yahoo",
  		   auto.assign = FALSE)
  		   })
  
  
  
  finalInput <- reactive({
  	if(!input$adjust) return(dataInput())
  	adjust(dataInput())
  	})
  
  output$plot <- renderPlot({
    
    chartSeries(finalInput(), theme = chartTheme("white"), 
                type = "line", log.scale = input$log, TA = NULL, name = input$symb)
  })
  
}


library(shiny)
shinyServer(function(input, output) {
    # Use a reactive expression to generate the requested distribution. 
    # Everytime the input changes (distribution and number of observation),
    # the results will change accordingly.
    data <- reactive({  
        dist <- switch(input$distribution,
                       norm = rnorm,
                       unif = runif,
                       lnorm = rlnorm,
                       exp = rexp,
                       rnorm)
        
        dist(input$n)
    })
    
    # For the plot tab, create a histogram dependent on the inputs
    output$plot <- renderPlot({
        dist <- input$distribution
        n <- input$n
        
        hist(data(), 
             main=paste('r', dist, '(', n, ')', sep=''))
    })
    
    # For the summary tab, create a summary of the generated data
    output$summary <- renderPrint({
        summary(data())
    })
    
    # For the table table, create a tabke view of the generated data
    output$table <- renderTable({
        data.frame(x=data())
    })
})
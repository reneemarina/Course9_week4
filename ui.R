library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Types of Distribution"),
    # Create a sidebar with a dropdown list to select preferred distribution type.
    # Include the number of observations used.
    # Click on the submit button to update the results.
    sidebarPanel(
        selectInput("distribution", "Choose a distribution type:", 
                    choices = c("Normal" = "norm","Uniform" = "unif","Log-normal" = "lnorm","Exponential" = "exp")),
    sliderInput("n", 
                "Number of observations:", 
                value = 500,
                min = 1, 
                max = 1000),
    
        submitButton("Update Selection")
    ),
    
    # Show 3 tabs, which shows plot, summary, and table view 
    # of the selected distribution results.
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("plot")), 
            tabPanel("Summary", verbatimTextOutput("summary")), 
            tabPanel("Table", tableOutput("table"))
        )
    )
))
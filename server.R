server.R
library(shiny)
library(RCurl) # 1. Load the RCurl package

# --- RCurl Feasibility Test ---
# Define a well-known public URL to test connectivity
public_url <- "https://www.r-project.org/" 

# Use url.exists() to check if the URL is accessible
# This is executed once when the server logic is initialized
if (url.exists(public_url)) {
  cat("\n*** RCurl Test Successful ***\n")
  cat(paste("Successfully connected to:", public_url, "\n"))
} else {
  cat("\n*** RCurl Test Failed ***\n")
  cat(paste("Could not connect to:", public_url, "\n"))
  cat("Please check your internet connection and proxy settings.\n")
}
cat("*****************************\n\n")
# -----------------------------

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$distPlot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # Note: 'input$obs' needs to be defined in your 'ui.R' (e.g., a slider)
    dist <- rnorm(input$obs)
    hist(dist)
  })
  
})

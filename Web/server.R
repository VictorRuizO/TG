#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
library(stringi)
library(stringr)  
library(dplyr)
library(e1071)
library(quanteda)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    salida <- eventReactive(input$predict_button, {
        
        s <- prede(input$user_input)
        
        ifelse(s==-1,"Negativo",
               ifelse(s==0, "Neutro","Positivo"))
    })
    
    output$predict_sentiment <- renderText({
        salida()
    })

})


prede <- function(texto){
    
    tokens <- limpiar(c(texto))
    
    tokens.dfm <- dfm(x = tokens,dictionary = dimensiones.matriz.tfidf)
    tokens.tfidf <- dfm_tfidf(tokens.dfm, scheme_tf = "prop",
                                    scheme_df = "count")
    tokens.tfidf <- convert(tokens.tfidf, to="data.frame")[,-1]
    #View(tokens.tfidf)
    sentiment.total <- predict(svm.up, newdata = tokens.tfidf)
    
    return(sentiment.total[1])
}



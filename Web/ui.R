#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fixedPage(
    
    fluidRow(
        br(),
        br(),
        column(2, img(src='univalle.png', 
                      align = "right",
                      height = '150px', 
                      width = '100px')),
        column(10,titlePanel("Predicción del sentimiento"),
               em(h4("Proyecto de final de carrera")),
               p(style="text-align: justify;","Esta página tiene como propósito 
                 clasificar nuevas opiniones con base en el modelo de machine learning 
                 entrenado en el proyecto de final de carrera con titulo ‘Estudio de 
                 la popularidad de la Universidad del Valle frente al paro estudiantil 
                 ocurrido entre octubre y diciembre del 2018 mediante el uso del análisis 
                 de sentimientos’."))),
    br(),
    
    
    # Application title
    
    
    
    
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h2("Instrucciones:"), 
            h4(style="text-align: justify;","1. Escriba la oración que se quiere predecir en el campo de texto."),
            h4(style="text-align: justify;","2. Presione el botón predecir."),
            h4(style="text-align: justify;","3. El sentimiento predicho se mostrará en el texto."),
            h4(style="text-align: justify;","4. En la pestaña de información se muestra más información acerca del desarrollo de esta aplicación."),
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Predecir",
                         textInput("user_input", h3("Tu oración:"), 
                                   value = "", width='80%'),
                         actionButton("predict_button", "Predecir"),
                         h3("Sentimiento predicho:"),
                         
                         h4(em(span(textOutput("predict_sentiment"), style="color:#909090"))),
                         br(),
                ),
                tabPanel("Información",
                         h3("Aplicación desarrollada por:"),
                         em(p("Victor Duvan Ruiz Ochoa")),
                         em(p("victor.ochoa@correounivalle.edu.co")),
                         em(p("2021")),
                         br(),
                         p(em(strong("Código fuente: ")),
                         tags$a(href="https://github.com/VictorRuizO/TG",
                                "https://github.com/VictorRuizO/TG")),
                         p(em(strong("Proyecto final: ")),
                           tags$a(href="https://github.com/VictorRuizO/TG/blob/main/documento_tg.pdf",
                                  "aquí"))
                )
            )   
        )
    )
))


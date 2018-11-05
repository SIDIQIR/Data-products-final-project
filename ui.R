library(shiny)
library(ggplot2)
library(gridExtra)

ui <- shinyUI(fluidPage(
  titlePanel("Side Panel"),
  sidebarLayout(position = "left",
                sidebarPanel("Sidebar panel",
                             checkboxInput("first", "mtcar analysis: mpg vs disp", value = T),
                             checkboxInput("second", "mtcar analysis: mpg vs wt", value = T),
                             sliderInput("sc1","Scale 1",min=1,max=5,value=1),
                             sliderInput("sc2","Scale 2",min=1,max=5,value=1)
                             
                ),
                mainPanel("main panel",
                          column(4,plotOutput(outputId="plotgraph", width="800px",height="300px"))
))))

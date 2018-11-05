server <- shinyServer(function(input, output) 
{
  set.seed(12345)
  pt1 <- reactive({
    a1<- aggregate(as.numeric(mtcars$mpg)~as.numeric(mtcars$disp), FUN = mean)
    if (!input$first) return(NULL)
    qplot(x = a1$`as.numeric(mtcars$mpg)`, y= a1$`as.numeric(mtcars$disp)`,
          main = "MPG vs Disp", xlab = "MPG", ylab = "Displacement")
  })
  pt2 <- reactive({
    a<- aggregate(as.numeric(mtcars$mpg)~as.numeric(mtcars$wt), FUN = mean)
    
    if (!input$second) return(NULL)
    
    qplot(x = a$`as.numeric(mtcars$mpg)`, y= a$`as.numeric(mtcars$wt)`,
          ,main ="MPG vs Weight" , xlab = "MPG", ylab = "Weight")
  })
  
  output$plotgraph = renderPlot({
    ptlist <- list(pt1(),pt2())
    wtlist <- c(input$sc1,input$sc2)
    
    to_delete <- !sapply(ptlist,is.null)
    ptlist <- ptlist[to_delete] 
    wtlist <- wtlist[to_delete]
    if (length(ptlist)==0) return(NULL)
    grid.arrange(grobs=ptlist,widths=wtlist,ncol=length(ptlist))
  })
})

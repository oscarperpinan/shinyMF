library(shiny)

library(raster)
library(rasterVis)
library(meteoForecast)

shinyServer(function(input, output) {

    rasterInput <- reactive({
        getRaster(var = input$var,
                  day = Sys.Date() - 1,
                  box = c(input$west, input$east,
                      input$south, input$north))
    })

    output$view1 <- renderPlot({
        print(levelplot(rasterInput(),
                        layers=1:24, layout=c(6, 4),
                        names.attr=paste0(1:24, 'h'),
                        par.settings=BTCTheme(),
                        scales=list(draw=FALSE))) ## + spainLayer)
    })
    output$view2 <- renderPlot({
        print(levelplot(rasterInput(),
                        layers=25:48, layout=c(6, 4),
                        names.attr=paste0(1:24, 'h'),
                        par.settings=BTCTheme(),
                        scales=list(draw=FALSE))) ## + spainLayer)
    })
    output$view3 <- renderPlot({
        print(levelplot(rasterInput(),
                        layers=49:72, layout=c(6, 4),
                        names.attr=paste0(1:24, 'h'),
                        par.settings=BTCTheme(),
                        scales=list(draw=FALSE))) ## + spainLayer)
    })
    output$view4 <- renderPlot({
        print(levelplot(rasterInput(),
                        layers=73:96, layout=c(6, 4),
                        names.attr=paste0(1:24, 'h'),
                        par.settings=BTCTheme(),
                        scales=list(draw=FALSE))) ## + spainLayer)
    })
                          
})

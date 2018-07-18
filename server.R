library(shiny)

shinyServer(function(input,output) {
   modelWind<-lm(Ozone~Wind,data=airquality)
   modelSolar<-lm(Ozone~Solar.R,data=airquality)
   
   predWind<-reactive({
     windInput<-input$sliderWind
     predict(modelWind,newdata=data.frame(Wind=windInput))
   })
   predSolar<-reactive({
     solarInput<-input$sliderSolar
     predict(modelSolar,newdata=data.frame(Solar.R=solarInput))
   })
     
   output$windPlot<-renderPlot({
     windInput<-input$sliderWind
     plot(airquality$Wind,airquality$Ozone,xlab="Wind Speed (mph)",
         ylab="Ozone (ppm)")
     abline(modelWind,col="blue",lwd=2)
     points(windInput,predWind(),col="blue",pch=16,cex=2)
   })
   output$predW<-renderText({
     predWind()
   })
   
   output$solarPlot<-renderPlot({
     solarInput<-input$sliderSolar
     plot(airquality$Solar.R,airquality$Ozone,xlab="Solar Radiation (lang)",
          ylab="Ozone (ppm)")
     abline(modelSolar,col="red",lwd=2)
     points(solarInput,predSolar(),col="red",pch=16,cex=2)
   })
   output$predS<-renderText({
     predSolar()
   })
})

library(UsingR)
data(galton)

shinyServer(
        function(input, output) {
                output$xyplot <- renderPlot({
                        
                        x<-subset(mtcars,select = input$xaxis)[,1]
                        y<-mtcars$mpg
                        newx<-as.numeric(input$predictor)
                        data<-data.frame(x=x,y=y,type="Original")
                        fit<-lm(y~x,data=data)
                        newy<-predict(fit,newdata=data.frame(x=newx))
                        newdata<-rbind(data,data.frame(x=newx,y=newy,type="New"))
                        
                        p<-qplot(x,y,data=newdata,main='Prediction of mpg using mtcars',xlab=input$xaxis,ylab='mpg',color=type)
                        
                        
                        p+geom_abline(intercept=fit$coefficients[1],slope=fit$coefficients[2],color='#0000ff22',size=1.1)
                       
                      
                })
                
                output$printout <- renderPrint({
                        x<-subset(mtcars,select = input$xaxis)[,1]
                        y<-mtcars$mpg
                        fit<-lm(y~x)
                        summary(fit)
                                        
                        
                })
                
                output$newprediciton <- renderText({
                        x<-subset(mtcars,select = input$xaxis)[,1]
                        y<-mtcars$mpg
                        newx<-as.numeric(input$predictor)
                        data<-data.frame(x=x,y=y,type="Original")
                        fit<-lm(y~x,data=data)
                        newy<-predict(fit,newdata=data.frame(x=newx))
                        paste0("Prediction: ",signif(newy,5),' ',' MPG')
                        
                        
                })
                
                output$instructions<-renderText({
                        h1('haha good job')
                        
                })
                
                
        }
)

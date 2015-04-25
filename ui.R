shinyUI(pageWithSidebar(
        headerPanel("Mtcars Prediction Tool"),
        sidebarPanel(
                selectInput('xaxis', 'Choose the Variable to Predict with',c("cyl",'disp','hp','drat','wt','qsec','vs','am',
                                                                             'gear','carb'),"hp"),                
                textInput('predictor', 'Choose a value to predict with',150),
                textOutput('newprediciton'),
               # htmlOutput('instructions')
               tags$br(),
               tags$h4("Instructions:"),
               tags$p("Choose a variable to predict mpg with from the drop down list.  Next, choose an input value to get a 
                      predicted y value (mpg).  Make sure your p-value and R squared are good too."),
               tags$br(),
               tags$h4("From help(mtcars):"),
               tags$ol( 
                        tags$li("mpg: Miles/(US) gallon"),
                        tags$li("cyl: Number of cylinders"),
                        tags$li("disp: Displacement (cu.in.)"),
                        tags$li("hp: Gross horsepower"),
                        tags$li("drat: Rear axle ratio"),
                        tags$li("wt: Weight (lb/1000)"),
                        tags$li("qsec: 1/4 mile time"),
                        tags$li("vs: V/S"),
                        tags$li("am: Transmission (0 = automatic, 1 = manual)"),
                        tags$li("gear: Number of forward gears"),
                        tags$li("carb: Number of carburetors")
               )
        ),
        mainPanel(
                plotOutput('xyplot'),
                verbatimTextOutput('printout')
        )
))

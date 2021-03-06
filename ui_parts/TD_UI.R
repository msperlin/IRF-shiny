TD_UI <- function(id, label = "TD")  {
  
  # Create a namespace function using the provided id
  ns <- NS(id)
  unique.tickers <- unique(df.TD$asset.code2)
  
  fluidPage(fluidRow(column(8,
                     includeHTML('html_text/html_TD.html'))),
            br(),
            sidebarLayout(fluid = TRUE,
                          
                          sidebarPanel(width = 2,
                                       fluidRow(h3('Opções Tesouro Direto'),
                                                selectInput(ns("select_td"), 
                                                            label = h5("Selecione Título"), 
                                                            choices = unique.tickers, 
                                                            selected = sample(unique.tickers,10))  )  ,
                                       fluidRow(sliderInput(ns("slider_first_invest_ammount"), 
                                                            label = h5("Valor Inicial investido"), 
                                                            min = 0, 
                                                            max = 150000, 
                                                            step = 500,
                                                            value = 10000, pre = 'R$') ),
                                       
                                       fluidRow(sliderInput(ns("slider_monthly_invest_ammount"), 
                                                            label = h5("Valor Mensal investido"), 
                                                            min = 0, 
                                                            max = 10000, 
                                                            step = 50,
                                                            value = 500, pre = 'R$') ),
                                       
                                       fluidRow(uiOutput(ns("data_range_ui")  ) ),
                                       br(),
                                       fluidRow(PB_single_UI(ns('TD_PB_1')) ) ),
                          
                          mainPanel(width = 6,
                                    tabsetPanel(type = 'tabs', 
                                                tabPanel('Gráfico',
                                                         plotOutput(ns('TD_plot_comp'), 
                                                                    #width = '100%', 
                                                                    height = '750px'),
                                                         br() #,
                                                         #uiOutput(ns('TD_text_graph')) ) ,
                                                ),
                                                tabPanel('Tabela',
                                                         tableOutput(ns('TD_tbl_td') ) )
                                    ) 
                          ) 
  )
  )
}
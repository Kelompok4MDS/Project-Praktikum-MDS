connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  
  DB <- dbConnect(
    driver,
    dbname="wazaxien", # User & Default database
    host="topsy.db.elephantsql.com", # Server
    # port=5433,
    user="wazaxien", # User & Default database
    password="iHObqXsxI_FyVnpRX0LdTGBs7dK-tnZI" # Password
  )
  # DB <- dbConnect(
  #   driver, dbname="Sepakbola",
  #   host="localhost",
  #   port=5432,
  #   user="postgres",
  #   password="apa"                                                                     
  #   )
  
}

function(input, output, session) {
  output$tblMatches <- renderDataTable({
    DB <- connectDB()
    #matches<-dbReadTable(DB, 'matches')
    q <- "SELECT * from matches;"
    # request kueri ke DBMS
    rs <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    
    rs
  })
  
  output$tblPlayers <- renderDataTable({
    DB <- connectDB()
    players<-dbReadTable(DB, 'players')
    dbDisconnect(DB)
    
    players
  })
  
  output$tblResults <- renderDataTable({
    DB <- connectDB()
    result<-dbReadTable(DB, 'results')
    dbDisconnect(DB)
    
    result
  })
  
  output$tblScores <- renderDataTable({
    DB <- connectDB()
    scores<-dbReadTable(DB, 'scores')
    dbDisconnect(DB)
    
    scores
  })
  
  output$tblStadiums <- renderDataTable({
    DB <- connectDB()
    stadiums<-dbReadTable(DB, 'stadiums')
    dbDisconnect(DB)
    
    stadiums
  })
  
  output$tblTeams <- renderDataTable({
    DB <- connectDB()
    teams<-dbReadTable(DB, 'teams')
    dbDisconnect(DB)
    
    teams
  })

  
  
}

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
    q <- "SELECT id_match, s.full_name AS stadium, date_time, attendance from stadiums as s, matches;"
    # request kueri ke DBMS
    rs <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    
    rs
  })
  
  output$tblPlayers <- renderDataTable({
    DB <- connectDB()
    #players<-dbReadTable(DB, 'players')
    r <- "SELECT kit_name AS Name, position, country from players;"
    play <- dbGetQuery(DB, r)
    dbDisconnect(DB)
    
    play
  })
  
  output$tblResults <- renderDataTable({
    DB <- connectDB()
    result<-dbReadTable(DB, 'results')
    dbDisconnect(DB)
    
    result
  })
  
  output$tblScores <- renderDataTable({
    DB <- connectDB()
    t<-"SELECT kit_name AS name, sum(assists) AS total, club
    from players
    natural join teams
    natural join scores
    group by kit_name, club
    having sum(assists) > 1
    order by sum(assists) desc, kit_name;"
    #dbReadTable(DB, 'scores')
    scores <- dbGetQuery(DB, t)
    dbDisconnect(DB)
    
    scores
  })
  
  output$tblStadiums <- renderDataTable({
    DB <- connectDB()
    u<-"SELECT full_name AS stadium, capacity from stadiums;"
    stadiums<-dbGetQuery(DB, u)
    dbDisconnect(DB)
    
    stadiums
  })
  
  output$tblTeams <- renderDataTable({
    DB <- connectDB()
    z<-"SELECT club, shorthand from teams;"
    teams<-dbGetQuery(DB, z)
    dbDisconnect(DB)
    
    teams
  })
  
  
  
}

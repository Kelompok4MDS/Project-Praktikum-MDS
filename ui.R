library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)
library(fontawesome)
library(shinythemes)

dashboardPage(
  title = "EPL",
  dashboardHeader(
    title = "EPL"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "About",
        tabName = "about",
        icon = icon("pen")),
      menuItem(
        "Daftar Pertandingan",
        tabName = "matches",
        icon = icon("futbol")
      ),
      menuItem(
        "Daftar Pemain",
        tabName = "players",
        icon = icon("people-group")
      ),
      menuItem(
        "Hasil Pertandingan",
        tabName = "results",
        icon = icon("list-ol")
      ),
      menuItem(
        "Goal & Assist",
        tabName = "scores",
        icon = icon("flag-checkered")
      ),
      menuItem(
        "Stadion",
        tabName = "stadiums",
        icon = icon("square")
      ),
      menuItem(
        "Tim Liga Inggris",
        tabName = "teams",
        icon = icon("network-wired")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "matches",
        h2(
          "Daftar Pertandingan "
        ),
        dataTableOutput(
          outputId = "tblMatches"
        )
      ),
      
      # --- About ---
      tabItem(
        tabName = 'about',
        h2('English Premier League', align = 'center'),
        tags$p(
          
        'Premier League atau yang biasa disingkat EPL (English Premier League)
        adalah kompetisi sepak bola paling terkenal di Inggris dan salah satu
        liga terbaik di dunia. Liga ini terdiri dari 20 klub yang berkompetisi
        untuk memperebutkan gelar juara dan posisi di papan atas klasemen.
        Premier League didirikan pada tahun 1992 dan sejak saat itu telah
        menjadi liga yang sangat populer di seluruh dunia. Setiap musim, 20 klub
        yang terbaik di Inggris bersaing dalam kompetisi ini. 
        Setiap klub bermain 38 pertandingan (hanya digunakan 24 pertandingan
        dalam studi kasus Manajemen Data Statistika) sepanjang musim, 
        dengan pertandingan kandang dan tandang melawan masing-masing klub lainnya.
        Sistem poin yang digunakan dalam Premier League adalah tiga poin untuk
        kemenangan, satu poin untuk hasil imbang, dan nol poin untuk kekalahan.
        Klub dengan jumlah poin tertinggi di akhir musim akan menjadi juara,
        sedangkan tiga klub terbawah akan terdegradasi ke divisi yang lebih rendah.',
        style = "text-align: justify; font-size = 25px"
        ),
        
        h2('Teams of the League', align = 'center'),
        fluidRow(
          shinydashboard::box(
            width = 12,
            background = 'black',
            valueBox(
              tags$p('Arsenal', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'https://logorevolution.id/2021/09/18/sejarah-logo-arsenal/',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Mumbai Indians (MI)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'MI.jpeg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Sunrises Hyderabad (SRH)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'SRH.png',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Delhi Capitals (DC)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'DCa.png',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Kolkata Knight Riders (KKR)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'KKR.jpeg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Kings XI  Punjab (KXIP)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'KXIP.jpeg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Royal Challengers Bangalore (RCB)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'RCB.jpg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Rajasthan Royals (RR)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'RR.jpeg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Rising Pune Supergiant (RPS)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'RPS.jpg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Gujarat Lions (GL)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'GL.jpg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Deccan Chargers (DC)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'DC.jpeg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Delhi Daredevils (DD)', style = 'font-size: 30%;text-align: center;'),
              div(img(
                src = 'DD.jpg',
                height = '120',
                width = '160'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            )
          )
        )
      ),
      tabItem(
        tabName = "players",
        h2(
          "Daftar Pemain"
        ),
        dataTableOutput(
          outputId = "tblPlayers"
        )
      ),
      tabItem(
        tabName = "results",
        h2(
          "Hasil Pertandingan"
        ),
        dataTableOutput(
          outputId = "tblResults"
        )
      ),
      tabItem(
        tabName = "scores",
        h2(
          "Goal & Assist"
        ),
        dataTableOutput(
          outputId = "tblScores"
        )
      ),
      tabItem(
        tabName = "stadiums",
        h2(
          "Stadion"
        ),
        dataTableOutput(
          outputId = "tblStadiums"
        )
      ),
      tabItem(
        tabName = "teams",
        h2(
          "Tim Liga Inggris"
        ),
        dataTableOutput(
          outputId = "tblTeams"
        )
      )
    )
  )
)
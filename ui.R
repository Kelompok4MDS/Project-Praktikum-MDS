library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)
library(fontawesome)
library(shinythemes)

dashboardPage(
  title = "Premiere League",
  dashboardHeader(
    title = "Premiere League"
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
              tags$p('Arsenal', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'arsenal.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Aston Villa', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'aston-villa.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Bournemouth', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'bournemouth.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Brentford', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'brentford.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Brighton', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'brighton.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Chelsea', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'chelsea.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Crystal Palace', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'crystal-palace.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Everton', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'everton.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Fulham', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'fulham.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Leeds United', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'leeds-united.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Leicester City', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'leicester-city.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Liverpool', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'liverpool.png',
                height = '90',
                width = '140'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Manchester City', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'manchester-City.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Manchester United', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'manchester-united.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Newcastle United', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'newcastle-united.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Nottingham Forest', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'nottingham-forest.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Southampton', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'southampton.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Tottenham Hotspur', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'tottenham-hotspur.png',
                height = '90',
                width = '120'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('West Ham United', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'west-ham-united.png',
                height = '90',
                width = '90'
              ), style = 'text-align: center;'),
              icon = NULL,
              width = 2,
              color = 'black'
            ),
            valueBox(
              tags$p('Wolverhampthon', style = 'font-size: 35%;text-align: center;'),
              div(img(
                src = 'wolverhampthon.png',
                height = '90',
                width = '120'
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
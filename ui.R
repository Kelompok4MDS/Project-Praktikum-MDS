library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)

dashboardPage(
  title = "English-Premiere-League",
  dashboardHeader(
    title = "English-Premiere-League"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Daftar Pertandingan",
        tabName = "matches",
        icon = icon("football-match")
      ),
      menuItem(
        "Daftar Pemain",
        tabName = "players",
        icon = icon("human-with-football")
      ),
      menuItem(
        "Hasil Pertandingan",
        tabName = "results",
        icon = icon("kick-off")
      ),
      menuItem(
        "Goal & Assist",
        tabName = "scores",
        icon = icon("football-score")
      ),
      menuItem(
        "Stadion",
        tabName = "stadiums",
        icon = icon("stadiums")
      ),
      menuItem(
        "Tim Liga Inggris",
        tabName = "teams",
        icon = icon("football-team")
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
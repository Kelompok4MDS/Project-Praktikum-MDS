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
        tabName = "result",
        icon = icon("kick-off")
      ),
      menuItem(
        "Goal & Assist",
        tabName = "scores",
        icon = icon("football-score")
      ),
      menuItem(
        "Stadium",
        tabName = "Stadion",
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
        tabName = "result",
        h2(
          "Hasil Pertandingan"
        ),
        dataTableOutput(
          outputId = "tblResult"
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
          outputId = "tblStadium"
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
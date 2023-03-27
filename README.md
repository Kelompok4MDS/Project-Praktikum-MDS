<div align="center">

## English Premiere League
![Logo Liga Inggris](https://img1.cgtrader.com/items/2993191/16987f1126/english-premier-league-logo-3d-model-obj-fbx-ma-stl-ztl.jpg)

# Project-Praktikum-MDS
  
### Collaborative Project by:
- `Arien Citha Utami` `(G1501221008)`
- `Siti Hasanah` `(G1501221014)`
- `Muhammad Hasan Itqoni` `(G1501221029)`
- `Elda Hervina Siagian` `(G1501222050)` 

[Tentang](#scroll-overview)
•
[Screenshot](#rice_scene-screenshot)
•
[Demo](#dvd-demo)
•
[Dokumentasi](#blue_book-documentation)

</div>

## :bookmark_tabs: Menu

- [Tentang](#scroll-overview)
- [Screenshot](#rice_scene-screenshot)
- [Demo](#dvd-demo)
- [Dokumentasi](#blue_book-documentation)
- [Requirements](#exclamation-requirements)
- [Skema Database](#floppy_disk-skema-database)
- [ERD](#rotating_light-erd)
- [Deskripsi Data](#heavy_check_mark-deskripsi-data)
- [Struktur Folder](#open_file_folder-stuktur-folder)
- [Tim Pengembang](#smiley_cat-tim-pengembang)

## :scroll: Tentang

*Premier League* atau yang biasa disingkat EPL (*English Premier League*) adalah kompetisi sepak bola paling terkenal di Inggris dan salah satu liga terbaik di dunia. Liga ini terdiri dari 20 klub yang berkompetisi untuk memperebutkan gelar juara dan posisi di papan atas klasemen. Premier League didirikan pada tahun 1992 dan sejak saat itu telah menjadi liga yang sangat populer di seluruh dunia. 

Setiap musim, 20 klub yang terbaik di Inggris bersaing dalam kompetisi ini. Setiap klub bermain 38 pertandingan (hanya digunakan 24 pertandingan dalam studi kasus Manajemen Data Statistika) sepanjang musim, dengan pertandingan kandang dan tandang melawan masing-masing klub lainnya. Sistem poin yang digunakan dalam *Premier League* adalah tiga poin untuk kemenangan, satu poin untuk hasil imbang, dan nol poin untuk kekalahan. Klub dengan jumlah poin tertinggi di akhir musim akan menjadi juara, sedangkan tiga klub terbawah akan terdegradasi ke divisi yang lebih rendah. 

*Premier League* menarik minat para penggemar sepak bola karena kualitas permainannya yang tinggi dan kehadiran beberapa pemain terbaik di dunia. Liga ini juga menawarkan pengalaman stadion yang unik dan atmosfer yang luar biasa. Selain itu, *Premier League* adalah liga yang sangat kaya, dengan beberapa klub memiliki anggaran yang sangat besar dan mampu membeli pemain-pemain bintang dengan harga yang sangat tinggi. Hal ini membuat liga semakin menarik dan kompetitif, karena setiap klub ingin menjadi yang terbaik dan meraih gelar juara.


## :rice_scene: Screenshot

### About
Tab "About" pada shinyapps digunakan untuk melihat gambaran umum dari data yang dimiliki. Tab ini juga menjelaskan nama-nama tim yang bertanding dalam English Premiere League.
![About]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/about.png)

## Daftar Pertandingan
Tab "Daftar Pertandingan" menjelaskan waktu pertandingan berikut tim dan jumlah penonton yang diperkirakan datang menuju stadion.
![Daftar Pertandingan]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/daftar_pertandingan.png)

## Daftar Pemain
Tab "Daftar Pemain" menjelaskan secara rinci informasi terkait pemain seperti nama, usia, posisi, dan asal negara.
![Daftar Pemain]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/daftar_pemain.png)

## Hasil Pertandingan
Tab "Hasil Pertandingan" menjelaskan score "home" dan "away" dari setiap laga. Ini juga bisa digunakan untuk menentukan klasemen dari 20 tim yang bertanding.
![Hasil Pertandingan]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/hasil_pertandingan.png)

## Goal & Assist
Tab "Goal & Assist" menjelaskan jumlah goal dan usaha untuk mencapai goal setiap pertandingan.
![Goal & Assist]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/goal&assist.png)

## Stadion
Tab "Stadion" berisi informasi terkait nama stadion dan kapasitas stadion.
![Stadion]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/stadion.png)

## Tim Liga Inggris
Tab "Tim Liga Inggris" berisi informasi dua puluh tim yang ikut bertanding berikut kode tim masing-masing.
![Tim Liga Inggris]( https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/tim_liga_inggris.png)

## :dvd: Demo

[https://cithautami.shinyapps.io/sepakbola/]

## :blue_book: Dokumentasi 

Dokumentasi penggunaan aplikasi database. Anda dapat juga membuat dokumentasi lives menggunakan readthedocs.org (opsional).

## :exclamation: Requirements

### Package

Package yang digunakan dalam tugas Manajemen Data Statistika ini diantaranya sebagai berikut:
- library(shiny)
- library(shinydashboard)
- library(RPostgreSQL)
- library(DBI)
- library(DT)
- library(fontawesome)
- library(shinythemes)

## :floppy_disk: Skema Database

<img width="242" alt="skema update" src="https://user-images.githubusercontent.com/111562803/223139863-0f7b7950-6586-49aa-9e6c-5c756d2a0375.png">


## ERD
![ERD Database Liga Inggris](https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/ERD%20Liga%20Inggris.png?raw=true "ERD DatabaseLiga Inggris")


### Deskripsi Tabel
#### 1. Tabel `teams`
#### Terdiri dari 20 tim liga inggris :
- `id_team` : smallint, primary key (not null)
- `id_stadium` : smallint, foreign key (referensi dari stadiums.id_stadium) (not null)
- `club` : varchar(25) (not null)
- `shorthand` varchar(3) (unique dan not null)

#### 2. Tabel `stadiums`
#### Terdiri dari 20 stadium :
- `id_stadium` : smallint, primary key (not null)
- `full_name` : varchar(32) (not null)
- `capacity` : integer (not null)

#### 3. Tabel `players`
#### Terdiri dari 220 pemain, dimana setiap tim terdiri dari 11 pemain :
- `id_player` : smallint, primary key (not null)
- `id_team` : smallint, foreign key (referensi dari teams.id_team) (not null)
- `kit_name` : varchar(15) (not null)
- `age` : smallint (not null)
- `position` : varchar(10) ("Goalkeeper", "Midfielder", "Forward") (not null)
- `country` : varchar(32) (not null)

#### 4. Tabel `matches`
#### Terdiri dari 24 pertandingan :
- `id_matches` : smallint, primary key (not null)
- `id_home` : smallint, foreign key (referensi dari teams.id_team) (not null)
- `id_away` : smallint, foreign key (referensi dari teams.id_team) (not null)
- `id_stadium` : smallint, foreign key (referensi dari stadiums.id_stadium) (not null)
- `date-time` : timestamp (not null)
- `attendance` : integer (not null)

#### 5. Tabel `results`
#### Terdiri dari 24 hasil pertandingan :
- `id_matches` : smallint, primary & foreign key (referensi dari matches.id_matches) (not null)
- `home` : smallint (not null)
- `away` : smallint (not null)

#### 6. Tabel `scores`
#### Terdiri dari 97 rekap skor berupa goal dan assist :
- `id_score` : smallint, primary key (not null)
- `id_match` : smallint, foreign key (referensi dari matches.id_matches) (not null)
- `id_team` : smallint, foreign key (referensi dari teams.id_team) (not null)
- `id_player` : smallint, foreign key (referensi dari players.id_player) (not null)
- `goals` : smallint (not null)
- `assist` : smallint (not null)

## :smiley_cat: Tim Pengembang

- Arien Citha Utami (G1501221008) : Front End Developer
- Siti Hasanah (G1501221014) : Back End Developer
- Muhammad Hasan Itqoni (G1501221029) : Database Manager
- Elda Hervina Siagian (G1501222050) : Technical Writer

# Project-Praktikum-MDS
### Collaborative Project By:
- `Arien Citha Utami` `(G1501221008)`
- `Siti Hasanah` `(G1501221014)`
- `Muhammad Hasan Itqoni` `(G1501221029)`
- `Elda Hervina Siagian` `(G1501222050)`

## English Premiere League
![Logo Liga Inggris](https://img1.cgtrader.com/items/2993191/16987f1126/english-premier-league-logo-3d-model-obj-fbx-ma-stl-ztl.jpg)

## {Deskripsi liga inggris (belum)}
### blablablabla

## ERD Database Liga Inggris
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


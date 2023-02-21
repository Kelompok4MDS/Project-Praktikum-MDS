# Project-Praktikum-MDS
## English Premiere League
![alt text](https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/[branch]/image.jpg?raw=true)
## {Deskripsi liga inggris (belum)}

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


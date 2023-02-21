# Project-Praktikum-MDS

# Pada tahap awal project ini, akan dibentuk terlebih dahulu skema ERDnya blablabla

## Tabel Stadiums
```sql
create table stadiums (
	id_stadium smallint primary key not null,
	full_name varchar(32) not null,
	capacity integer not null
);
```
## Tabel Teams
```sql
create table teams (
	id_team smallint primary key not null,
	id_stadium smallint references stadiums(id_stadium),
	club varchar(25) not null,
	shorthand varchar(3) unique not null check(length(shorthand) = 3)
);
```
## Tabel Players
```sql
create table players (
	id_player smallint primary key not null,
	id_team smallint not null references teams(id_team),
	first_name varchar(15),
	last_name varchar(15) not null,
	kit smallint not null check(kit between 1 and 99),
	position varchar(10) not null check(
		position = 'Goalkeeper' OR position = 'Defender' OR
		position = 'Midfielder' OR position = 'Forward'),
	country varchar(32) not null
);
```
## Tabel Matches
```sql
create table matches (
	id_match smallint primary key not null,
	id_home smallint not null references teams(id_team),
	id_away smallint not null references teams(id_team),
	id_stadium smallint not null references stadiums(id_stadium),
	date_time timestamp not null,
	attendance integer not null
);
```
## Tabel Results
```sql
create table results (
	id_match smallint primary key not null references matches(id_match),
	home smallint not null check(home >= 0),
	away smallint not null check(away >= 0)
);
```
## Tabel Scores
```sql
create table scores (
	id_score smallint primary key not null,
	id_match smallint not null references matches(id_match),
	id_team smallint not null references teams(id_team),
	id_player smallint not null references players(id_player),
	goals smallint not null check(goals >= 0),
	assists smallint not null check(assists >= 0)
);
```

# Selanjutnya, menginput data ke dalam database dengan altertable....

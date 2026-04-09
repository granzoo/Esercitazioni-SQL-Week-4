-- creo il db

create database ECM;

-- creo le tabelle che mi serviranno

create table Store(
	ID int,
    nome varchar(50),
    data_apertura date
    );

create table Region(
	ID int,
    città varchar(50),
    regione varchar(30),
    area_geografica varchar(50)
    );

-- popolo le tabelle con pochi record esemplificativi

insert into store
	values 	(1, "Stella House", "2025-11-01"),
			(2, "Cielo Lab", "2026-03-15"),
            (3, "Radice House", "2020-01-01"),
            (4, "Fuoco Place", "2024-03-21");

insert into region
	values	(1, "Paese", "Veneto", "Nord-Italia"),
			(2, "Oristano", "Sardegna", "Sud-Italia"),
			(3, "Morgex", "Valle d'Aosta", "Nord-Italia"),
			(4, "Aprilia", "Lazio", "Centro-Italia");

-- eseguo operazioni di aggiornamento, modifica ed eliminazione record

update store
set nome = "Onda Depot"
where ID = 2;

start transaction;

update region
set area_geografica = "Isole"
where regione = "Sardegna";

update region
set città = "Vercelli", regione = "Piemonte"
where id = 3;

commit;

insert into region
	value 	(5, "Cosenza", "Calabria", "Sud-Italia");

-- -- -- -- --

start transaction;

delete from region
where id = 2;

commit;

update region
set id = 2
where città = "Cosenza";

alter table store
add constraint primary key (id);

alter table region
add constraint foreign key (id) references store(id);

select 
	s.*,
	r.città,
    r.regione,
    r.area_geografica
from region r
inner join store s on r.id = s.id
order by r.id asc;
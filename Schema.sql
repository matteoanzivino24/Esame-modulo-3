

create table Utenti(
Id SERIAL primary key,
Nome VARCHAR(255),
Cognome VARCHAR(255),
Email VARCHAR(255) not null unique
);

create table Liste(
Id SERIAL primary key,
Nome VARCHAR(255)
);

create table Attivita(
Id SERIAL primary key,
UtenteId INT,
ListeId INT,
Nome VARCHAR(255),
foreign key (UtenteId) references Utenti(Id),
foreign key (ListeId) references Liste(Id)
);


Indici :
create index idx_utenteId on Attivita(UtenteId);

create index idx_listeId on Attivita(ListeId);

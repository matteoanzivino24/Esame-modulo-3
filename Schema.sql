Questo file deve contenere:
● Le query SQL CREATE TABLE per tutte le tabelle necessarie a supportare il sistema.
● La definizione di Primary Key, Foreign Key, tipi di dato appropriati e vincoli (es.
NOT NULL).
● Almeno due indici per ottimizzare le query che ritieni più frequenti, con un
commento che ne spieghi lo scopo.

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
# a. Analisi del Dominio (DDD)


### Task

Il Task è l'attività che l'utente deve fare e vuole registrare

### Stato Task

Per stato task si intende il progresso dell'attività se è "da fare", "in corso" , "completata".

### Conflitto

Un conflitto è una situazione in cui si creano due task identici

### Utente

Un Utente è colui che vuole gestire le proprie attività attraverso "TaskFlow"

### Lista

Uno slot orario rappresenta l'unità di tempo per cui si può effettuare una prenotazione di una sala riunioni. Lo slot orario corrisponde ad un'ora di tempo.





### Liste

GET /api/Liste?pagina={num}&elementi={num}&sort={attr},{asc|des}&filter={attr}&filterQ={value}

- ritorna l'elenco di Liste. Supporta la paginazione, indicando la pagina richiesta e la dimensione di una pagina, il sorting, specificando l'attributo per cui sortare e la direzione, la ricerca, specificando per quale attributo cercare e il valore da cercare

- body della richiesta: null
- body della risposta:

```
{
    "Liste": [
{
"id" : int,
"nome" : string
          
}
],
  "pagina" : int,
  "elementi" : int
}
```

status code : 
200 OK
204 No Content : nel caso in cui il sistema abbia ricevuto la richiesta ma non abbia nulla da rendere 

GET /api/Liste/{id}

ritorna i dati di una Lista con id {id}

- body della richiesta: null

- body della risposta:

```
{
    "id" : int,
    "nome" : string
    
}
```
status code : 
200 OK
204 No Content : nel caso in cui il sistema abbia ricevuto la richiesta ma non abbia nulla da rendere 

POST /api/Liste

- crea una nuova Lista con i dati passati (se non ci sono conflitti). La Lista viene creata a nome dell'utente che fa la richiesta.

- body della richiesta:
```
{
    "ListaId" : int,
    "nome" : string
}
```
- body della risposta: 
```
{
    "id" : int,
    "utenteId" : int,
    "nome" : string,
    "Lista" : {
        "id" : int,
        "nome" : string
    }
}
```
status code : 201 Created: la richiesta è stata soddisfatta e ha portato alla creazione di una nuova risorsa


PUT /api/Liste
- modifica una Lista sovrascrivendola con una nuova Lista. Un utente può solo modificare una Lista creata da lui.
- body della richiesta:

```
{
    "id" : int,
    "ListaId" : int,
    "nome" : string
}
```
- body della risposta:
```
{
  "id" : int,
  "utenteId" : int,
  "nome" : string
  "Liste":
  {
      "id" : int,
      "nome" : string
  }    
}
```
status code : 
200 OK

PATCH /api/Liste
- modifica una lista cambiando uno o più campi. Un utente può solo modificare una lista creata da lui.
- body della richiesta:
```
{
    "id" : int,
    "ListeId" : int,
    "nome" : string
}
```
- body della risposta:
```
{
  "id" : int,
  "utenteId" : int,
  "nome" : string
  "Liste":
  {
      "id" : int,
      "nome" : string
  }    
}
```
status code : 
200 OK

DELETE /api/Liste/{id}

- cancella una lista
- body della richiesta: null

- body della risposta: null

status code: 
204 No Content: la richiesta è adnata a buon fine, ma il server non restituisce niente

### Attività

GET /api/Attivita?pagina={num}&elementi={num}&sort={attr},{asc|des}&filter={attr}&filterQ={value}

- ritorna l'elenco di Attivita. Supporta la paginazione, indicando la pagina richiesta e la dimensione di una pagina, il sorting, specificando l'attributo per cui sortare e la direzione, la ricerca, specificando per quale attributo cercare e il valore da cercare

- body della richiesta: null
- body della risposta:

```
{
    "Attivita": [
{
"id" : int,
"nome" : string
          
}
],
  "pagina" : int,
  "elementi" : int
}
```

status code : 
200 OK
204 No Content : nel caso in cui il sistema abbia ricevuto la richiesta ma non abbia nulla da rendere 

GET /api/Attivita/{id}

ritorna i dati di un'Attivita con id {id}

- body della richiesta: null

- body della risposta:

```
{
    "id" : int,
    "nome" : string
    
}
```
status code :
200 OK

POST /api/Attivita

- crea
 una nuova Attivita con i dati passati (se non ci sono conflitti). L'Attivita viene creata a nome dell'utente che fa la richiesta.

- body della richiesta:
```
{
    "AttivitaId" : int,
    "nome" : string
}
```
- body della risposta: 
```
{
    "id" : int,
    "utenteId" : int,
    "nome" : string,
    "Attivita" : {
        "id" : int,
        "nome" : string
    }
}
```
status code:
201 Created: la richiesta ha portato alla creazione di una nuova risorsa

PUT /api/Attivita
- modifica un'Attivita sovrascrivendola con una nuova Attivita. Un utente può solo modificare un'Attivita creata da lui.

- body della richiesta:

```
{
    "id" : int,
    "AttivitaId" : int,
    "nome" : string
}
```
- body della risposta:
```
{
  "id" : int,
  "utenteId" : int,
  "nome" : string
  "Attivita":
  {
      "id" : int,
      "nome" : string
  }    
}
```
status code: 
200 OK
404 Not Found: la risorsa non è stata trovata 

PATCH /api/Attivita
- modifica una attivita cambiando uno o più campi. Un utente può solo modificare un'attivita creata da lui.
- body della richiesta:
```
{
    "id" : int,
    "AttivitaId" : int,
    "nome" : string
}
```
- body della risposta:
```
{
  "id" : int,
  "utenteId" : int,
  "nome" : string
  "Attivita":
  {
      "id" : int,
      "nome" : string
  }    
}
```
status code: 
200 OK
404 Not Found: la risorsa non è stata trovata

DELETE /api/Attivita/{id}

- cancella un'Attivita
- body della richiesta: null

- body della risposta: null

204 No Content: la richiesta è stata completata ma il server non restituisce nulla 


# c. Principi di progettazione


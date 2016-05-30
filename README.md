# ConectarInfoBackend

Para iniciar esta aplicación:

  * Instalá las dependencias con `mix deps.get`
  * Crea una base de datos y ejecutá las migraciones con `mix ecto.create && mix ecto.migrate`
  * Iniciá phoenix con `mix phoenix.server`

En la URL [`localhost:4000`](http://localhost:4000) está la pantalla de presentación. El resto de las rutas está bajo el prefijo `api`, por ejemplo `api/events`.

Usando el comando `mix phoenix.routes` vas a poder ver el resto de las
rutas:

```
➤ mix phoenix.routes
 page_path  GET     /                ConectarInfoBackend.PageController :index
event_path  GET     /api/events      ConectarInfoBackend.EventController :index
event_path  GET     /api/events/:id  ConectarInfoBackend.EventController :show
event_path  POST    /api/events      ConectarInfoBackend.EventController :create
event_path  PATCH   /api/events/:id  ConectarInfoBackend.EventController :update
            PUT     /api/events/:id  ConectarInfoBackend.EventController :update
event_path  DELETE  /api/events/:id  ConectarInfoBackend.EventController :delete
```

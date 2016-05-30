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


# Ejemplos de post


La aplicación representa los eventos usando estos campos:

```
schema "events" do
  field :ip, :string
  field :os, :string
  field :os_version, :string
  field :last_update, Ecto.Date
  field :lat, :float
  field :lon, :float
  field :date, Ecto.Date

  timestamps
end
```

Ahora, para cargar un registro dentro del evento no hace falta especificar
todos estos valores, simplemente alcanza con usar los relativos al cliente. Este
es un ejemplo de llamada válida:


```
curl -H "Content-Type: application/json" -X POST -d '{"event": {"ip":"??", "os": "huayra", "os_version": "3.2", "lon": 1233.3, "lat": 333.3, "last_update": "2012-04-23", "date": "2010-10-10"}}' http://localhost:4000/api/events
```

- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Inicio
- active = context.request.path == "/movie_searches" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/movie_searches" Buscar Pelicula
- active = context.request.path == "/movies" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/movies" Historial de Busquedas

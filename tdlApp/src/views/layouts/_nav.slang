- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Inicio
- active = context.request.path == "/movies" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/movies" Buscar Pelicula
- if (current_user = context.current_user)
  - active = context.request.path == "/movies/favorites" ? "active" : ""
  li.nav-item class=active
    a class="nav-link" href="/movies/favorites" Favoritos

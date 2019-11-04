- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/movies" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/movies" Movies
- if (current_user = context.current_user)
  - active = context.request.path == "/movies/favorites" ? "active" : ""
  li.nav-item class=active
    a class="nav-link" href="/movies/favorites" Favorites

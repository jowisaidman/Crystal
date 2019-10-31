h1 Restrarse

- if user
  - if user.errors
    ul.errors
    - user.errors.each do |error|
      li = error.to_s
- if @validation_errors
  - @validation_errors.not_nil!.each do |error|
      li = error.message

form action="/registration" method="post"
  == csrf_tag
  .form-group
    input.form-control type="email" name="email" placeholder="Email"
  .form-group
    input.form-control type="password" name="password" placeholder="Contraseña"
  button.btn.btn-success.btn-sm type="submit"
    | Registrar
<hr/>
== link_to("Ya tenes una cuenta?", "/signin")

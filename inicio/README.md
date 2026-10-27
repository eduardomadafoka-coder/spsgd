# Proyecto

- a9f3/        -> PDFs (nombres tipo 7f3a91c2.pdf)
- index.html   -> visor real: index.html?doc=NOMBRE.pdf
- ver.html     -> página "amigable" que redirige a index.html?doc=...
                  edita la línea "7f3a91c2.pdf" por el PDF que quieras mostrar

Comparte siempre el link de ver.html (o el nombre que le pongas), no el de index.html.

IMPORTANTE: la redirección es del lado del cliente (meta-refresh/JS).
La barra de direcciones SÍ cambiará a la URL final tras cargar; eso es
normal en cualquier redirect. Si necesitas que la URL visible NUNCA
cambie, la única forma real es un dominio propio apuntando a GitHub
Pages (CNAME) o un proxy/servidor, no algo que se pueda hacer solo
con HTML estático.

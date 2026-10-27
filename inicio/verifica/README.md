# Verificador de Documentos Firmados Digitalmente

Página estática que replica el formulario de verificación.

## Archivos
- `inicio.html` / `inicio.do` : Página principal del formulario.
- `banner.jpg` : Imagen horizontal de ejemplo (reemplázala con tu propia imagen).

## Cómo usar
1. Sube esta carpeta `veridicar` a tu repositorio de GitHub.
2. Activa GitHub Pages (Settings → Pages → Deploy from branch).
3. Accede a: `https://tu-usuario.github.io/tu-repo/veridicar/inicio.html`

## Personalización
- **Imagen superior**: Reemplaza `banner.jpg` con tu imagen horizontal (el complemento / banner que tienes guardado).
- **Tipos de Documento**: Edita las `<option>` dentro del `<select id="tipoDocumento">` en el HTML.
- **Link de redirección**: En el `<script>`, cambia la variable:
  ```js
  const REDIRECT_URL = "https://ejemplo.com/documento-verificado";
  ```
  por el enlace que tú propongas.
- **Valores de prueba actuales**:
  - Número de Documento: `000147`
  - Código de Verificación: `PMGVAJ7`
  - Captcha: Cualquiera de las 12 variantes (se genera aleatoriamente). Haz clic en ↻ para cambiar.

## Captcha
Funciona 100% en el navegador (compatible con GitHub Pages). Tiene más de 10 variantes y botón de refresco.

## Notas
- Toda la validación es del lado del cliente (JavaScript). Para uso real necesitarías un backend.
- El archivo `inicio.do` es una copia de `inicio.html` por si lo necesitas con esa extensión. En GitHub Pages usa el `.html`.

Versión 1.0

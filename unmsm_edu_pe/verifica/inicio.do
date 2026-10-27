<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verificación de Documentos Firmados Digitalmente</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .banner {
            width: 100%;
            margin: 0 0 15px 0;
            text-align: center;
        }
        .banner img {
            width: 100%;
            height: auto;
            max-height: 160px;
            object-fit: cover;
            display: block;
        }
        .container {
            max-width: 850px;
            margin: 0 auto;
            background: white;
            padding: 15px 30px 40px 30px;
            min-height: 100vh;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
        }
        h1 {
            color: #003366;
            text-align: center;
            font-size: 28px;
            margin-top: 10px;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }
        fieldset {
            border: 1px solid #ccc;
            padding: 20px;
            margin-top: 10px;
        }
        legend {
            color: #0066cc;
            font-weight: bold;
            padding: 0 10px;
        }
        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            justify-content: flex-end;
        }
        .form-row label {
            width: 220px;
            text-align: right;
            margin-right: 15px;
            font-weight: bold;
        }
        .form-row input, .form-row select {
            width: 280px;
            padding: 8px;
            border: 1px solid #999;
            border-radius: 3px;
            font-size: 14px;
        }
        .required {
            color: red;
            margin-left: 5px;
        }
        .captcha-container {
            display: flex;
            align-items: center;
        }
        #captchaCanvas {
            border: 1px solid #999;
            margin-left: 10px;
            background: #f0f8ff;
            cursor: pointer;
            border-radius: 3px;
        }
        #refreshCaptcha {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            margin-left: 5px;
            color: #0066cc;
        }
        .btn-container {
            text-align: center;
            margin-top: 25px;
        }
        button#verDocumento {
            background: #f0f0f0;
            border: 1px solid #999;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        button#verDocumento:hover {
            background: #e0e0e0;
        }
        .note {
            text-align: right;
            color: red;
            font-size: 12px;
            margin-top: 10px;
        }
        .version {
            text-align: center;
            margin-top: 30px;
            color: #666;
            font-size: 14px;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
            display: none;
        }
        .success {
            color: green;
            text-align: center;
            margin-top: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- BANNER HORIZONTAL - Reemplaza banner.jpg con tu imagen horizontal -->
        <div class="banner">
            <img src="banner.jpg" alt="Banner Horizontal" onerror="this.style.display='none'; this.parentElement.innerHTML='<div style=\'padding:30px; background:#003366; color:white; text-align:center;\'>Coloca tu imagen horizontal (banner.jpg)</div>'">
        </div>

        <h1>VERIFICACIÓN DE DOCUMENTOS FIRMADOS DIGITALMENTE</h1>

        <fieldset>
            <legend>Verificación de Documentos</legend>

            <form id="verificacionForm">
                <div class="form-row">
                    <label for="tipoDocumento">Tipo de Documento :</label>
                    <select id="tipoDocumento" required>
                        <option value="">[SELECCIONAR]</option>
                        <!-- Agrega aquí los nombres de los documentos que se plasmarán -->
                        <option value="acta">ACTA</option>
                        <option value="acta">ACTA SUSTENTACIÓN DE TESIS</option>
                        <option value="resolucion">CARTA</option>
                        <option value="resolucion">CARTA DE PRESENTACIÓN</option>
                        <option value="certificado">CONSTANCIA DE ESTUDIOS</option>
                        <option value="certificado">CONSTANCIA DE EGRESADO</option>
                        <option value="certificado">CERTIFICADO</option>
                        <option value="resolucion">CERTIFICADO ACADEMICO</option>
                        <option value="resolucion">CERTIFICADO DE ESTUDIOS</option>
                        <option value="resolucion">CERTIFICADO DE TRABAJO</option>
                        <option value="resolucion">CONFORMIDAD DE LABORES</option>
                        <option value="resolucion">CONFORMIDAD DE INFORMES</option>
                        <option value="titulo">Título</option>
                        <option value="otro">Otro Documento</option>
                    </select>
                    <span class="required">(*)</span>
                </div>

                <div class="form-row">
                    <label for="numeroDocumento">Número de Documento :</label>
                    <input type="text" id="numeroDocumento" required maxlength="20" placeholder="">
                    <span class="required">(*)</span>
                </div>

                <div class="form-row">
                    <label for="codigoVerificacion">Código de Verificación :</label>
                    <input type="text" id="codigoVerificacion" required maxlength="20" placeholder="">
                    <span class="required">(*)</span>
                </div>

                <div class="form-row">
                    <label for="captchaInput">Ingrese texto :</label>
                    <div class="captcha-container">
                        <input type="text" id="captchaInput" required maxlength="10" style="width:140px;">
                        <span class="required">(*)</span>
                        <canvas id="captchaCanvas" width="120" height="40"></canvas>
                        <button type="button" id="refreshCaptcha" title="Refrescar">↻</button>
                    </div>
                </div>

                <div class="btn-container">
                    <button type="submit" id="verDocumento">📄 Ver Documento</button>
                </div>

                <div class="error" id="errorMsg"></div>
                <div class="success" id="successMsg">Verificación correcta. Redirigiendo...</div>
            </form>

            <div class="note">(*) Campo Obligatorio</div>
        </fieldset>

        <div class="version">Versión 1.0</div>
    </div>

    <script>
        // ===== CONFIGURACIÓN =====
        // Cambia esta URL por el enlace que tú propongas para la redirección
        const REDIRECT_URL = "https://ejemplo.com/documento-verificado"; // <-- EDITA ESTO CON TU LINK

        // Valores de prueba (como solicitaste)
        const VALID_NUMERO = "000147";
        const VALID_CODIGO = "PMGVAJ7";

        // 10+ variantes de captcha
        const CAPTCHA_VARIANTS = [
            "SXH6E", "AB3K9", "PM7VA", "QR5T2", "LK8M4",
            "ZX9W1", "CV2B7", "NM4P6", "HJ5R8", "TY3U0",
            "FG6H2", "WS1D4"
        ];

        let currentCaptcha = "";

        function generateCaptcha() {
            const randomIndex = Math.floor(Math.random() * CAPTCHA_VARIANTS.length);
            currentCaptcha = CAPTCHA_VARIANTS[randomIndex];
            
            const canvas = document.getElementById("captchaCanvas");
            const ctx = canvas.getContext("2d");
            
            // Fondo
            ctx.fillStyle = "#e8f4fc";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            // Líneas de ruido
            for (let i = 0; i < 5; i++) {
                ctx.strokeStyle = `rgba(${Math.random()*100}, ${Math.random()*100}, ${Math.random()*200}, 0.5)`;
                ctx.beginPath();
                ctx.moveTo(Math.random()*canvas.width, Math.random()*canvas.height);
                ctx.lineTo(Math.random()*canvas.width, Math.random()*canvas.height);
                ctx.stroke();
            }
            
            // Texto
            ctx.font = "bold 22px 'Courier New', monospace";
            ctx.fillStyle = "#003366";
            ctx.textAlign = "center";
            ctx.textBaseline = "middle";
            
            // Pequeña rotación por carácter para distorsión
            const letters = currentCaptcha.split("");
            const spacing = canvas.width / (letters.length + 1);
            letters.forEach((letter, i) => {
                ctx.save();
                ctx.translate(spacing * (i + 1), canvas.height / 2);
                ctx.rotate((Math.random() - 0.5) * 0.4);
                ctx.fillText(letter, 0, 0);
                ctx.restore();
            });
            
            document.getElementById("captchaInput").value = "";
        }

        // Inicializar captcha al cargar
        generateCaptcha();

        document.getElementById("refreshCaptcha").addEventListener("click", generateCaptcha);
        document.getElementById("captchaCanvas").addEventListener("click", generateCaptcha);

        document.getElementById("verificacionForm").addEventListener("submit", function(e) {
            e.preventDefault();

            const tipo = document.getElementById("tipoDocumento").value;
            const numero = document.getElementById("numeroDocumento").value.trim();
            const codigo = document.getElementById("codigoVerificacion").value.trim().toUpperCase();
            const captchaIngresado = document.getElementById("captchaInput").value.trim().toUpperCase();

            const errorMsg = document.getElementById("errorMsg");
            const successMsg = document.getElementById("successMsg");
            errorMsg.style.display = "none";
            successMsg.style.display = "none";

            // Validaciones
            if (!tipo) {
                showError("Debe seleccionar un Tipo de Documento.");
                return;
            }
            if (!numero) {
                showError("Debe ingresar el Número de Documento.");
                return;
            }
            if (!codigo) {
                showError("Debe ingresar el Código de Verificación.");
                return;
            }
            if (!captchaIngresado) {
                showError("Debe ingresar el texto del captcha.");
                return;
            }
            if (captchaIngresado !== currentCaptcha.toUpperCase()) {
                showError("El texto del captcha es incorrecto. Intente nuevamente.");
                generateCaptcha();
                return;
            }

            // Validación específica de prueba
            if (numero !== VALID_NUMERO || codigo !== VALID_CODIGO) {
                showError("Número de Documento o Código de Verificación incorrectos.");
                generateCaptcha();
                return;
            }

            // Éxito
            successMsg.style.display = "block";
            setTimeout(() => {
                window.location.href = REDIRECT_URL;
            }, 1500);
        });

        function showError(msg) {
            const errorMsg = document.getElementById("errorMsg");
            errorMsg.textContent = msg;
            errorMsg.style.display = "block";
        }
    </script>
</body>
</html>

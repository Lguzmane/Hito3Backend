____________________________________
------------------------------------
DOCUMENTACIÓN DEL BACKEND - SBEAUTY
____________________________________
------------------------------------
DESCRIPCIÓN DEL PROYECTO
Sistema backend para SBeauty, plataforma de servicios de belleza. Maneja:

Registro y autenticación de usuarios

Gestión de servicios profesionales

Sistema de reservas de citas

Reseñas y calificaciones

------------------------------------
TECNOLOGÍAS PRINCIPALES

Node.js (entorno de ejecución)

Express (framework API REST)

PostgreSQL (base de datos)

JWT + bcrypt (autenticación segura)

Supertest + Jest (pruebas automatizadas)

------------------------------------
ESTRUCTURA DE ARCHIVOS
sbeauty-backend/
├── .env
├── package.json
├── src/
│   ├── config/          
│   ├── controllers/    
│   ├── middlewares/     
│   ├── routes/          
│   ├── tests/           
│   └── server.js 

------------------------------------
VARIABLES DE ENTORNO NECESARIAS
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=sbeautydb
DB_USER=sbeauty_user
DB_PASSWORD=contraseña_db
JWT_SECRET=clave_secreta

------------------------------------
ENDPOINTS PRINCIPALES

AUTENTICACIÓN
POST /api/auth/register - Registro usuarios
POST /api/auth/login - Login usuarios
GET /api/auth/protegida - Ruta protegida prueba

SERVICIOS
POST /api/servicios - Crear servicio (profesionales)
GET /api/servicios - Listar servicios
GET /api/servicios/:id - Detalle servicio

RESERVAS
POST /api/reservas - Nueva reserva
GET /api/reservas/cliente - Reservas cliente
GET /api/reservas/profesional - Agenda profesional
PUT /api/reservas/:id - Actualizar reserva

RESEÑAS
POST /api/resenas - Crear reseña
GET /api/resenas/:profesionalId - Reseñas por profesional

------------------------------------
COMANDOS BÁSICOS

Instalar dependencias:
npm install

Crear base de datos:
createdb sbeautydb

Iniciar servidor desarrollo:
npm run dev

Ejecutar pruebas:
npm test

------------------------------------
ESTADO ACTUAL

Backend completamente funcional

Sistema de autenticación seguro

Gestión completa de servicios y reservas

Pruebas automatizadas implementadas

Listo para integración con frontend React

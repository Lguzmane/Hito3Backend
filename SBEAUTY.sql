-- ===========================================
-- CONFIGURACIÓN INICIAL DE POSTGRESQL
-- ===========================================

-- 1. Crear usuario y asignar permisos (ejecutar primero)
CREATE USER sbeauty_user WITH PASSWORD 'lopilato';
GRANT ALL PRIVILEGES ON DATABASE sbeautydb TO sbeauty_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO sbeauty_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO sbeauty_user;

-- ===========================================
-- ESQUEMA PRINCIPAL
-- ===========================================

-- TABLA USUARIOS
CREATE TABLE IF NOT EXISTS usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido_paterno VARCHAR(100) NOT NULL,
  apellido_materno VARCHAR(100),
  rut VARCHAR(12) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  telefono VARCHAR(20),
  region VARCHAR(50),
  comuna VARCHAR(50),
  rol VARCHAR(20) CHECK (rol IN ('Cliente', 'Profesional')),
  categoria VARCHAR(50),
  experiencia TEXT,
  certificaciones TEXT[],
  rating_promedio NUMERIC(3, 2) DEFAULT 0.0,
  fotos_perfil TEXT[],
  created_at TIMESTAMP DEFAULT NOW(),
  direccion TEXT,
  sitio_web TEXT,
  locacion TEXT,
  condiciones TEXT
);

-- TABLA SERVICIOS
CREATE TABLE IF NOT EXISTS servicios (
  id SERIAL PRIMARY KEY,
  profesional_id INTEGER REFERENCES usuarios(id),
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio NUMERIC(10, 2) NOT NULL,
  duracion INTEGER NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  tipo_atencion VARCHAR(20) CHECK (tipo_atencion IN ('Presencial', 'Online', 'Domicilio')),
  comuna VARCHAR(50) NOT NULL,
  imagenes TEXT[],
  palabras_clave TEXT[],
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- TABLA RESERVAS
CREATE TABLE IF NOT EXISTS reservas (
  id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES usuarios(id),
  servicio_id INTEGER REFERENCES servicios(id),
  profesional_id INTEGER REFERENCES usuarios(id),
  fecha TIMESTAMP NOT NULL,
  duracion INTEGER NOT NULL,
  estado VARCHAR(20) CHECK (estado IN ('pendiente', 'confirmada', 'cancelada', 'completada')),
  monto NUMERIC(10, 2) NOT NULL,
  metodo_pago VARCHAR(20) CHECK (metodo_pago IN ('WebPay', 'Tarjeta', 'Transferencia')),
  estado_pago VARCHAR(20) CHECK (estado_pago IN ('pendiente', 'completado', 'reembolsado')),
  transaccion_id VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
);

-- TABLA RESEÑAS (usamos 'resenas' sin ñ para compatibilidad)
CREATE TABLE IF NOT EXISTS resenas (
  id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES usuarios(id),
  profesional_id INTEGER REFERENCES usuarios(id),
  servicio_id INTEGER REFERENCES servicios(id),
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comentario TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- TABLA FAVORITOS
CREATE TABLE IF NOT EXISTS favoritos (
  id SERIAL PRIMARY KEY,
  cliente_id INTEGER REFERENCES usuarios(id),
  profesional_id INTEGER REFERENCES usuarios(id),
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE (cliente_id, profesional_id)
);

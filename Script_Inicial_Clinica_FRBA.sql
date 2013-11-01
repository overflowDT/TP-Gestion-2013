USE [GD2C2013]

GO
	CREATE SCHEMA [KEY_OVER_9000] AUTHORIZATION [gd]
GO


/****************************************************** CREACIÓN DE TABLAS ******************************************************/

/* Tabla ROL */
CREATE TABLE [KEY_OVER_9000].ROL (
	[Id_Rol] numeric(5,0) NOT NULL,
	[Nombre_Rol] [nvarchar](255) NOT NULL,
	[Baja] char NULL,
	PRIMARY KEY(
		[Id_Rol]
	)
)

/* Tabla FUNCIONALIDAD */
CREATE TABLE [KEY_OVER_9000].FUNCIONALIDAD (
	[Id_Funcionalidad] numeric(5,0) NOT NULL,
	[Nombre_Funcionalidad] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Funcionalidad]
	)
)

/* Tabla FUNCIONALIDAD_ROL */
CREATE TABLE [KEY_OVER_9000].ROL_FUNCIONALIDAD (
	[Id_Rol] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.ROL(Id_Rol),
	[id_Funcionalidad] numeric(5,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.FUNCIONALIDAD(Id_Funcionalidad),
	PRIMARY KEY(
		[Id_Rol],
		[Id_Funcionalidad]
	)
)

/* Tabla USUARIO */
CREATE TABLE [KEY_OVER_9000].USUARIO (
	[Id_Usuario] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	PRIMARY KEY(
		[Id_Usuario]
	)
)

/* Tabla USUARIO_ROL */
CREATE TABLE [KEY_OVER_9000].USUARIO_ROL (
	[Id_Usuario] numeric(18,0) FOREIGN KEY REFERENCES KEY_OVER_9000.USUARIO(Id_Usuario),
	[Id_Rol] numeric(5,0) FOREIGN KEY REFERENCES KEY_OVER_9000.ROL(Id_Rol)
	PRIMARY KEY(
		[Id_Usuario],
		[Id_Rol]
	)
)


/* Tabla ESPECIALIDAD */ 
CREATE TABLE [KEY_OVER_9000].ESPECIALIDAD (
	[Id_Especialidad] numeric(18,0) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Id_Tipo_Especialidad] numeric(18,0) NOT NULL,
	[Tipo_Especialidad] [nvarchar](255) NOT NULL
	PRIMARY KEY(
		[Id_Especialidad]
	)
)


/* Tabla PROFESIONAL */ 
CREATE TABLE [KEY_OVER_9000].PROFESIONAL (
	[Id_Profesional] numeric(18,0) NOT NULL IDENTITY(1,1),
	[Nombre] [nvarchar](255) NOT NULL,
	[Apellido] [nvarchar](255) NOT NULL,
	[DNI] numeric(18,0) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Telefono] numeric(18,0) NOT NULL,
	[Mail] [nvarchar](255) NOT NULL,
	[Fecha_Nacimiento] datetime,
	[Sexo] char NULL,
	[Matricula] numeric(18,0),
	[Baja] char NULL,
	--[Id_Usuario] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.USUARIO (Id_Usuario),
	PRIMARY KEY(
		[Id_Profesional]
	)
)

/* Tabla AGENDA_PROFESIONAL */ 
CREATE TABLE [KEY_OVER_9000].AGENDA_PROFESIONAL (
	[Id_Agenda] numeric(18,0) NOT NULL,
    [Id_Profesional] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.PROFESIONAL (Id_Profesional),
	[Fecha_Inicio_Agenda] datetime,
	[Fecha_Fin_Agenda] datetime,
	PRIMARY KEY(
		[Id_Agenda]
	)
)

/* Tabla DIA */ 
CREATE TABLE [KEY_OVER_9000].DIA (
	[Id_Dia] numeric(5,0) NOT NULL,
	[Descripcion] [nvarchar](10) NOT NULL,
	[Hora_Inicio] datetime,
	[Hora_Fin] datetime,
	[Id_Agenda] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.AGENDA_PROFESIONAL (Id_Agenda),
	PRIMARY KEY(
		[Id_Dia]
	)
)
/* Tabla PROFESIONAL_ESPECIALIDAD */ 
CREATE TABLE [KEY_OVER_9000].PROFESIONAL_ESPECIALIDAD (
	[Id_Profesional] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES [KEY_OVER_9000].PROFESIONAL (Id_Profesional),
    [Id_Especialidad] numeric(18,0)NOT NULL FOREIGN KEY REFERENCES [KEY_OVER_9000].ESPECIALIDAD (Id_Especialidad),
	PRIMARY KEY(
		[Id_Profesional]
		)	
	)
	
/* Tabla PLAN */ 
CREATE TABLE [KEY_OVER_9000].PLAN_MEDICO (
	[Id_Plan] numeric(18,0) NOT NULL, 	
	[Descripcion] [nvarchar](255) NOT NULL,
	[Precio_Bono_Consulta] numeric(18,0) NOT NULL,
	[Precio_Bono_Farmacia] numeric(18,0) NOT NULL
	PRIMARY KEY(
		[Id_Plan] 
	)
)	
		

/* Tabla AFILIADO */ 
CREATE TABLE [KEY_OVER_9000].AFILIADO (
	[Id_Afiliado] numeric(18,0) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Apellido] [nvarchar](255) NOT NULL,
	[DNI] numeric(18,0) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Telefono] numeric(18,0) NOT NULL,
	[Mail] [nvarchar](255) NOT NULL,
	[Fecha_Nacimiento] datetime,
	[Sexo] char NULL,
	[Estado_Civil] char NULL,
	[Cant_Familiares_A_Cargo] numeric(5,0) /*NOT NULL*/,
	[Id_Plan] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.PLAN_MEDICO (Id_Plan),
	[Baja] char NULL,
	--[Id_Usuario] numeric(18,0) FOREIGN KEY REFERENCES KEY_OVER_9000.USUARIO (Id_Usuario),
	PRIMARY KEY(
		[Id_Afiliado]
	)
)	

	
	
/* Tabla BAJAS */ 
CREATE TABLE [KEY_OVER_9000].BAJA (
	[Id_Afiliado] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.AFILIADO (Id_Afiliado),	
	[Fecha] datetime,
	PRIMARY KEY(
		[Id_Afiliado]
	)
)	

/* Tabla TIPO_BONO */ 
CREATE TABLE [KEY_OVER_9000].TIPO_BONO (
	[Id_Tipo_Bono] numeric(18,0) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Tipo_Bono] 
	)
)		


/* Tabla BONO */ 
CREATE TABLE [KEY_OVER_9000].BONO (
	[Id_Bono] numeric(18,0) NOT NULL,
	[Id_Afiliado] numeric(18,0) NOT NULL FOREIGN KEY REFERENCES KEY_OVER_9000.AFILIADO (Id_Afiliado),	
	[Fecha_Compra] datetime,
	[Consumido] char NOT NULL,
	PRIMARY KEY(
	[Id_Bono] 
	)
)	

/* Tabla BONO_CONSULTA */
CREATE TABLE [KEY_OVER_9000].BONO_CONSULTA (
    [Id_Bono_Consulta] numeric(18,0) NOT NULL,
    [Id_Bono] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES KEY_OVER_9000.BONO (Id_Bono),
	[Numero_Consulta] numeric(18,0) NOT NULL,	
	PRIMARY KEY(
    [Id_Bono_Consulta]
		
	)	 	
)		
		
/* Tabla BONO_FARMACIA */
CREATE TABLE [KEY_OVER_9000].BONO_FARMACIA (
    [Id_Bono_Farmacia] numeric(18,0) NOT NULL,
	[Id_Bono] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES KEY_OVER_9000.BONO (Id_Bono),
	[Fecha_Vencimiento] datetime,
	PRIMARY KEY(
	[Id_Bono_Farmacia] 
		
	)		
)	

/* Tabla RECETA */
CREATE TABLE [KEY_OVER_9000].RECETA (
    [Id_Receta] numeric(18,0) NOT NULL IDENTITY(1,1),
    [Id_Bono_Farmacia] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES KEY_OVER_9000.BONO (Id_Bono),
	[Cantidad] numeric(18,0), 
	[Aclaracion] [nvarchar](255) NOT NULL,
	[Medicamento] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Receta] 
		
	)		
)


/* Tabla ESTADO */
CREATE TABLE [KEY_OVER_9000].ESTADO (
    [Id_Estado] numeric(18,0) NOT NULL IDENTITY(1,1),
    [Descripcion] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Estado] 
		
	)		
)



/* Tabla TIPO_CANCELACION */
CREATE TABLE [KEY_OVER_9000].TIPO_CANCELACION (
    [Id_Tipo_Cancelacion] numeric(18,0) NOT NULL IDENTITY(1,1),
    [Descripcion] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Tipo_Cancelacion] 
		
	)		
)



/* Tabla TURNO */
CREATE TABLE [KEY_OVER_9000].TURNO (
    [Id_Turno] numeric(18,0) NOT NULL ,
    [Dni_Afiliado] numeric(18,0) NOT NULL /*FOREIGN KEY REFERENCES KEY_OVER_9000.AFILIADO (Id_Afiliado)*/,
    [Fecha_Turno] datetime,
	[Dni_Profesional] numeric(18,0) NOT NULL /*FOREIGN KEY REFERENCES KEY_OVER_9000.PROFESIONAL (Id_Profesional)*/,
	[Id_Estado] numeric(18,0) FOREIGN KEY REFERENCES KEY_OVER_9000.ESTADO (Id_Estado),
	PRIMARY KEY(
		[Id_Turno] 		
	)		
)

/* Tabla CANCELACION */
CREATE TABLE [KEY_OVER_9000].CANCELACION (
    [Id_Cancelacion] numeric(18,0) NOT NULL IDENTITY(1,1),
    [Id_Tipo_Cancelacion] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES [KEY_OVER_9000].TIPO_CANCELACION (Id_Tipo_Cancelacion),
    [Id_Turno] numeric(18,0)  NOT NULL  FOREIGN KEY REFERENCES [KEY_OVER_9000].TURNO (Id_Turno),
	[Motivo] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Cancelacion] 
		
	)		
)


/* Tabla ATENCION */
CREATE TABLE [KEY_OVER_9000].ATENCION (
    [Id_Atencion] numeric(18,0) NOT NULL IDENTITY(1,1),
    [Id_Turno] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES KEY_OVER_9000.TURNO (Id_Turno),
    [Id_Bono] numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES KEY_OVER_9000.BONO (Id_Bono),
    [Fecha_Atencion] datetime,
	[Sintomas] [nvarchar](255) NOT NULL,
	[Diagnostico] [nvarchar](255) NOT NULL,
	PRIMARY KEY(
		[Id_Atencion] 
		
	)		
)


/*************************************** Migracion de Tablas *******************************************/
/*******************************************************************************************************/
/*******************************************************************************************************/


/******************************************** Tabla ROL ************************************************/

INSERT INTO KEY_OVER_9000.ROL(Id_Rol,Nombre_Rol)
VALUES (1,'Administrativo'),(2,'Afiliado'),(3,'Profesional');


/**************************************** Tabla FUNCIONALIDAD ******************************************/

INSERT INTO KEY_OVER_9000.FUNCIONALIDAD(Id_Funcionalidad,Nombre_Funcionalidad)
VALUES (1,'ABM Rol'),(2,'ABM Afiliados'),(3,'ABM Profesional'),(4,'Registrar agenda profesional'),(5,'Compra de bonos'),(6,'Pedido de turno'),
(7,'Registro de llegada para atencion medica'),(8,'Registro de resultado para atencion medica'),(9,'Cancelar atencion medica'),(10,'Listado Estadistico');


/************************************ Tabla ROL_FUNCIONALIDAD ******************************************/

INSERT INTO KEY_OVER_9000.ROL_FUNCIONALIDAD
VALUES (1,1),(1,2),(1,3),(1,5),(1,6),(1,7),(1,9),(1,10),(2,5),(2,6),(2,9),(3,4),(3,8);


/****************************************** Tabla USUARIO **********************************************/

INSERT INTO KEY_OVER_9000.USUARIO(Username,[Password])
VALUES ('usuarioAdministrativo','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),
('usuarioAfiliado','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),
('usuarioProfesional','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7');


/*************************************** Tabla USUARIO_ROL **********************************************/

INSERT INTO KEY_OVER_9000.USUARIO_ROL(Id_Usuario,Id_Rol)
VALUES (1,1),(2,2),(3,3);

/**************************************** Tabla PLAN_MEDICO *********************************************/

INSERT INTO KEY_OVER_9000.PLAN_MEDICO
(Id_Plan,Descripcion,Precio_Bono_Consulta,Precio_Bono_Farmacia)
SELECT DISTINCT Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia
FROM gd_esquema.Maestra;

/***************************************** Tabla AFILIADO (MODIFICADO) **********************************************/

SELECT distinct  Paciente_Dni,Paciente_Nombre,Paciente_Apellido,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
into #temp_afiliado
FROM gd_esquema.Maestra;

INSERT INTO KEY_OVER_9000.AFILIADO
(ID_AFILIADO, DNI,Nombre,Apellido,Direccion,Telefono,Mail,Fecha_Nacimiento,Id_Plan)
SELECT ROW_NUMBER () over(order by Paciente_Apellido)* 100, Paciente_Dni,Paciente_Nombre,Paciente_Apellido,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
from #temp_afiliado;

drop table  #temp_afiliado;

/*************************************** Tabla PROFESIONAL *********************************************/

INSERT INTO KEY_OVER_9000.PROFESIONAL
(DNI,Nombre,Apellido,Direccion,Telefono,Mail,Fecha_Nacimiento)
SELECT DISTINCT Medico_Dni,Medico_Nombre,Medico_Apellido,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
FROM gd_esquema.Maestra
WHERE Medico_Dni IS NOT NULL;

/*************************************** Tabla ESPECIALIDAD ********************************************/

INSERT INTO KEY_OVER_9000.ESPECIALIDAD
(Id_Especialidad,Descripcion,Id_Tipo_Especialidad,Tipo_Especialidad)
SELECT DISTINCT Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra
WHERE Especialidad_Codigo IS NOT NULL
ORDER BY Tipo_Especialidad_Codigo;

/****************************************** Tabla TURNO ***********************************************/

INSERT INTO KEY_OVER_9000.TURNO
(Id_Turno,Fecha_Turno,Dni_Afiliado,Dni_Profesional)
SELECT DISTINCT Turno_Numero,Turno_Fecha,Paciente_Dni,Medico_Dni
FROM gd_esquema.Maestra
WHERE Turno_Numero IS NOT NULL;

--Falta migrar: Profesional_Especialidad, Bonos, Recetas

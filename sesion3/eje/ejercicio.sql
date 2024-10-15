CREATE TABLE Empresa(
	RUT VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(120),
	Direccion VARCHAR(120),
	Telefono VARCHAR(15),
	Correo VARCHAR(80),
	Web VARCHAR(50)
)

CREATE TABLE Cliente(
	RUT VARCHAR(10) PRIMARY KEY,
	Nombre VARCHAR(120),
	Correo VARCHAR(80),
	Direccion VARCHAR(120),
	Celular VARCHAR(15),
	Alta CHAR(1)
)

CREATE TABLE TipoVehiculo (
	IDTipoVehiculo SERIAL PRIMARY KEY,
	Nombre VARCHAR(120)
)

CREATE TABLE Marca (
	IDMarca SERIAL PRIMARY KEY,
	Nombre VARCHAR(120)
)

CREATE TABLE Vehiculo(
	IDVehiculo SERIAL PRIMARY KEY,
	Patente VARCHAR(10),
	Marca VARCHAR(20),
	Modelo VARCHAR(20),
	Color VARCHAR(20),
	Precio INTEGER,
	FrecuenciaMantencion SMALLINT,
	Marca_IDMarca INTEGER,
	TipoVehiculo_IDTipoVehiculo INTEGER,
	FOREIGN KEY (Marca_IDMarca) REFERENCES Marca(IDMarca),
	FOREIGN KEY (TipoVehiculo_IDTipoVehiculo) REFERENCES TipoVehiculo(IDTipoVehiculo)
)

CREATE TABLE Venta (
	Folio SERIAL PRIMARY KEY,
	Fecha DATE,
	Monto INTEGER,
	Vehiculo_IDVehiculo INTEGER,
	Cliente_RUT VARCHAR(10),
	FOREIGN KEY (Vehiculo_IDVehiculo) REFERENCES Vehiculo(IDVehiculo),
	FOREIGN KEY (Cliente_RUT) REFERENCES Cliente(RUT)
)

CREATE TABLE Mantencion (
	IDMantencion SERIAL PRIMARY KEY,
	Fecha DATE,
	TrabajosRealizados TEXT,
	Venta_Folio INTEGER,
	FOREIGN KEY (Venta_Folio) REFERENCES Venta(Folio)
)
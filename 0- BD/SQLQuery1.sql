--drop database BancoThink;
create database BancoThink;
use BancoThink;

create table Sucursales(
	IdSucursal				int			not null	identity(1,1),
	NombreSucursal			varchar		not null,
	Constraint	PK_Sucursales primary key(IdSucursal)
);

create table Empleados(
	RutEmpleado				int			not null,
	Nombre					varchar		not null,
	ApellidoP				varchar		not null,
	ApellidoM				varchar		not null,
	Celular					int			not null,
	DireccionParticular		varchar		not null,
	IdSucursal				int			not null,
	JefeSucursal			bit			not null	default 0,
	Constraint	PK_Empleados primary key(RutEmpleado),
	Constraint	FK_Empleados_Sucursales foreign key(IdSucursal) references Sucursales(IdSucursal)
);

create table Clientes(
	RutCliente				int			not null,
	Nombre					varchar		not null,
	ApellidoP				varchar		not null,
	ApellidoM				varchar		not null,
	Celular					int			not null,
	DireccionParticular		varchar		not null,
	DireccionLaboral		varchar		not null,
	FechaDeAlta				date		not null,
	Sueldo					int			not null,
	Ejecutivo				int			not null,
	Constraint	PK_Clientes primary key(RutCliente),
	Constraint	FK_Clientes_Empleados foreign key(Ejecutivo) references Empleados(RutEmpleado)
);

create table LoginThink(
	IdLogin					int			not null,
	RutCliente				int			not null,
	Passw					varchar		not null,
	StatusLogin				bit			not null	default 0, -- 0 = disabled and 1 = active
	Constraint PK_LoginThink primary key(IdLogin),
	Constraint FK_LoginThink_Clientes foreign key(RutCliente) references Clientes(RutCliente)
);

create table Creditos(
	NumeroCredito			int			not null	identity(1,1),
	RutCliente				int			not null,
	MontoCredito			int			not null,
	CantidadCuotas			int			not null,
	RutEjecutivo			int			not null,
	FechaIngreso			date		not null,
	RutAprobador			int			not null,
	FechaAutorizacion		date		not null,
	FechaEntrega			date		not null,
	Constraint	PK_Creditos primary key(NumeroCredito),
	Constraint	FK_Creditos_Clientes foreign key(RutCliente) references Clientes(RutCliente),
	Constraint	FK_Creditos_Empleados_Ejecutivo foreign key(RutEjecutivo) references Empleados(RutEmpleado),
	Constraint	FK_Creditos_Empleados_Aprobador foreign key(RutAprobador) references Empleados(RutEmpleado)
);
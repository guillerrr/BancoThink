create database BancoThink;
use BancoThink;

create table Sucursales(
	IdSucursal				int(3)		not null	identity(1,1),
	NombreSucursal			varchar(50)	not null,
	Constraint	PK_Sucursales primary key(IdSucursal)
);

create table Empleados(
	RutEmpleado				int(8)		not null,
	Nombre					varchar(50)	not null,
	ApellidoP				varchar(50)	not null,
	ApellidoM				varchar(50)	not null,
	Celular					int(9)		not null,
	DireccionParticular		varchar(50)	not null,
	IdSucursal				int(3)		not null,
	JefeSucursal			bit			not null	default 0, -- 0 = Ejcutivo y 1 = JefeSucursal(Super-Visor)
	Constraint	PK_Empleados primary key(RutEmpleado),
	Constraint	FK_Empleados_Sucursales foreign key(IdSucursal) references Sucursales(IdSucursal)
);

create table Clientes(
	RutCliente				int(8)		not null,
	Nombre					varchar		not null,
	ApellidoP				varchar		not null,
	ApellidoM				varchar		not null,
	Celular					int(9)		not null,
	DireccionParticular		varchar		not null,
	DireccionLaboral		varchar		not null,
	FechaDeAlta				date		not null,
	Sueldo					int(30)		not null,
	Ejecutivo				int(8)		not null,
	Constraint	PK_Clientes primary key(RutCliente),
	Constraint	FK_Clientes_Empleados foreign key(Ejecutivo) references Empleados(RutEmpleado)
);

create table LoginThink(
	IdLogin					int(30)		not null,
	RutEmpleado				int(8)		not null,
	Passw					varchar(8)	not null,
	StatusLogin				bit			not null	default 0, -- 0 = Disabled y 1 = Active
	Constraint PK_LoginThink primary key(IdLogin),
	Constraint FK_LoginThink_Empleados foreign key(RutEmpleado) references Empleados(RutEmpleado)
);

create table Creditos(
	NumeroCredito			int(30)		not null	identity(1,1),
	RutCliente				int(8)		not null,
	MontoCredito			int(30)		not null,
	CantidadCuotas			int(3)		not null,
	FechaIngreso			date		not null,
	RutAprobador			int(8)		not null,
	FechaAutorizacion		date		not null,
	FechaEntrega			date		not null,
	Constraint	PK_Creditos primary key(NumeroCredito),
	Constraint	FK_Creditos_Clientes foreign key(RutCliente) references Clientes(RutCliente),
	Constraint	FK_Creditos_Empleados_Aprobador foreign key(RutAprobador) references Empleados(RutEmpleado)
);

;

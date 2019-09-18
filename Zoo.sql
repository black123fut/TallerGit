-- SQLite
CREATE TABLE Especie(
    IdEspecie INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    NombreCientifico TEXT NOT NULL,
    Descripcion TEXT NOT NULL,
    IdZona INTEGER NOT NULL,
    FOREIGN KEY (IdZona) REFERENCES Zona(IdZona)
);

INSERT INTO Especie(IdEspecie, Nombre, NombreCientifico, Descripcion, IdZona) VALUES 
(1, "Monus", "Monosos", "Peludo", 1),
(2, "Avee", "avoso", "Plumudo", 2),
(3, "Hipoo", "Hiposo", "Cuerudo", 3);

CREATE TABLE Habitat(
    IdHabitat INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Clima TEXT NOT NULL,
    TipoVegetacion TEXT NOT NULL
);

INSERT INTO Habitat(IdHabitat, Nombre, Clima, TipoVegetacion) VALUES
(1, "Sabana", "Sol", "Sepia"),
(2, "Artico", "Frio", "frieo"),
(3, "Ciudad", "Soleado", "asfalto");

CREATE TABLE Continente(
    IdContinente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL
);

INSERT INTO Continente(IdContinente, Nombre) VALUES
(1, "Oceania"),
(2, "America"),
(3, "Antartida");

CREATE TABLE Zona(
    IdZona INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Extension TEXT NOT NULL
);

INSERT INTO Zona(IdZona, Nombre, Extension) VALUES
(1, "Desierto", "Desierto1"),
(2, "Artico", "Artico2"),
(3, "Sabana", "Sabana3");

CREATE TABLE Itinerario(
    IdItinerario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Codigo TEXT NOT NULL,
    DuracionRecorrido TIME NOT NULL,
    Longitud INTEGER NOT NULL,
    MaxVisitantes INTEGER NOT NULL,
    NumeroEspecies INTEGER NOT NULL
);

INSERT INTO Itinerario(IdItinerario, Codigo, DuracionRecorrido, Longitud, MaxVisitantes, NumeroEspecies) VALUES 
(1, "DFDFG", "2019-05-19", 12, 50, 10),
(2, "HETE", "2019-05-18", 17, 20, 42),
(3, "GHDHER", "2019-05-20", 15, 33, 22);

CREATE TABLE Empleado(
    IdEmpleado INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Direccion TEXT NOT NULL,
    Telefono TEXT NOT NULL,
    FechaIngreso DATE NOT NULL,
    Salario INTEGER NOT NULL
);

INSERT INTO Empleado(IdEmpleado, Nombre, Direccion, Telefono, FechaIngreso, Salario) VALUES
(1, "FER", "dfsfs", "8888-8888", "2017-03-17", 200),
(2, "Gero", "lkhyuk", "8888-7777", "2009-07-17", 300),
(3, "Alejandro", "hrth", "8888-6666", "2006-03-19", 1000000);

CREATE TABLE EspecieHabitat(
    IdEspecie INTEGER NOT NULL,
    IdHabitat INTEGER NOT NULL,
    FOREIGN KEY (IdEspecie) REFERENCES Especie(IdEspecie),
    FOREIGN KEY (IdHabitat) REFERENCES Habitat(IdHabitat)
);

INSERT INTO EspecieHabitat(IdEspecie, IdHabitat) VALUES 
(1, 1),
(2, 3),
(3, 3);

CREATE TABLE ContinenteHabitat(
    IdContinente INTEGER NOT NULL,
    IdHabitat INTEGER NOT NULL,
    FOREIGN KEY (IdHabitat) REFERENCES Habitat(IdHabitat),
    FOREIGN KEY (IdContinente) REFERENCES Continente(IdContinente)
);

INSERT INTO ContinenteHabitat(IdContinente, IdHabitat) VALUES 
(1, 1),
(2, 1),
(3, 3);

CREATE TABLE EspecieEmpleado(
    IdEspecie INTEGER NOT NULL,
    IdEmpleado INTEGER NOT NULL,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
    FOREIGN KEY (IdEspecie) REFERENCES Especie(IdEspecie)
);

INSERT INTO EspecieEmpleado(IdEspecie, IdEmpleado) VALUES
(1, 1),
(2, 2),
(3, 1);

CREATE TABLE EmpleadoItinerario(
    IdItinerario INTEGER NOT NULL,
    IdEmpleado INTEGER NOT NULL,
    FOREIGN KEY (IdItinerario) REFERENCES Itinerario(IdItinerario),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);

INSERT INTO EmpleadoItinerario(IdItinerario, IdEmpleado) VALUES 
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE ItinerarioZona(
    IdItinerario INTEGER NOT NULL,
    IdZona INTEGER NOT NULL,
    FOREIGN KEY (IdItinerario) REFERENCES Itinerario(IdItinerario),
    FOREIGN KEY (IdZona) REFERENCES Zona(IdZona)
);

INSERT INTO ItinerarioZona(IdItinerario, IdZona) VALUES 
(1, 1),
(2, 2),
(3, 3);

--1
SELECT * FROM Empleado;
--2
SELECT * FROM Especie;
--3
SELECT Nombre, Salario, FechaIngreso FROM Empleado E WHERE E.FechaIngreso 
ORDER BY E.Salario BETWEEN '2005-01-01' AND '2012-12-30' DESC;
--4
SELECT Salario FROM Empleado E WHERE E.Salario < 10000;
--5
SELECT

--6
SELECT Z.Nombre, I.NumeroEspecies, Z.Extension FROM Zona Z
INNER JOIN ItinerarioZona IZ ON Z.IdZona = IZ.IdZona
INNER JOIN Itinerario I ON IZ.IdItinerario = I.IdItinerario
ORDER BY Z.Extension DESC;



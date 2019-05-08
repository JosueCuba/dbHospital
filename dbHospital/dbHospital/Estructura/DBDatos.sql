USE dbHospital
GO
--- IMPORTNADO REGISTRO DE UBIGEO
BULK
INSERT PACIENTE.UBIGEO
FROM 'D:\UBIGEO_LIMA.csv'
WITH(
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n')
GO
SELECT * FROM PACIENTE.UBIGEO
GO
--- IMPORTNADO REGISTRO DE PACIENTES
BULK
INSERT PACIENTE.PACIENTE
FROM 'D:\Pacientes.xlsx'
WITH(
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n')
GO
SELECT * FROM PACIENTE.PACIENTE
GO
--- REGISTRO DE HISTORIA.HISTORIA
INSERT INTO HISTORIA.HISTORIA (FECHIST,OBSHIST)
VALUES 
	('2000-03-01 00:00:00.000', 'El paciente se atendi� sin problemas'),
	('2000-04-05 00:00:00.000', 'El paciente tiene que llevar controles semanales'),
	('2000-10-04 00:00:00.000', 'El paciente debe de tomar los medicamentos incadicados'),
	('2000-12-10 00:00:00.000', 'El paciente debe ser transferido a lima')
GO
SELECT * FROM HISTORIA.HISTORIA
GO
--- REGISTRO DE HISTORIA.TURNO
INSERT INTO HISTORIA.TURNO
	(FECTUR,ESTTUR,OBSTUR)
VALUES
	('1979-11-07 10:30:20.000','1','Primer turno del d�a'),
	('1979-11-07 11:00:20.000','1','Segundo turno del d�a'),
	('1979-11-07 11:30:20.000','1','Tercer turno del d�a'),
	('1979-11-07 00:00:20.000','1','Cuarto turno del d�a'),
	('1979-11-07 13:00:20.000','1','Quinto turno del d�a'),
	('1979-11-07 13:30:20.000','1','Sexto turno del d�a')
GO
SELECT * FROM HISTORIA.TURNO
GO

--- REGISTRO DE MEDICO.MEDICO
INSERT INTO MEDICO.MEDICO
	(NOMMED,APEPATMED,APEMATMED,FECNACMED,SEXMED,DNIMED,TELFMED,EMAILMED,DOMMED,UBIGEOMED,OBSERVMED)
VALUES 
	('Esperanza','Ram�rez','Tadeo','1979-07-11','F','43650976','','esperanza@yahoo.com',' Av. Los Laureles','150512','M�dico procedente de la ciudad de Lima'), 
	('Alberto','Ram�rez','Pasache','1976-06-06','M','56782955','998765123','alberto@gmail.com','Jr. Los Trigales','150508','M�dico muy trabajador'), 
	('Rosa','Mart�nez','Osorio','1980-10-05','F','58122656','998877654','rosa@outlook.com','Av. Las Gardenias','150510','M�dico muy responsable'),
	('Gloria','Zevallos','Pachas','1974-12-25','F','67450988','998877432','gloria@hotmail.com','Jr. Los Faroles','150514','M�dico local. muy proactivo.');
GO
SELECT * FROM MEDICO.MEDICO
GO

--- REGISTRO DE MEDICO.ESPECIALIDAD
INSERT INTO MEDICO.ESPECIALIDAD
	(NOMESP,OBSESP)
VALUES
	('Medicina General','Es para atenci�n de enfermedades en general'), 
	('Odontolog�a','la Atenci�n dental'),
	('Pediatr�a','Atenci�n para ni�os'),
	('Oftalmolog�a','Atenci�n de la vista '),
	('Nutrici�n','Relacionado con temas de alimentaci�n');
 GO
 SELECT * FROM MEDICO.ESPECIALIDAD
 GO



 --- REGISTRO PACIENTE.HISTORIA_PACIENTE
 INSERT INTO PACIENTE.HISTORIA_PACIENTE
	(CODHIST,CODPAC,CODMED)
 VALUES
	(1,1,3),
	(2,7,4),
	(3,2,1),
	(4,3,2)
GO
SELECT * FROM PACIENTE.HISTORIA_PACIENTE
GO

--- REGISTRO PACIENTE.TURNO_PACIENTE
INSERT INTO PACIENTE.TURNO_PACIENTE
	(CODTUR,CODPAC,CODMED)
VALUES 
	(2,1,4),
	(4,4,3)
GO

--- Agregue 3 registros
INSERT INTO PACIENTE.TURNO_PACIENTE
	(CODTUR,CODPAC,CODMED)
VALUES 
	(1,3,4),
	(3,1,2),
	(4,2,3)
GO
--- BackUp
BACKUP DATABASE dbHospital
TO DISK = 'D:\DataDB\dbHospital.bak'
go



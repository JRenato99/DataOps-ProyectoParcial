USE Kaggle;

GO

-- EN CASO NO EXISTE TABLA
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'dbo.olympics') and TYPE = 'U')
	CREATE TABLE dbo.olympics(
	 NOC VARCHAR(10),
	 Gold INT,
	 Silver INT,
	 Bronze INT,
	 Total INT
	)
GO

-- SI YA EXISTE LA TABLA 
TRUNCATE TABLE dbo.olympics;
GO

-- IMPORTAR DATA DESDE ARCHIVO
BULK INSERT dbo.OLYMPICS
FROM 'C:\Users\jrsol\OneDrive\Escritorio\Proyecto_parcial\dataset\Athens 2004 Olympics Nations Medals.csv'
WITH(
	FIRSTROW = 2, --empieza desde la segunda linea, evitando la cabecera
	FIELDTERMINATOR = ',', --el separados de las columnas
	ROWTERMINATOR = '0X0a' --salto de linea
)
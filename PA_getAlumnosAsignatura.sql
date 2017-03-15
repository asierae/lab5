CREATE PROCEDURE getAlumnosAsignatura
	@asignatura nvarchar(30)
AS
SELECT  Distinct(Email)
 FROM EstudiantesGrupo INNER JOIN GruposClase ON codigoasig=@asignatura
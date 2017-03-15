CREATE PROCEDURE getHorasTotalesTareasAsignatura
	@asignatura nvarchar(30)
AS
SELECT  SUM(HReales),CodTarea
 FROM EstudiantesTareas INNER JOIN TareasGenericas ON CodAsig=@asignatura and Codigo=CodTarea
 Group By CodTarea
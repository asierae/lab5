CREATE PROCEDURE getHorasTareasAlumno
	@alumno nvarchar(80),
	@asignatura nvarchar(30)
AS
SELECT  CodTarea,HReales,EstudiantesTareas.HEstimadas
 FROM EstudiantesTareas INNER JOIN TareasGenericas ON CodAsig=@asignatura and TareasGenericas.Codigo=CodTarea
 WHERE Email=@alumno
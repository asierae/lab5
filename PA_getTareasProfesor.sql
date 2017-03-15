CREATE PROCEDURE getTareasProfesor
	@profesor nvarchar(80),
	@asignatura nvarchar(30)
AS
SELECT TareasGenericas.Codigo, TareasGenericas.CodAsig, TareasGenericas.Descripcion, TareasGenericas.Explotacion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea
 FROM ((TareasGenericas INNER JOIN GruposClase ON TareasGenericas.CodAsig=GruposClase.codigoasig)
 INNER JOIN ProfesoresGrupo ON GruposClase.codigo=ProfesoresGrupo.codigogrupo)
 WHERE ProfesoresGrupo.email=@profesor and TareasGenericas.CodAsig=@asignatura
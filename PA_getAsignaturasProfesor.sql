CREATE PROCEDURE getAsignaturasProfesor
	@profesor nvarchar(80)
AS
SELECT codigoAsig FROM ((GruposClase INNER JOIN ProfesoresGrupo ON email=@profesor and codigogrupo=codigo))

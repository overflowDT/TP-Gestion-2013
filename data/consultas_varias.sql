--Select Top 100 COUNT(Distinct Paciente_Dni),Paciente_Mail from gd_esquema.Maestra group by Paciente_Mail order by 1 desc
--Select Paciente_Direccion,Paciente_Dni,Paciente_Apellido,Paciente_Nombre from gd_esquema.Maestra group by Paciente_Direccion,Paciente_Dni,Paciente_Apellido,Paciente_Nombre having Paciente_Direccion in (SELECT Paciente_Direccion FROM (Select Paciente_Direccion,Paciente_Dni from gd_esquema.Maestra group by Paciente_Direccion,Paciente_Dni) as a group by a.Paciente_Direccion having COUNT(*)=2 )--Where Paciente_Mail='paz_L�pez@gmail.com')
--Select Top 100 COUNT(Distinct Paciente_Nombre),Paciente_Dni from gd_esquema.Maestra group by Paciente_Dni order by 1 desc
--SELECT Paciente_Dni from gd_esquema.Maestra group by Paciente_Dni
--Select * from SIGKILL.usuario
Select count(*) from SIGKILL.afiliado
--Insert into SIGKILL.afiliado(afil_numero,afil_nombre,) VAlues (102),(103),(104)
SELECT COUNT(DISTINCT ROUND(afil_numero/100,0)),SIGKILL.getNextNumeroAfiliado() FROM SIGKILL.afiliado

--SELECT distinct Medico_Dni,Medico_Nombre,Medico_Apellido,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
--from gd_esquema.Maestra WHERE Medico_Dni is Not null
--Select * from GD2C2013.SIGKILL.profesional
--Select Distinct Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia from gd_esquema.Maestra order by Plan_Med_Codigo
--Select DISTINCT Turno_Numero,afil_numero,Turno_Fecha,pro_id from gd_esquema.Maestra,SIGKILL.afiliado,SIGKILL.profesional WHERE Turno_Numero is not null AND afil_dni=Paciente_Dni AND pro_dni=Medico_Dni ORDER BY Turno_Fecha 
--Select top 1000 * from SIGKILL.turno
--Select DISTINCT Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo from gd_esquema.Maestra WHERE Especialidad_Codigo is not null order by Especialidad_Codigo
--Select DISTINCT Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion from gd_esquema.Maestra WHERE Tipo_Especialidad_Codigo is not null order by Tipo_Especialidad_Codigo
--Select Paciente_Dni,Turno_Numero,Consulta_Sintomas,Consulta_Enfermedades from gd_esquema.Maestra Where Consulta_Sintomas is not null 
--Select DISTINCT Consulta_Sintomas,Consulta_Enfermedades from GD2C2013.gd_esquema.Maestra Where Consulta_Sintomas is not null 
--(SELECT DISTINCT usr_id,(SELECT Count(*) from (Select M2.Paciente_Dni from GD2C2013.gd_esquema.Maestra as M2 WHERE M.Paciente_Dni<=M2.Paciente_Dni group by M2.Paciente_Dni) as a) *100 + 1 as numero_afil,Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Plan_Med_Codigo FROM GD2C2013.gd_esquema.Maestra as M INNER JOIN GD2C2013.SIGKILL.usuario ON (usr_usuario=('u'+CONVERT(nvarchar,Paciente_Dni))))
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Sql;

namespace Clinica_Frba.ClasesDatosTablas
{
    public class Afiliado
    {
        public long afil_numero  { get; set; }
        public long afil_usuario { get; set; }
        public string afil_nombre { get; set; }
        public string afil_apellido { get; set; }
        public long afil_tipo_doc { get; set; }
        public long afil_dni { get; set; }
        public string afil_direccion { get; set; }
        public long afil_telefono { get; set; }
        public string afil_mail { get; set; }
        public DateTime afil_nacimiento { get; set; }
        public string afil_sexo { get; set; }
        public long afil_estado_civil { get; set; }
        public int afil_cant_hijos { get; set; }
        public int afil_cant_fam_a_cargo { get; set; }
        public long afil_id_plan_medico { get; set; }
        public int afil_activo { get; set; }

        SqlRunner runner = new SqlRunner(Properties.Settings.Default.GD2C2013ConnectionString);

        public string getName()
        {
            return afil_apellido+", "+afil_nombre;
        }

        public long getNumeroAfiliadoPrincipal()
        {
            return numeroAfiliadoPrincipal(afil_numero);
        }

        public long numeroAfiliadoPrincipal(long afil_numero)
        {
            return (long) Math.Floor((double)afil_numero / 100);
        }

        public static Afiliado newFromId(long id)
        {
            return new Adapter().Transform<Afiliado>(new SqlRunner(Properties.Settings.Default.GD2C2013ConnectionString).Single("SELECT * FROM SIGKILL.Afiliado WHERE afil_numero={0}", id.ToString()));
        }

        public String parsearSexo(String sexo)
        {
            switch (sexo)
            {
                case "Masculino":
                    sexo = "M";
                    break;
                case "Femenino":
                    sexo = "F";
                    break;
                case "Desconocido":
                    sexo = "D";
                    break;
                default:
                    sexo = "D";
                    break;
            }
            return sexo;
        }

        public long parsearEstadoCivil(String estado_civil_texto)
        {
            var result = runner.Single("SELECT estciv_id from GD2C2013.SIGKILL.estado_civil where estciv_descripcion = '{0}'", estado_civil_texto);
            return (long)result[0];

        }

        public long parsearTipoDoc(String tipo_doc_texto)
        {
            var result = runner.Single("SELECT tdoc_id from GD2C2013.SIGKILL.tipo_doc WHERE tdoc_descripcion = '{0}'", tipo_doc_texto);
            return (long)result[0];

        }
        
        public long parsearPlanMedico(String plan_medico_texto)
        {
            var result = runner.Single("SELECT pmed_id FROM GD2C2013.SIGKILL.plan_medico WHERE pmed_nombre = '{0}'",plan_medico_texto);
            return (long)result[0];
        }

        public Boolean commit()
        {
            runner.Update("UPDATE SIGKILL.afiliado SET afil_direccion='{0}', afil_telefono={1}, afil_mail='{2}', afil_sexo='{3}', afil_estado_civil={4}, afil_id_plan_medico={5}, afil_activo={6}, afil_tipo_doc={7} WHERE afil_numero={8}",
                    afil_direccion, afil_telefono, afil_mail, afil_sexo, afil_estado_civil, afil_id_plan_medico, afil_activo, afil_tipo_doc, afil_numero);

            return true;
        }

        public void darDeBaja()
        {
            afil_activo = 0;
            cancelarTodasAtencionesAfiliado();
            commit();
        }
        public void cancelarTodasAtencionesAfiliado()
        {
            DateTime fin = Properties.Settings.Default.Date;
            fin.AddDays(1);
            runner.Insert("INSERT INTO SIGKILL.cancelacion_atencion_medica(cam_profesional,cam_nro_afiliado,cam_tipo_cancelacion,cam_motivo,cam_fecha_turno,cam_fecha_cancelacion,cam_turno_id)" +
            "(SELECT trn_profesional,trn_afiliado,{1},'{2}',trn_fecha_hora,'{3}',trn_id FROM SIGKILL.turno WHERE  trn_fecha_hora > '{0}' AND trn_afiliado = {4} AND trn_id not in (SELECT cons_turno FROM SIGKILL.consulta WHERE cons_valido=1) AND trn_valido=1)", fin.ToString("yyyy-MM-dd"), "8", "Baja de Afiliado", Properties.Settings.Default.Date.ToString("yyyy-MM-dd"), this.afil_numero);
            runner.Delete("UPDATE SIGKILL.turno SET trn_valido=0 WHERE trn_fecha_hora > '{0}' AND trn_afiliado = {1} AND trn_id not in (SELECT cons_turno FROM SIGKILL.consulta WHERE cons_valido=1)", fin.ToString("yyyy-MM-dd"), this.afil_numero);
        }
        public static Afiliado newFromDNI(int p)
        {
            return new Adapter().Transform<Afiliado>(new SqlRunner(Properties.Settings.Default.GD2C2013ConnectionString).Single("SELECT TOP 1 * FROM SIGKILL.Afiliado WHERE afil_dni={0}", p.ToString()));
        }
    }
}

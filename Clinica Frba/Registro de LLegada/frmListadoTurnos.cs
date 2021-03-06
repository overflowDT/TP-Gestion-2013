﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Clinica_Frba.ClasesDatosTablas;
using Clinica_Frba.Sql;

namespace Clinica_Frba.Registro_de_LLegada
{
    public partial class frmListadoTurnos : Form
    {
        SqlRunner runner = new SqlRunner(Properties.Settings.Default.GD2C2013ConnectionString);
        int type=1;
        Afiliado afil;//tipo 2 cancelar tturno
        Profesional prof;//tipo 3 cancelar turno
        public frmListadoTurnos()
        {
            InitializeComponent();
        }
        public frmListadoTurnos(int tipo)
        {
            InitializeComponent();
            type = tipo;
        }
        public frmListadoTurnos(int tipo,Afiliado a)
        {
            type = tipo;
            afil = a;
            InitializeComponent();
            
        }
        public frmListadoTurnos(int tipo,Profesional p)
        {
            type = tipo;
            prof = p;
            InitializeComponent();
            
        }

        private void btn_limpiar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = null;
        }

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            Filters filter = new Filters();
            filter.AddEqualField("trn_afiliado", "afil_numero");
            filter.AddEqualField("trn_profesional", "pro_id");
            filter.AddEqualField("pro_id", "espprof_profesional");
            filter.AddEqualField("espprof_especialidad", "esp_id");
            filter.AddLessThanOrEqual(String.Format("DATEDIFF(HOUR,trn_fecha_hora,'{0}')",Properties.Settings.Default.Date.ToString("yyyy-MM-dd HH:mm")), "0");
            filter.AddLessThanOrEqual(String.Format("DATEDIFF(DAY,trn_fecha_hora,'{0}')", Properties.Settings.Default.Date.ToString("yyyy-MM-dd")), "0");
            filter.AddOrderBy("trn_fecha_hora", "ASC");
            if (chk_hoy.Checked)
            {
                filter.AddEqual(String.Format("DATEDIFF(DAY,trn_fecha_hora,'{0}')", Properties.Settings.Default.Date.ToString("yyyy-MM-dd")), "0");
            }
            if (txtId.Text.Length > 0)
            {
                filter.AddEqual("trn_id", txtId.Text);
            }
            if (txt_nom_afil.Text.Length > 0)
            {
                filter.AddLike("afil_nombre", txt_nom_afil.Text);
            }
            if (txt_ape_afil.Text.Length > 0)
            {
                filter.AddLike("afil_apellido", txt_ape_afil.Text);
            }
            if (txt_nom_prof.Text.Length > 0)
            {
                filter.AddLike("pro_nombre", txt_nom_prof.Text);
            }
            if (txt_ape_prof.Text.Length > 0)
            {
                filter.AddLike("pro_apellido", txt_ape_prof.Text);
            }
            if (txt_num_afil.Text.Length > 0)
            {
                filter.AddEqual("afil_numero", txt_num_afil.Text);
            }
            if (combo_especialidad.SelectedIndex >= 0)
            {
                filter.AddEqual("esp_nombre_especialidad", combo_especialidad.Text);
            }
            filter.AddEqual("trn_valido", "1");
            filter.AddCustom("trn_id", "not in", "(SELECT cons_turno FROM SIGKILL.consulta WHERE cons_valido=1)");
            switch (type){
                case 2: case 3:
                    filter.AddNotEqual("DATEDIFF(day,'" + Properties.Settings.Default.Date.ToString("yyyy-MM-dd") + "',trn_fecha_hora)", "0");
                    break;
            }
            try
            {
                var result = runner
                    .Select("SELECT DISTINCT trn_id,trn_fecha_hora,trn_afiliado,afil_Apellido,afil_nombre,trn_profesional,pro_Apellido,pro_nombre FROM SIGKILL.turno,SIGKILL.afiliado,SIGKILL.profesional,SIGKILL.esp_prof,SIGKILL.especialidad", filter);
                dataGridView1.DataSource = result;

            }
            catch(Exception ex)
            {
               MessageBox.Show(ex.Message);
            }
        }

        private void frmListadoTurnos_Load(object sender, EventArgs e)
        {
            var esp= new Adapter().TransformMany<Especialidad>(runner.Select("SELECT * FROM SIGKILL.especialidad WHERE esp_id>0"));
            foreach (Especialidad r in esp)
            {
                combo_especialidad.Items.Add(r.esp_nombre_especialidad);
            }
            switch (type)
            {
                case 1:
                    MessageBox.Show("Seleccione un turno para registrar su llegada");
                    break;
                case 2://cancelar turno afiliado
                    txt_num_afil.Text = afil.afil_numero.ToString();
                    txt_nom_afil.Text = afil.afil_nombre;
                    txt_ape_afil.Text = afil.afil_apellido;
                    txt_num_afil.Enabled = false;
                    txt_nom_afil.Enabled = false;
                    txt_ape_afil.Enabled = false;
                    chk_hoy.Checked = false;
                    chk_hoy.Visible = false;
                    MessageBox.Show("Seleccione un turno para cancelar");
                    break;
                case 3://cancelar turno profesional
                   
                    txt_nom_prof.Text = prof.pro_nombre;
                    txt_ape_prof.Text = prof.pro_apellido;
                    txt_nom_prof.Enabled = false;
                    txt_ape_prof.Enabled = false;
                    chk_hoy.Checked = false;
                    chk_hoy.Visible = false;
                    MessageBox.Show("Seleccione un turno para cancelar");
                    break;
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return;
            var cell = dataGridView1.Rows[e.RowIndex];
            switch (type)
            {
                case 1:
                    Afiliado a = new Adapter().Transform<Afiliado>(runner.Single("SELECT * FROM SIGKILL.afiliado WHERE afil_numero={0}",cell.Cells[2].Value.ToString()));
                    new Clinica_Frba.Registro_de_LLegada.frmRegistroLlegada((long)cell.Cells[0].Value,a).Show();
                    this.Close();
                    break;
                case 2:case 3:
                    DialogResult dialogResult = MessageBox.Show("¿Quieres Cancelar el turno " + cell.Cells[0].Value.ToString() + "?", "Cancelar Turno", MessageBoxButtons.YesNo);
                    if (dialogResult == DialogResult.Yes)
                    {
                        string value = "Motivo de la cancelacion";
                        if (InputBox.Show("Cancelar Turno", "Ingrese el motivo de cancelación.", ref value) == DialogResult.OK)
                        {
                            runner.Delete("UPDATE SIGKILL.turno SET trn_valido=0 WHERE trn_id={0} AND trn_valido=1", cell.Cells[0].Value.ToString());
                            runner.Insert("INSERT INTO SIGKILL.cancelacion_atencion_medica(cam_profesional,cam_nro_afiliado,cam_tipo_cancelacion,cam_motivo,cam_fecha_turno,cam_fecha_cancelacion,cam_turno_id)" +
                            "VALUES ({0},{1},{2},'{3}','{4}','{5}',{6})", cell.Cells[5].Value.ToString(), cell.Cells[2].Value.ToString(), type.ToString(), value, ((DateTime)cell.Cells[1].Value).ToString("yyyy-MM-dd HH:mm"), Properties.Settings.Default.Date.ToString("yyyy-MM-dd HH:mm"), cell.Cells[0].Value.ToString());
                            MessageBox.Show("Se ha cancelado correctamente el turno");
                            btn_buscar_Click(new object(), new EventArgs());
                        }
                    }
                    break;
            }

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }


    }
}

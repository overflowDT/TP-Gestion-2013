﻿namespace Clinica_Frba.Cancelar_Atencion
{
    partial class frmCancelarTurno
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbl_afiliado = new System.Windows.Forms.Label();
            this.lbl_af = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lbl_profesional = new System.Windows.Forms.Label();
            this.lbl_prf = new System.Windows.Forms.Label();
            this.btn_volver = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbl_afiliado
            // 
            this.lbl_afiliado.AutoSize = true;
            this.lbl_afiliado.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_afiliado.Location = new System.Drawing.Point(144, 55);
            this.lbl_afiliado.Name = "lbl_afiliado";
            this.lbl_afiliado.Size = new System.Drawing.Size(103, 13);
            this.lbl_afiliado.TabIndex = 13;
            this.lbl_afiliado.Text = "Apellido. Nombre";
            // 
            // lbl_af
            // 
            this.lbl_af.AutoSize = true;
            this.lbl_af.Location = new System.Drawing.Point(91, 55);
            this.lbl_af.Name = "lbl_af";
            this.lbl_af.Size = new System.Drawing.Size(47, 13);
            this.lbl_af.TabIndex = 12;
            this.lbl_af.Text = "Afiliado: ";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.dateTimePicker2);
            this.groupBox1.Controls.Add(this.dateTimePicker1);
            this.groupBox1.Controls.Add(this.lbl_profesional);
            this.groupBox1.Controls.Add(this.lbl_prf);
            this.groupBox1.Controls.Add(this.btn_volver);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.lbl_afiliado);
            this.groupBox1.Controls.Add(this.lbl_af);
            this.groupBox1.Location = new System.Drawing.Point(7, 11);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(311, 258);
            this.groupBox1.TabIndex = 14;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Cancelar Turno";
            // 
            // lbl_profesional
            // 
            this.lbl_profesional.AutoSize = true;
            this.lbl_profesional.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_profesional.Location = new System.Drawing.Point(144, 42);
            this.lbl_profesional.Name = "lbl_profesional";
            this.lbl_profesional.Size = new System.Drawing.Size(103, 13);
            this.lbl_profesional.TabIndex = 18;
            this.lbl_profesional.Text = "Apellido. Nombre";
            // 
            // lbl_prf
            // 
            this.lbl_prf.AutoSize = true;
            this.lbl_prf.Location = new System.Drawing.Point(73, 42);
            this.lbl_prf.Name = "lbl_prf";
            this.lbl_prf.Size = new System.Drawing.Size(62, 13);
            this.lbl_prf.TabIndex = 17;
            this.lbl_prf.Text = "Profesional:";
            // 
            // btn_volver
            // 
            this.btn_volver.Location = new System.Drawing.Point(6, 229);
            this.btn_volver.Name = "btn_volver";
            this.btn_volver.Size = new System.Drawing.Size(111, 23);
            this.btn_volver.TabIndex = 16;
            this.btn_volver.Text = "Volver";
            this.btn_volver.UseVisualStyleBackColor = true;
            this.btn_volver.Click += new System.EventHandler(this.btn_volver_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(94, 194);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(111, 23);
            this.button2.TabIndex = 15;
            this.button2.Text = "Cancelar Período";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(94, 88);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(111, 23);
            this.button1.TabIndex = 14;
            this.button1.Text = "Buscar Turno";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(94, 135);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker1.TabIndex = 19;
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Location = new System.Drawing.Point(94, 161);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker2.TabIndex = 20;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 138);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 13);
            this.label1.TabIndex = 21;
            this.label1.Text = "Fecha Inicial:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 164);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 13);
            this.label2.TabIndex = 22;
            this.label2.Text = "Fecha Final:";
            // 
            // frmCancelarTurno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(327, 281);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmCancelarTurno";
            this.Text = "Cancelar Turno";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lbl_afiliado;
        private System.Windows.Forms.Label lbl_af;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btn_volver;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label lbl_profesional;
        private System.Windows.Forms.Label lbl_prf;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}
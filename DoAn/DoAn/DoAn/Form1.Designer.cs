namespace DoAn
{
    partial class DangNhap
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
            this.lbEmail = new System.Windows.Forms.Label();
            this.lbMatkhau = new System.Windows.Forms.Label();
            this.txtTenDN = new System.Windows.Forms.TextBox();
            this.txtMatkhau = new System.Windows.Forms.TextBox();
            this.btnDN = new MetroFramework.Controls.MetroButton();
            this.cbxHienmk = new System.Windows.Forms.CheckBox();
            this.lkQuenMK = new System.Windows.Forms.LinkLabel();
            this.llbDky = new System.Windows.Forms.LinkLabel();
            this.label3 = new System.Windows.Forms.Label();
            this.rdbBanGiamHieu = new System.Windows.Forms.RadioButton();
            this.rdbGiaoVien = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.pnAnh = new System.Windows.Forms.Panel();
            this.lbExit = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lbEmail
            // 
            this.lbEmail.AutoSize = true;
            this.lbEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbEmail.Location = new System.Drawing.Point(484, 136);
            this.lbEmail.Name = "lbEmail";
            this.lbEmail.Size = new System.Drawing.Size(45, 18);
            this.lbEmail.TabIndex = 1;
            this.lbEmail.Text = "Email";
            // 
            // lbMatkhau
            // 
            this.lbMatkhau.AutoSize = true;
            this.lbMatkhau.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMatkhau.Location = new System.Drawing.Point(484, 193);
            this.lbMatkhau.Name = "lbMatkhau";
            this.lbMatkhau.Size = new System.Drawing.Size(69, 18);
            this.lbMatkhau.TabIndex = 2;
            this.lbMatkhau.Text = "Mật khẩu";
            this.lbMatkhau.Click += new System.EventHandler(this.label2_Click);
            // 
            // txtTenDN
            // 
            this.txtTenDN.Location = new System.Drawing.Point(615, 136);
            this.txtTenDN.Name = "txtTenDN";
            this.txtTenDN.Size = new System.Drawing.Size(162, 20);
            this.txtTenDN.TabIndex = 0;
            // 
            // txtMatkhau
            // 
            this.txtMatkhau.Location = new System.Drawing.Point(615, 193);
            this.txtMatkhau.Name = "txtMatkhau";
            this.txtMatkhau.PasswordChar = '*';
            this.txtMatkhau.Size = new System.Drawing.Size(162, 20);
            this.txtMatkhau.TabIndex = 1;
            // 
            // btnDN
            // 
            this.btnDN.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDN.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnDN.Location = new System.Drawing.Point(547, 315);
            this.btnDN.Name = "btnDN";
            this.btnDN.Size = new System.Drawing.Size(168, 45);
            this.btnDN.TabIndex = 3;
            this.btnDN.Text = "Đăng nhập";
            this.btnDN.UseSelectable = true;
            this.btnDN.Click += new System.EventHandler(this.btnDN_Click);
            // 
            // cbxHienmk
            // 
            this.cbxHienmk.AutoSize = true;
            this.cbxHienmk.Location = new System.Drawing.Point(615, 238);
            this.cbxHienmk.Name = "cbxHienmk";
            this.cbxHienmk.Size = new System.Drawing.Size(109, 17);
            this.cbxHienmk.TabIndex = 2;
            this.cbxHienmk.Text = "Hiển thị mật khẩu";
            this.cbxHienmk.UseVisualStyleBackColor = true;
            // 
            // lkQuenMK
            // 
            this.lkQuenMK.AutoSize = true;
            this.lkQuenMK.Location = new System.Drawing.Point(592, 380);
            this.lkQuenMK.Name = "lkQuenMK";
            this.lkQuenMK.Size = new System.Drawing.Size(80, 13);
            this.lkQuenMK.TabIndex = 4;
            this.lkQuenMK.TabStop = true;
            this.lkQuenMK.Text = "Quên mật khẩu";
            // 
            // llbDky
            // 
            this.llbDky.AutoSize = true;
            this.llbDky.Location = new System.Drawing.Point(668, 413);
            this.llbDky.Name = "llbDky";
            this.llbDky.Size = new System.Drawing.Size(47, 13);
            this.llbDky.TabIndex = 5;
            this.llbDky.TabStop = true;
            this.llbDky.Text = "Đăng ký";
            this.llbDky.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llbDky_LinkClicked);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(551, 413);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(121, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Bạn chưa có tài khoản?";
            // 
            // rdbBanGiamHieu
            // 
            this.rdbBanGiamHieu.AutoSize = true;
            this.rdbBanGiamHieu.Location = new System.Drawing.Point(471, 274);
            this.rdbBanGiamHieu.Name = "rdbBanGiamHieu";
            this.rdbBanGiamHieu.Size = new System.Drawing.Size(92, 17);
            this.rdbBanGiamHieu.TabIndex = 10;
            this.rdbBanGiamHieu.TabStop = true;
            this.rdbBanGiamHieu.Text = "Ban giám hiệu";
            this.rdbBanGiamHieu.UseVisualStyleBackColor = true;
            // 
            // rdbGiaoVien
            // 
            this.rdbGiaoVien.AutoSize = true;
            this.rdbGiaoVien.Location = new System.Drawing.Point(586, 274);
            this.rdbGiaoVien.Name = "rdbGiaoVien";
            this.rdbGiaoVien.Size = new System.Drawing.Size(124, 17);
            this.rdbGiaoVien.TabIndex = 11;
            this.rdbGiaoVien.TabStop = true;
            this.rdbGiaoVien.Text = "Giáo viên/Nhân viên";
            this.rdbGiaoVien.UseVisualStyleBackColor = true;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(732, 274);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(76, 17);
            this.radioButton2.TabIndex = 12;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "Phụ huynh";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // pnAnh
            // 
            this.pnAnh.BackgroundImage = global::DoAn.Properties.Resources.day_care_center_7355025_1280;
            this.pnAnh.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnAnh.Location = new System.Drawing.Point(-2, 5);
            this.pnAnh.Name = "pnAnh";
            this.pnAnh.Size = new System.Drawing.Size(420, 464);
            this.pnAnh.TabIndex = 0;
            // 
            // lbExit
            // 
            this.lbExit.AutoSize = true;
            this.lbExit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.lbExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbExit.Location = new System.Drawing.Point(803, 5);
            this.lbExit.Name = "lbExit";
            this.lbExit.Size = new System.Drawing.Size(20, 20);
            this.lbExit.TabIndex = 14;
            this.lbExit.Text = "X";
            this.lbExit.Click += new System.EventHandler(this.lbExit_Click);
            // 
            // DangNhap
            // 
            this.AcceptButton = this.btnDN;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(834, 466);
            this.Controls.Add(this.lbExit);
            this.Controls.Add(this.radioButton2);
            this.Controls.Add(this.rdbGiaoVien);
            this.Controls.Add(this.rdbBanGiamHieu);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.llbDky);
            this.Controls.Add(this.lkQuenMK);
            this.Controls.Add(this.cbxHienmk);
            this.Controls.Add(this.btnDN);
            this.Controls.Add(this.txtMatkhau);
            this.Controls.Add(this.txtTenDN);
            this.Controls.Add(this.lbMatkhau);
            this.Controls.Add(this.lbEmail);
            this.Controls.Add(this.pnAnh);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "DangNhap";
            this.Text = "Đăng nhập";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Right;
            this.Load += new System.EventHandler(this.DangNhap_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnAnh;
        private System.Windows.Forms.Label lbEmail;
        private System.Windows.Forms.Label lbMatkhau;
        private System.Windows.Forms.TextBox txtTenDN;
        private System.Windows.Forms.TextBox txtMatkhau;
        private MetroFramework.Controls.MetroButton btnDN;
        private System.Windows.Forms.CheckBox cbxHienmk;
        private System.Windows.Forms.LinkLabel lkQuenMK;
        private System.Windows.Forms.LinkLabel llbDky;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.RadioButton rdbBanGiamHieu;
        private System.Windows.Forms.RadioButton rdbGiaoVien;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.Label lbExit;
    }
}


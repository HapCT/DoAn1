namespace DoAn
{
    partial class frmDangky
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
            this.pnAnh = new System.Windows.Forms.Panel();
            this.txtMatkhau = new System.Windows.Forms.TextBox();
            this.lbMatkhau = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lbEmail = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lbXacnhan = new System.Windows.Forms.Label();
            this.btnDK = new MetroFramework.Controls.MetroButton();
            this.lbques = new System.Windows.Forms.Label();
            this.llbDnhap = new System.Windows.Forms.LinkLabel();
            this.lbExit = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // pnAnh
            // 
            this.pnAnh.BackgroundImage = global::DoAn.Properties.Resources.day_care_center_7355025_1280;
            this.pnAnh.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnAnh.Location = new System.Drawing.Point(0, 5);
            this.pnAnh.Name = "pnAnh";
            this.pnAnh.Size = new System.Drawing.Size(420, 464);
            this.pnAnh.TabIndex = 1;
            // 
            // txtMatkhau
            // 
            this.txtMatkhau.Location = new System.Drawing.Point(604, 180);
            this.txtMatkhau.Name = "txtMatkhau";
            this.txtMatkhau.PasswordChar = '*';
            this.txtMatkhau.Size = new System.Drawing.Size(162, 20);
            this.txtMatkhau.TabIndex = 2;
            // 
            // lbMatkhau
            // 
            this.lbMatkhau.AutoSize = true;
            this.lbMatkhau.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMatkhau.Location = new System.Drawing.Point(463, 179);
            this.lbMatkhau.Name = "lbMatkhau";
            this.lbMatkhau.Size = new System.Drawing.Size(69, 18);
            this.lbMatkhau.TabIndex = 6;
            this.lbMatkhau.Text = "Mật khẩu";
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(604, 123);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.PasswordChar = '*';
            this.txtEmail.Size = new System.Drawing.Size(162, 20);
            this.txtEmail.TabIndex = 1;
            // 
            // lbEmail
            // 
            this.lbEmail.AutoSize = true;
            this.lbEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbEmail.Location = new System.Drawing.Point(463, 122);
            this.lbEmail.Name = "lbEmail";
            this.lbEmail.Size = new System.Drawing.Size(45, 18);
            this.lbEmail.TabIndex = 9;
            this.lbEmail.Text = "Email";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(604, 237);
            this.textBox1.Name = "textBox1";
            this.textBox1.PasswordChar = '*';
            this.textBox1.Size = new System.Drawing.Size(162, 20);
            this.textBox1.TabIndex = 3;
            // 
            // lbXacnhan
            // 
            this.lbXacnhan.AutoSize = true;
            this.lbXacnhan.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbXacnhan.Location = new System.Drawing.Point(463, 237);
            this.lbXacnhan.Name = "lbXacnhan";
            this.lbXacnhan.Size = new System.Drawing.Size(135, 18);
            this.lbXacnhan.TabIndex = 11;
            this.lbXacnhan.Text = "Xác nhận mật khẩu";
            this.lbXacnhan.Click += new System.EventHandler(this.lbXacnhan_Click);
            // 
            // btnDK
            // 
            this.btnDK.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDK.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btnDK.Location = new System.Drawing.Point(535, 283);
            this.btnDK.Name = "btnDK";
            this.btnDK.Size = new System.Drawing.Size(168, 45);
            this.btnDK.TabIndex = 4;
            this.btnDK.Text = "Đăng ký";
            this.btnDK.UseSelectable = true;
            // 
            // lbques
            // 
            this.lbques.AutoSize = true;
            this.lbques.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbques.Location = new System.Drawing.Point(532, 349);
            this.lbques.Name = "lbques";
            this.lbques.Size = new System.Drawing.Size(110, 13);
            this.lbques.TabIndex = 13;
            this.lbques.Text = "Bạn đã có tài khoản?";
            // 
            // llbDnhap
            // 
            this.llbDnhap.AutoSize = true;
            this.llbDnhap.Location = new System.Drawing.Point(649, 349);
            this.llbDnhap.Name = "llbDnhap";
            this.llbDnhap.Size = new System.Drawing.Size(60, 13);
            this.llbDnhap.TabIndex = 12;
            this.llbDnhap.TabStop = true;
            this.llbDnhap.Text = "Đăng nhập";
            this.llbDnhap.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llbDnhap_LinkClicked);
            // 
            // lbExit
            // 
            this.lbExit.AutoSize = true;
            this.lbExit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.lbExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbExit.Location = new System.Drawing.Point(802, 5);
            this.lbExit.Name = "lbExit";
            this.lbExit.Size = new System.Drawing.Size(20, 20);
            this.lbExit.TabIndex = 15;
            this.lbExit.Text = "X";
            this.lbExit.Click += new System.EventHandler(this.lbExit_Click);
            // 
            // frmDangky
            // 
            this.AcceptButton = this.btnDK;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(834, 466);
            this.Controls.Add(this.lbExit);
            this.Controls.Add(this.lbques);
            this.Controls.Add(this.llbDnhap);
            this.Controls.Add(this.btnDK);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lbXacnhan);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.lbEmail);
            this.Controls.Add(this.txtMatkhau);
            this.Controls.Add(this.lbMatkhau);
            this.Controls.Add(this.pnAnh);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmDangky";
            this.Text = "Đăng ký";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Right;
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnAnh;
        private System.Windows.Forms.TextBox txtMatkhau;
        private System.Windows.Forms.Label lbMatkhau;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label lbEmail;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label lbXacnhan;
        private MetroFramework.Controls.MetroButton btnDK;
        private System.Windows.Forms.Label lbques;
        private System.Windows.Forms.LinkLabel llbDnhap;
        private System.Windows.Forms.Label lbExit;
    }
}
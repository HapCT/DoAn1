namespace DoAn
{
    partial class HoSo
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
            this.components = new System.ComponentModel.Container();
            this.sidebar = new System.Windows.Forms.Panel();
            this.btnQLchung = new System.Windows.Forms.Button();
            this.btnTracuu = new System.Windows.Forms.Button();
            this.menuContainer = new System.Windows.Forms.FlowLayoutPanel();
            this.btnGV = new System.Windows.Forms.Button();
            this.btnHS = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.btnDxuat = new System.Windows.Forms.Button();
            this.menuTransation = new System.Windows.Forms.Timer(this.components);
            this.sidebar.SuspendLayout();
            this.menuContainer.SuspendLayout();
            this.SuspendLayout();
            // 
            // sidebar
            // 
            this.sidebar.Controls.Add(this.btnQLchung);
            this.sidebar.Controls.Add(this.btnTracuu);
            this.sidebar.Controls.Add(this.menuContainer);
            this.sidebar.Controls.Add(this.btnDxuat);
            this.sidebar.Dock = System.Windows.Forms.DockStyle.Left;
            this.sidebar.Location = new System.Drawing.Point(0, 0);
            this.sidebar.Name = "sidebar";
            this.sidebar.Size = new System.Drawing.Size(200, 674);
            this.sidebar.TabIndex = 0;
            // 
            // btnQLchung
            // 
            this.btnQLchung.Location = new System.Drawing.Point(3, 79);
            this.btnQLchung.Name = "btnQLchung";
            this.btnQLchung.Size = new System.Drawing.Size(194, 38);
            this.btnQLchung.TabIndex = 1;
            this.btnQLchung.Text = "Quản lý chung";
            this.btnQLchung.UseVisualStyleBackColor = true;
            this.btnQLchung.Click += new System.EventHandler(this.btnQLchung_Click_1);
            // 
            // btnTracuu
            // 
            this.btnTracuu.Location = new System.Drawing.Point(3, 126);
            this.btnTracuu.Name = "btnTracuu";
            this.btnTracuu.Size = new System.Drawing.Size(194, 41);
            this.btnTracuu.TabIndex = 2;
            this.btnTracuu.Text = "Thông tin đã xóa";
            this.btnTracuu.UseVisualStyleBackColor = true;
            // 
            // menuContainer
            // 
            this.menuContainer.Controls.Add(this.btnGV);
            this.menuContainer.Controls.Add(this.btnHS);
            this.menuContainer.Controls.Add(this.button1);
            this.menuContainer.Location = new System.Drawing.Point(0, 76);
            this.menuContainer.Name = "menuContainer";
            this.menuContainer.Size = new System.Drawing.Size(197, 41);
            this.menuContainer.TabIndex = 1;
            // 
            // btnGV
            // 
            this.btnGV.Location = new System.Drawing.Point(3, 3);
            this.btnGV.Name = "btnGV";
            this.btnGV.Size = new System.Drawing.Size(194, 41);
            this.btnGV.TabIndex = 2;
            this.btnGV.Text = "Giáo viên và Nhân viên";
            this.btnGV.UseVisualStyleBackColor = true;
            // 
            // btnHS
            // 
            this.btnHS.Location = new System.Drawing.Point(3, 50);
            this.btnHS.Name = "btnHS";
            this.btnHS.Size = new System.Drawing.Size(194, 41);
            this.btnHS.TabIndex = 3;
            this.btnHS.Text = "Học sinh";
            this.btnHS.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(3, 97);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(194, 38);
            this.button1.TabIndex = 4;
            this.button1.Text = "Tài chính";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btnDxuat
            // 
            this.btnDxuat.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnDxuat.Location = new System.Drawing.Point(0, 633);
            this.btnDxuat.Name = "btnDxuat";
            this.btnDxuat.Size = new System.Drawing.Size(200, 41);
            this.btnDxuat.TabIndex = 2;
            this.btnDxuat.Text = "Đăng xuất";
            this.btnDxuat.UseVisualStyleBackColor = true;
            // 
            // menuTransation
            // 
            this.menuTransation.Interval = 10;
            this.menuTransation.Tick += new System.EventHandler(this.menuTransation_Tick);
            // 
            // HoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1250, 674);
            this.Controls.Add(this.sidebar);
            this.Name = "HoSo";
            this.Text = "Hồ sơ ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.HoSo_Load);
            this.sidebar.ResumeLayout(false);
            this.menuContainer.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel sidebar;
        private System.Windows.Forms.Button btnQLchung;
        private System.Windows.Forms.Button btnDxuat;
        private System.Windows.Forms.FlowLayoutPanel menuContainer;
        private System.Windows.Forms.Button btnGV;
        private System.Windows.Forms.Button btnHS;
        private System.Windows.Forms.Button btnTracuu;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Timer menuTransation;
    }
}
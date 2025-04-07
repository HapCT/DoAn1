using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;  
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn
{
    public partial class frmDangky : MetroFramework.Forms.MetroForm
    {
        public frmDangky()
        {
            InitializeComponent();
            this.FormBorderStyle = FormBorderStyle.None; // Ẩn viền Form mặc định
            this.BackColor = Color.Lime; // Đặt màu nền đặc biệt
            this.TransparencyKey = Color.Lime; // Làm trong suốt vùng nền
            this.DoubleBuffered = true; // Bật Double Buffering để tránh flickering
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            int radius = 30; // Độ bo góc, có thể chỉnh sửa nhỏ hơn hoặc lớn hơn
            GraphicsPath path = new GraphicsPath();

            // Bo tròn nhẹ 4 góc
            path.AddArc(0, 0, radius, radius, 180, 90);
            path.AddArc(this.Width - radius, 0, radius, radius, 270, 90);
            path.AddArc(this.Width - radius, this.Height - radius, radius, radius, 0, 90);
            path.AddArc(0, this.Height - radius, radius, radius, 90, 90);
            path.CloseFigure();

            this.Region = new Region(path);
        }

        private void lbXacnhan_Click(object sender, EventArgs e)
        {

        }

        private void llbDnhap_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            DangNhap dangNhap = new DangNhap();
            dangNhap.Show();
            this.Hide();
        }

        private void lbExit_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }
    }
}

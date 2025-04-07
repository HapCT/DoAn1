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
    public partial class HoSo : Form
    {
        public HoSo()
        {
            InitializeComponent();
        }

        private void HoSo_Load(object sender, EventArgs e)
        {
            ApplyBorderStyle(this);
        }
        private void ApplyBorderStyle(Control parent)
        {
            foreach (Control ctrl in parent.Controls)
            {
                if (ctrl is Button btn)
                {
                    RemoveButtonBorder(btn);
                }
                else if (ctrl.HasChildren) // Nếu có container khác như Panel, GroupBox
                {
                    ApplyBorderStyle(ctrl);
                }
            }
        }
        private void RemoveButtonBorder(Button btn)
        {
            btn.FlatStyle = FlatStyle.Flat;
            btn.FlatAppearance.BorderSize = 0;
        }


        private void btnQlchung_Click(object sender, EventArgs e)
        {

        }
        bool menuExpand = false;
        private void menuTransation_Tick(object sender, EventArgs e)
        {
            if (menuExpand = false)
            {
                menuContainer.Height += 10;
                if (menuContainer.Height >= 192)
                {
                    menuTransation.Stop();
                    menuExpand = true;
                }
            }
            else
            {
                menuContainer.Height -= 10;
                if(menuContainer.Height <= 41)
                {
                    menuTransation.Stop();
                    menuExpand = false;
                }    
            }
        }

        private void btnQLchung_Click_1(object sender, EventArgs e)
        {
            menuTransation.Start();
        }

        
    }
}

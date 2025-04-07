using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn
{
    internal class BLL
    {
        DAL dal = new DAL();
        //Lấy dữ liệu để đăng nhập 
        public DataTable LayDuLieutubangGiaoVien(string SQL)
        {
            DataTable dt = dal.GetDataTable(SQL);
            return dt;
        }
        //Thêm Học Sinh
        public void ThemHocSinh( string id, string hoten, string ngaysinh, int lophocid, int phuhuynhid, int truongid, string TrangthaiDD, string DkyAnBanTru)
        {
            string cmdText = "insert into HocSinh values ('" + id + "','" + hoten + "','" + ngaysinh + "','" + lophocid + "','" + phuhuynhid + "','" + truongid + "','" + TrangthaiDD + "','" + DkyAnBanTru +"')";
        }
        //Xóa Học Sinh
        public void XoaHocSinh(string id)
        {
            string cmdText = "delete HocSinh where id = '"+id+"'";
            dal.GetSqlCommand(cmdText);
        }
    }
}

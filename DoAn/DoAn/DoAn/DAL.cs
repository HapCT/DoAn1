using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn
{
    class DAL
    {
        private string connectString = "Data Source=CAMCHIN_CHIN;Initial Catalog=TruongMamNonBinhMinh;IntegratedSecurity=True;TrustServer Certificate=True";
        public SqlConnection GetConnect()
        {
            return new SqlConnection(connectString);
        }
        public DataTable GetDataTable(string cmdText)
        {
            SqlConnection cnt = GetConnect();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmdText, cnt);
            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);
            return dt;
        }
        public void GetSqlCommand(string cmdText)
        {
            SqlConnection cnt = GetConnect();
            cnt.Open();
            SqlCommand command = new SqlCommand(cmdText, cnt);
            command.ExecuteNonQuery();
            cnt.Close();
        }
        
    
    }
}

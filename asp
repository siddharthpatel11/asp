using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con=new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\patel\OneDrive\Documents\newdata.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        private void show()
        {
            string sql = "select * from newdata";
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void save_Click(object sender, EventArgs e)
        {
            string sql = "insert into newdata values('"+ uname.Text +"','"+ email.Text +"','"+ password.Text +"')";
            SqlDataAdapter da = new SqlDataAdapter(sql,con);    
            DataTable dt = new DataTable();
            da.Fill(dt);
            show();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string sql = "update newdata set uname='"+ uname.Text +"',email='"+ email.Text +"',password='"+ password.Text +"'";
            SqlDataAdapter da=new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            show();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            string sql="delete from newdata where uname='"+uname.Text+"',email='"+ email.Text +"',password='"+ password.Text +"'";
            SqlDataAdapter da=new SqlDataAdapter(sql,con);
            DataTable dt=new DataTable();
            da.Fill(dt);
            show();
            
        }
        private void cl()
        {
            uname.Text= email.Text=password.Text=string.Empty;
            Focus();
        }
    }
}    

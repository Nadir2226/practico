using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practico
{
    public partial class GestionarCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                actualizarLabel();
        }
        protected void actualizarLabel()
        {
            Label3.Text = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                Label3.Text += row["descripcion"].ToString() + " - ";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Insert();
            if (result != 0)
            {
                Label2.Text = "Se ha agregado" + result.ToString() + "cuenta";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else
            {
                Label2.Text = "No se agregaron cuentas";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                Label2.Text = "Se ha eliminado" + result.ToString() + "cuenta";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else
            {
                Label2.Text = "No se eliminaron cuentas";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["idCuenta"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
            int result = SqlDataSource1.Update();
            if (result != 0)
            {
                Label2.Text = "Se ha modificado" + result.ToString() + "registros";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else
            {
                Label2.Text = "No se modificaron los elementos";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
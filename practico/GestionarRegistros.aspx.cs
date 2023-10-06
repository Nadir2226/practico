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
    public partial class GestionarRegistros : System.Web.UI.Page
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
            SqlDataSource2.InsertParameters["idCuenta"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSource2.InsertParameters["monto"].DefaultValue = TextBox1.Text;
           
            int result = SqlDataSource2.Insert();
            if (result != 0)
            {
                Label2.Text = "Agregado" + result.ToString() + "registro";
                actualizarLabel();
                TextBox1.Text = string.Empty; 
            }
            else
            {
                Label2.Text = "No se agregaron registros";
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                DropDownList1.SelectedValue = row["idCuenta"].ToString();
                TextBox1.Text = row["monto"].ToString();
              
            }
          actualizarLabel();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            int result = SqlDataSource2.Update();
            if (result != 0)
            {
                Label2.Text = "Actualizado" + result.ToString() + "registro";
                actualizarLabel();
                TextBox1.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se actualizaron los registros";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource2.Delete();
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
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CelikelProject
{
    public partial class DataGraphic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sayfa yüklendiğinde DataTable'ı oluşturdum ve bir "ViewState" değişkenine atadım.
            if (!IsPostBack)
            {
                
                DataTable dataTable = new DataTable();
                dataTable.Columns.Add("Kategori", typeof(string));
                dataTable.Columns.Add("Stok", typeof(int)); 

                dataTable.Rows.Add("Silaj Makineleri", 100);
                dataTable.Rows.Add("Yem Karma Makineleri", 80);
                dataTable.Rows.Add("Gübre Yönetim Makineleri", 45);
                dataTable.Rows.Add("Balya Makineleri", 20);
                dataTable.Rows.Add("Paketleme Makineleri", 66);

                ViewState["ChartData"] = dataTable;
            }
        }

        public string GetChartData() // Bu metodda  oluşturduğumuz verileri json formatına çevirerek javascript tarafına gönderilir.
        {
            DataTable dataTable = (DataTable)ViewState["ChartData"];
            var chartData = new
            {
                labels = dataTable.AsEnumerable().Select(row => row["Kategori"]).ToArray(),
                values = dataTable.AsEnumerable().Select(row => row["Stok"]).ToArray()
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(chartData);
        }

    }
}
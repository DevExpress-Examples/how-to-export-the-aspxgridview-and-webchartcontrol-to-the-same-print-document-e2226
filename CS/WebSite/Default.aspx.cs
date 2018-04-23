using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView.Export.Helper;
using DevExpress.XtraCharts;
using DevExpress.XtraPrinting;
using System.IO;
using DevExpress.XtraPrintingLinks;
using DevExpress.XtraCharts.Native;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebChartControl1.DataSourceID = "AccessDataSource1";
        WebChartControl1.SeriesDataMember = "CategoryName";
        WebChartControl1.SeriesTemplate.ArgumentDataMember = "ProductSales";
        WebChartControl1.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "ProductSales" });
        WebChartControl1.SeriesTemplate.View = new StackedBarSeriesView();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridViewLink link1 = new GridViewLink(gridExporter);
        PrintingSystem ps = link1.CreatePS();

        PrintableComponentLink link2 = new PrintableComponentLink();
        WebChartControl1.DataBind();
        link2.Component = ((IChartContainer)WebChartControl1).Chart;
        link2.PrintingSystem = ps;

        CompositeLink compositeLink = new CompositeLink();
        compositeLink.Links.AddRange(new object[] { link1, link2 });
        compositeLink.PrintingSystem = ps;

        compositeLink.CreateDocument();
        using (MemoryStream stream = new MemoryStream())
        {
            compositeLink.PrintingSystem.ExportToXls(stream);
            Response.Clear();
            Response.Buffer = false;
            Response.AppendHeader("Content-Type", "application/xls");
            Response.AppendHeader("Content-Transfer-Encoding", "binary");
            Response.AppendHeader("Content-Disposition", "attachment; filename=test.xls");
            Response.BinaryWrite(stream.GetBuffer());
            Response.End();
        }

        ps.Dispose();

    }

}
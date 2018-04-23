using System;
using System.IO;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Native;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrintingLinks;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        Chart.SeriesDataMember = "CategoryName";
        Chart.SeriesTemplate.ArgumentDataMember = "ProductSales";
        Chart.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "ProductSales" });
        Chart.SeriesTemplate.View = new StackedBarSeriesView();
    }
    protected void ExportButton_Click(object sender, EventArgs e) {
        PrintingSystem ps = new PrintingSystem();

        PrintableComponentLink link1 = new PrintableComponentLink(ps);
        link1.Component = GridExporter;

        PrintableComponentLink link2 = new PrintableComponentLink(ps);
        Chart.DataBind();
        link2.Component = ((IChartContainer)Chart).Chart;

        CompositeLink compositeLink = new CompositeLink(ps);
        compositeLink.Links.AddRange(new object[] { link1, link2 });

        compositeLink.CreateDocument();
        using(MemoryStream stream = new MemoryStream()) {
            compositeLink.PrintingSystem.ExportToXls(stream);
            Response.Clear();
            Response.Buffer = false;
            Response.AppendHeader("Content-Type", "application/xls");
            Response.AppendHeader("Content-Transfer-Encoding", "binary");
            Response.AppendHeader("Content-Disposition", "attachment; filename=test.xls");
            Response.BinaryWrite(stream.ToArray());
            Response.End();
        }
        ps.Dispose();
    }
}
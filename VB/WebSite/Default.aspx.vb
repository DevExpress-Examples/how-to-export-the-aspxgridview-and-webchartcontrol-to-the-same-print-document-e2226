Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView.Export.Helper
Imports DevExpress.XtraCharts
Imports DevExpress.XtraPrinting
Imports System.IO
Imports DevExpress.XtraPrintingLinks
Imports DevExpress.XtraCharts.Native

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		WebChartControl1.DataSourceID = "AccessDataSource1"
		WebChartControl1.SeriesDataMember = "CategoryName"
		WebChartControl1.SeriesTemplate.ArgumentDataMember = "ProductSales"
		WebChartControl1.SeriesTemplate.ValueDataMembers.AddRange(New String() { "ProductSales" })
		WebChartControl1.SeriesTemplate.View = New StackedBarSeriesView()

	End Sub

	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim link1 As New GridViewLink(gridExporter)
		Dim ps As PrintingSystem = link1.CreatePS()

		Dim link2 As New PrintableComponentLink()
		WebChartControl1.DataBind()
		link2.Component = (CType(WebChartControl1, IChartContainer)).Chart
		link2.PrintingSystem = ps

		Dim compositeLink As New CompositeLink()
		compositeLink.Links.AddRange(New Object() { link1, link2 })
		compositeLink.PrintingSystem = ps

		compositeLink.CreateDocument()
		Using stream As New MemoryStream()
			compositeLink.PrintingSystem.ExportToXls(stream)
			Response.Clear()
			Response.Buffer = False
			Response.AppendHeader("Content-Type", "application/xls")
			Response.AppendHeader("Content-Transfer-Encoding", "binary")
			Response.AppendHeader("Content-Disposition", "attachment; filename=test.xls")
			Response.BinaryWrite(stream.GetBuffer())
			Response.End()
		End Using

		ps.Dispose()

	End Sub

End Class
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.XtraCharts.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v9.3.Web, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v9.3.Export, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v9.3.Export, Version=9.3.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraPivotGrid.Web" TagPrefix="dxpgw" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Export" />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryName], [ProductSales] FROM [ProductReports]"></asp:AccessDataSource>
        <dx:ASPxGridView ID="grid" runat="server" 
            DataSourceID="AccessDataSource1" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductSales" ReadOnly="True" 
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        
        <dx:ASPxGridViewExporter ID="gridExporter" runat="server" GridViewID="grid">
        </dx:ASPxGridViewExporter>
        
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Height="366px" Width="513px">
            <SeriesTemplate LabelTypeName="SideBySideBarSeriesLabel" PointOptionsTypeName="PointOptions"
                SeriesViewTypeName="SideBySideBarSeriesView">
                <View HiddenSerializableString="to be serialized">
                </View>
                <Label HiddenSerializableString="to be serialized" LineVisible="True" >
                    <FillStyle FillOptionsTypeName="SolidFillOptions">
                        <Options HiddenSerializableString="to be serialized" />
                    </FillStyle>
                </Label>
                <PointOptions HiddenSerializableString="to be serialized">
                </PointOptions>
                <LegendPointOptions HiddenSerializableString="to be serialized">
                </LegendPointOptions>
            </SeriesTemplate>
            <FillStyle FillOptionsTypeName="SolidFillOptions">
                <Options HiddenSerializableString="to be serialized" />
            </FillStyle>
        </dxchartsui:WebChartControl>
    </div>
    </form>
</body>
</html>

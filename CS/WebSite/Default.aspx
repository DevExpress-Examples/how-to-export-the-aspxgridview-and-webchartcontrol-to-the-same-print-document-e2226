﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2, Version=12.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxButton ID="ExportButton" runat="server" Text="Export" OnClick="ExportButton_Click" />
    <dx:ASPxGridView ID="Grid" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="0" />
            <dx:GridViewDataTextColumn FieldName="ProductSales" VisibleIndex="1" />
        </Columns>
    </dx:ASPxGridView>
    <dx:ASPxGridViewExporter ID="GridExporter" runat="server" GridViewID="grid" />
    <dx:WebChartControl ID="Chart" runat="server" DataSourceID="AccessDataSource1" Width="500px"
        Height="300px">
    </dx:WebChartControl>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT TOP 20 [CategoryName], [ProductSales] FROM [ProductReports]" />
    </form>
</body>
</html>

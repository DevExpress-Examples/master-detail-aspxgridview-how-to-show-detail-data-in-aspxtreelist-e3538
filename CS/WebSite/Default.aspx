﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v11.1, Version=11.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
            KeyFieldName="ID">
            <Templates>
                <DetailRow>
                    <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False"
                        DataSourceID="AccessDataSource1" KeyFieldName="ID" OnInit="ASPxTreeList1_Init"
                        ParentFieldName="PARENTID">
                        <Columns>
                            <dx:TreeListTextColumn FieldName="DEPARTMENT" VisibleIndex="0">
                            </dx:TreeListTextColumn>
                        </Columns>
                    </dx:ASPxTreeList>
                </DetailRow>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PARENTID" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEPARTMENT" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsDetail ShowDetailRow="True" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Departments.mdb"
            DeleteCommand="DELETE FROM [Departments] WHERE (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL))"
            InsertCommand="INSERT INTO [Departments] ([ID], [PARENTID], [DEPARTMENT]) VALUES (?, ?, ?)"
            SelectCommand="SELECT [ID], [PARENTID], [DEPARTMENT] FROM [Departments]" UpdateCommand="UPDATE [Departments] SET [PARENTID] = ?, [DEPARTMENT] = ? WHERE (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Double" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="PARENTID" Type="Double" />
                <asp:Parameter Name="DEPARTMENT" Type="String" />
                <asp:Parameter Name="ID" Type="Double" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Double" />
                <asp:Parameter Name="PARENTID" Type="Double" />
                <asp:Parameter Name="DEPARTMENT" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>

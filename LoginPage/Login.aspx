<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginPage.Login" %>

<!DOCTYPE html>

<script runat="server">

 private void OnDSUpdatedHandler(Object source, SqlDataSourceStatusEventArgs e) {
    if (e.AffectedRows > 0) {
        // Perform any additional processing, such as sending an email notification.
        Label1.Text = Request.LogonUserIdentity.Name +
            " changed user information successfully!";
    }
    else {
        Label1.Text = "No data updated!";
    }
 }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 57px; width: 1191px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
            <asp:SqlDataSource ID="SqlOwnerDetail" runat="server" ConnectionString="<%$ ConnectionStrings:Test_dbConnectionString %>" 
                SelectCommand="SELECT * FROM [tealeaf_ownerdtl] WHERE [Code] IS NOT NULL"
                DeleteCommand="DELETE FROM [tealeaf_ownerdtl] WHERE [Sno] = @Sno"
                InsertCommand="INSERT INTO [tealeaf_ownerdtl] ([PartNo], [Code], [Buydate], [Leaseenddate], [Ownername], [Phonenumber], [Leaseamt]) VALUES (@PartNo, @Code, @Buydate, @Leaseenddate, @Ownername, @Phonenumber,@Leaseamt)"
                UpdateCommand="UPDATE [tealeaf_ownerdtl] SET [PartNo] = @PartNo, [Code] = @Code, [Buydate] = @Buydate, [Leaseenddate] = @Leaseenddate, [Ownername] = @Ownername, [Phonenumber] = @Phonenumber, [Leaseamt] = @Leaseamt  WHERE [Sno] = @Sno"
                 OnUpdated ="OnDSUpdatedHandler" >
                    <DeleteParameters>
                    <asp:Parameter Name="Sno" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                    <asp:Parameter Name="PartNo" Type="Int32" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter DbType="Date" Name="Buydate" />
                    <asp:Parameter DbType="Date" Name="Leaseenddate" />
                    <asp:Parameter Name="Phonenumber" Type="Int32" />
                    <asp:Parameter Name="Leaseamt" Type="Int32" />
                    <asp:Parameter Name="Ownername" Type="String" />
                    <asp:Parameter Name="Sno" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                    <asp:Parameter Name="PartNo" Type="Int32" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter DbType="Date" Name="Buydate" />
                    <asp:Parameter DbType="Date" Name="Leaseenddate" />
                    <asp:Parameter Name="Phonenumber" Type="Int32" />
                    <asp:Parameter Name="Leaseamt" Type="Int32" />
                    <asp:Parameter Name="Ownername" Type="String" />
                    <asp:Parameter Name="Sno" Type="Int32" />
                    </UpdateParameters>

            </asp:SqlDataSource>
            <strong>
            <br />
            Owner Details </strong>
            <br />
            <asp:GridView ID="GridView2" runat="server"  DataKeyNames="Sno"  AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowUpdated="GridView2_RowUpdated" OnRowUpdating="GridView2_RowUpdating" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlOwnerDetail" EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCFF99" ForeColor="#000066" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="S.no." InsertVisible="False" ReadOnly="True" SortExpression="sno">
                    </asp:BoundField>
                    <asp:BoundField DataField="PartNo" HeaderText="Part" SortExpression="PartNo">
                    </asp:BoundField>
                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                    <asp:BoundField DataField="Buydate" HeaderText="Buy Date" SortExpression="Buydate" DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="Leaseenddate" HeaderText="Lease End Date" SortExpression="Leaseenddate" DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="Ownername" HeaderText="Owner Name" SortExpression="Ownername">
                    </asp:BoundField>
                    <asp:BoundField DataField="Phonenumber" HeaderText="Phone Number" SortExpression="Phonenumber" />
                    <asp:BoundField DataField="Leaseamt" HeaderText="Lease Amount" SortExpression="Leaseamt" />
                </Columns>
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Fuchsia" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlLeafDetail" runat="server" ConnectionString="<%$ ConnectionStrings:Test_dbConnectionString %>" SelectCommand="SELECT * FROM [tealeaf_log]" DeleteCommand="DELETE FROM [tealeaf_log] WHERE [Sno] = @Sno" InsertCommand="INSERT INTO [tealeaf_log] ([Stage], [Part], [DATE], [QUANTITY], [RATE], [TOTAL], [NumberOfWorkers], [LabourCharge], [ShippingCharge], [OtherExpenses], [OWNERNAME]) VALUES (@Stage, @Part, @DATE, @QUANTITY, @RATE, @TOTAL, @NumberOfWorkers, @LabourCharge, @ShippingCharge, @OtherExpenses, @OWNERNAME)" UpdateCommand="UPDATE [tealeaf_log] SET [Stage] = @Stage, [Part] = @Part, [DATE] = @DATE, [QUANTITY] = @QUANTITY, [RATE] = @RATE, [TOTAL] = @TOTAL, [NumberOfWorkers] = @NumberOfWorkers, [LabourCharge] = @LabourCharge, [ShippingCharge] = @ShippingCharge, [OtherExpenses] = @OtherExpenses, [OWNERNAME] = @OWNERNAME WHERE [Sno] = @Sno" OnUpdated ="OnDSUpdatedHandler">
            <DeleteParameters>
                <asp:Parameter Name="Sno" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Stage" Type="String" />
                <asp:Parameter Name="Part" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DATE" />
                <asp:Parameter Name="QUANTITY" Type="Int32" />
                <asp:Parameter Name="RATE" Type="Double" />
                <asp:Parameter Name="TOTAL" Type="Double" />
                <asp:Parameter Name="NumberOfWorkers" Type="Int32" />
                <asp:Parameter Name="LabourCharge" Type="Double" />
                <asp:Parameter Name="ShippingCharge" Type="Double" />
                <asp:Parameter Name="OtherExpenses" Type="Int32" />
                <asp:Parameter Name="OWNERNAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Stage" Type="String" />
                <asp:Parameter Name="Part" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DATE" />
                <asp:Parameter Name="QUANTITY" Type="Int32" />
                <asp:Parameter Name="RATE" Type="Double" />
                <asp:Parameter Name="TOTAL" Type="Double" />
                <asp:Parameter Name="NumberOfWorkers" Type="Int32" />
                <asp:Parameter Name="LabourCharge" Type="Double" />
                <asp:Parameter Name="ShippingCharge" Type="Double" />
                <asp:Parameter Name="OtherExpenses" Type="Int32" />
                <asp:Parameter Name="OWNERNAME" Type="String" />
                <asp:Parameter Name="Sno" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        Tea Leaf Details<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Sno" DataSourceID="SqlLeafDetail" GridLines="Horizontal" PageSize="5">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Sno" HeaderText="S.no." SortExpression="Sno" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Stage" HeaderText="Stage" SortExpression="Stage" />
                <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" />
                <asp:BoundField DataField="DATE" HeaderText="Date" SortExpression="DATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="QUANTITY" HeaderText="Quantity" SortExpression="QUANTITY" />
                <asp:BoundField DataField="RATE" HeaderText="Rate" SortExpression="RATE" />
                <asp:BoundField DataField="TOTAL" HeaderText="Total" SortExpression="TOTAL" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="NumberOfWorkers" HeaderText="Number Of Workers" SortExpression="NumberOfWorkers" />
                <asp:BoundField DataField="LabourCharge" HeaderText="Labour Charge" SortExpression="LabourCharge" />
                <asp:BoundField DataField="ShippingCharge" HeaderText="Shipping Charge" SortExpression="ShippingCharge" DataFormatString="{0:.00}" />
                <asp:BoundField DataField="OtherExpenses" HeaderText="Other Expenses" SortExpression="OtherExpenses" />
                <asp:BoundField DataField="OWNERNAME" HeaderText="Owner Name" SortExpression="OWNERNAME" />
                <asp:TemplateField HeaderText="Owner Name" SortExpression="OWNERNAME">
                <ItemTemplate>
                    <%# Eval("OWNERNAME").ToString().ToLower() %>
                </ItemTemplate>
            </asp:TemplateField>

            </Columns>
            <EditRowStyle HorizontalAlign="Center" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerSettings Mode="NextPrevious" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" BorderStyle="Solid" BorderWidth="1px" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="Fuchsia" Font-Bold="True" ForeColor="#000066" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </form>
</body>
</html>

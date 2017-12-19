<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrackRegistrations.aspx.cs" Inherits="MAT2_Practicum.TrackRegistrations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"  AutoPostback="True">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
            <asp:CheckBoxField DataField="Cancelled" HeaderText="Cancelled" SortExpression="Cancelled" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Registrants]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Registrants] WHERE [ID] = ? AND (([StudentID] = ?) OR ([StudentID] IS NULL AND ? IS NULL)) AND (([CourseCode] = ?) OR ([CourseCode] IS NULL AND ? IS NULL)) AND [Cancelled] = ?" 
        InsertCommand="INSERT INTO [Registrants] ([ID], [StudentID], [CourseCode], [Cancelled]) VALUES (?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Registrants] WHERE ([ID] = ?)" 
        UpdateCommand="UPDATE [Registrants] SET [StudentID] = ?, [CourseCode] = ?, [Cancelled] = ? WHERE [ID] = ? AND (([StudentID] = ?) OR ([StudentID] IS NULL AND ? IS NULL)) AND (([CourseCode] = ?) OR ([CourseCode] IS NULL AND ? IS NULL)) AND [Cancelled] = ?">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="Int32" />
            <asp:Parameter Name="original_CourseCode" Type="String" />
            <asp:Parameter Name="original_CourseCode" Type="String" />
            <asp:Parameter Name="original_Cancelled" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="CourseCode" Type="String" />
            <asp:Parameter Name="Cancelled" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="CourseCode" Type="String" />
            <asp:Parameter Name="Cancelled" Type="Boolean" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="Int32" />
            <asp:Parameter Name="original_CourseCode" Type="String" />
            <asp:Parameter Name="original_CourseCode" Type="String" />
            <asp:Parameter Name="original_Cancelled" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" Height="50px" Width="125px"  AutoPostback="True">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
            <asp:CheckBoxField DataField="Cancelled" HeaderText="Cancelled" SortExpression="Cancelled" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:Label ID="testLabel" runat="server"></asp:Label>

</asp:Content>
 
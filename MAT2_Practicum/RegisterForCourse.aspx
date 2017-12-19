<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterForCourse.aspx.cs" Inherits="MAT2_Practicum.RegisterForCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="StudentID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [StudentID], [UserName] FROM [Students]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="CourseCode">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Registrants] WHERE [ID] = ? AND (([StudentID] = ?) OR ([StudentID] IS NULL AND ? IS NULL)) AND (([CourseCode] = ?) OR ([CourseCode] IS NULL AND ? IS NULL)) AND [Cancelled] = ?" 
        InsertCommand="INSERT INTO [Registrants] ([StudentID], [CourseCode], [Cancelled]) VALUES (?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Registrants] WHERE (([StudentID] = ?) AND ([CourseCode] = ?))" 
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
           <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="LIT101" Name="CourseCode" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="Cancelled" Type="Boolean" DefaultValue="False"/>
            
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="LIT101" Name="CourseCode" PropertyName="SelectedValue" Type="String" />
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
    <asp:Button ID="Button1" runat="server" Text="Register" AutoPostback="true" OnClick="Button1_Click"/>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
</asp:Content>

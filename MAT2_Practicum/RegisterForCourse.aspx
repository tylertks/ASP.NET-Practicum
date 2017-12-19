<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterForCourse.aspx.cs" Inherits="MAT2_Practicum.RegisterForCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <div class="row">
    Select a Student:&nbsp;&nbsp;&nbsp;    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="StudentID">
    </asp:DropDownList>
            </div>
        <br />
       <div class ="row">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [StudentID], [UserName] FROM [Students]"></asp:SqlDataSource>
    Select a Class:&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="CourseCode">
    </asp:DropDownList>
           </div>
        <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Registrants] WHERE [ID] = ? AND (([StudentID] = ?) OR ([StudentID] IS NULL AND ? IS NULL)) AND (([CourseCode] = ?) OR ([CourseCode] IS NULL AND ? IS NULL)) AND [Cancelled] = ?" 
        InsertCommand="INSERT INTO [Registrants] ([StudentID], [CourseCode], [Cancelled]) VALUES (?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Registrants] WHERE (([StudentID] = ?) AND ([CourseCode] = ?))" 
        UpdateCommand="UPDATE [Registrants] SET [Cancelled] = False WHERE [StudentID] = @StudentID AND [CourseCode] = @CourseCode">
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
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="LIT101" Name="CourseCode" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="Cancelled" Type="Boolean" />
            
            
        </UpdateParameters>
    </asp:SqlDataSource>
        <div class ="row">
    Regester Student into class:&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Register" AutoPostback="true" OnClick="Button1_Click"/>
            </div>
                    <br />
        <div class="row">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
            <asp:CheckBoxField DataField="Cancelled" HeaderText="Cancelled" SortExpression="Cancelled" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
    <asp:Label ID="Label1"   runat="server"></asp:Label>
        </div>
        </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MAT2_Practicum.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron text-center">
        <h1>Login</h1>
        <p>Username:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>Password:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Font-Size="Small" Height="22px" OnClick="Button3_Click" Text="Create New User" Width="137px" />
        </p>
        
        
    </div>

    <p>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div>
            <div class="text-center">
        Register a Student:<p>
        First Name:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <p>
        Last Name:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <p>
        Username:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <p>
        Password:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [FirstName], [LastName], [Password], [UserName] FROM [Students] WHERE [UserName] = @Username"
            InsertCommand="INSERT INTO [Students] ([FirstName], [LastName], [UserName], [Password]) VALUES (@FirstName, @LastName, @Username, @Password)">
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Type="String"  Name="FirstName"/>
                <asp:ControlParameter ControlID="TextBox2" Type="String" Name="LastName" />
                <asp:ControlParameter ControlID="TextBox3" Type="String" Name="Username" />
                <asp:ControlParameter ControlID="TextBox4" Type="String" Name="Password" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox3" Type="String" Name="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [UserName], [Password] FROM [Students] WHERE ([UserName] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox5" Name="UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
            </div>
            </asp:Panel>
</asp:Content>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompanyManip.ascx.cs" Inherits="Controls_CompanyManip" %>
<asp:ObjectDataSource ID="odsCompany" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetCompanies" 
    TypeName="dsCompaniesTableAdapters.PSP_OrganizationsTableAdapter" 
    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_Organization_ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserLogin" Type="String" />
        <asp:Parameter Name="HeadFullName" Type="String" />
        <asp:Parameter Name="ProfGroup_ID" Type="Int32" />
        <asp:Parameter Name="WorkerQuantity" Type="Int32" />
        <asp:Parameter Name="CompanyAge" Type="Int32" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Phones" Type="String" />
        <asp:Parameter Name="Adress" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Original_Organization_ID" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="Organization_ID" 
            QueryStringField="Organization_ID" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="UserLogin" Type="String" />
        <asp:Parameter Name="HeadFullName" Type="String" />
        <asp:Parameter Name="ProfGroup_ID" Type="Int32" />
        <asp:Parameter Name="WorkerQuantity" Type="Int32" />
        <asp:Parameter Name="CompanyAge" Type="Int32" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Phones" Type="String" />
        <asp:Parameter Name="Adress" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:FormView ID="fvCompanyManip" runat="server" DataKeyNames="Organization_ID" 
    DataSourceID="odsCompany" CellPadding="4" ForeColor="#333333" 
    Width="238px">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <EditItemTemplate>
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Обновить" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        
        <table CellPadding="2" CellSpacing="2" Border="0">
  <tr>
    <td>
        
        Название компании</td>
    <td>
        <asp:TextBox ID="OrgNameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="345px" 
            ></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td>
      Основной вид деятельности компании
    </td>
    <td>
        <asp:DropDownList ID="ddlOrgProfType" runat="server" DataSourceID="sdsProfGroup" 
            DataTextField="Name" DataValueField="ProfGroup_ID" Height="21px" 
            Width="345px">
        </asp:DropDownList>
    </td>
  </tr>
  <tr>
    <td>
      Руководитель компании
    </td>
    <td>
        <asp:TextBox ID="HeadNameTextBox" runat="server" Text='<%# Bind("HeadFullName") %>' Width="345px"></asp:TextBox>
    </td>
  </tr>

  <tr>
    <td>
      Телефон/факс
    </td>
    <td>
        <table CellPadding="0" CellSpacing="0" Border="0">
          <tr>
            <td>
              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Phones") %>' Width="158px"></asp:TextBox>
            </td>
            <td>
              e-mail
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>' Width="144px"></asp:TextBox>
            </td>
            </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>
      Сайт организации
    </td>
    <td valign="bottom">
        <asp:TextBox ID="WebTextBox" runat="server" Text='<%# Bind("Website") %>' Width="345px"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td valign="top">
      Адрес/проезд
    </td>
    <td>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Height="58px" Text='<%# Bind("Adress") %>' 
            Width="345px"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td>
      Количество служащих в компании
    </td>
    <td>
        <table CellPadding="0" CellSpacing="0" Border="0">
          <tr>
            <td class="style1">
              <asp:TextBox ID="WQTextBox" runat="server" Text='<%# Bind("WorkerQuantity") %>'></asp:TextBox>
            </td>
            <td class="style1">
              &nbsp; Возраст компании
            </td>
            <td class="style1">
                <asp:TextBox ID="OrgAgeTextBox" runat="server" Text='<%# Bind("CompanyAge") %>' Width="93px"></asp:TextBox>
            </td>
            </tr>
            </table>
             </td>
            </tr>
          </table>      
    
    </EditItemTemplate>
    <InsertItemTemplate>
        Name:
        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
        <br />
        Adress:
        <asp:TextBox ID="AdressTextBox" runat="server" Text='<%# Bind("Adress") %>' />
        <br />
        Phones:
        <asp:TextBox ID="PhonesTextBox" runat="server" Text='<%# Bind("Phones") %>' />
        <br />
        Website:
        <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' />
        <br />
        Email:
        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
        <br />
        CompanyAge:
        <asp:TextBox ID="CompanyAgeTextBox" runat="server" 
            Text='<%# Bind("CompanyAge") %>' />
        <br />
        WorkerQuantity:
        <asp:TextBox ID="WorkerQuantityTextBox" runat="server" 
            Text='<%# Bind("WorkerQuantity") %>' />
        <br />
        ProfGroup_ID:
        <asp:TextBox ID="ProfGroup_IDTextBox" runat="server" 
            Text='<%# Bind("ProfGroup_ID") %>' />
        <br />
        HeadFullName:
        <asp:TextBox ID="HeadFullNameTextBox" runat="server" 
            Text='<%# Bind("HeadFullName") %>' />
        <br />
        UserLogin:
        <asp:TextBox ID="UserLoginTextBox" runat="server" 
            Text='<%# Bind("UserLogin") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Вставка" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Отмена" />
    </InsertItemTemplate>
    <ItemTemplate>
        &nbsp;<asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
        <br />
        Адрес:
        <asp:Label ID="AdressLabel" runat="server" Text='<%# Bind("Adress") %>' />
        <br />
        Тел./факс:
        <asp:Label ID="PhonesLabel" runat="server" Text='<%# Bind("Phones") %>' />
        <br />
        Сайт в Интернете:
        <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Bind("Website") %>' />
        <br />
        Адрес электронной почты:
        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
        <br />
        Возраст компании:
        <asp:Label ID="CompanyAgeLabel" runat="server" 
            Text='<%# Bind("CompanyAge") %>' />
        <br />
        Количество работников:
        <asp:Label ID="WorkerQuantityLabel" runat="server" 
            Text='<%# Bind("WorkerQuantity") %>' />
        <br />
        Отрасль:
        <asp:Label ID="ProfGroup_IDLabel" runat="server" 
            Text='<%# Bind("ProfGroup_ID") %>' />
        <br />
        Руководитель:
        <asp:Label ID="HeadFullNameLabel" runat="server" 
            Text='<%# Bind("HeadFullName") %>' />
        <br />
    </ItemTemplate>
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
</asp:FormView>


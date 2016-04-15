<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CustomerCareSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Scripts/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding:0px 0px 180px 40px;">
            <div class="col-lg-3">
                <h3>
                    Customer Care System Login
                </h3>
                <div>
                    <label for="txtId">ID:
                        <span>
                            <ASP:RequiredFieldValidator ControlToValidate="txtId"
                            Display="Static" ErrorMessage="*" runat="server" 
                            ID="vId" />
                        </span>
                    </label>
                    <input id="txtId" placeholder="Enter your ID" maxlength="30" type="text" runat="server" class="form-control">
                </div>
                <div><p></p></div>
                <div>
                    <label for="txtUserPass">Password:
                        <span>
                            <ASP:RequiredFieldValidator ControlToValidate="txtUserPass"
                            Display="Static" ErrorMessage="*" runat="server" 
                            ID="RequiredFieldValidator1" />
                        </span>
                    </label>
                    <input id="txtUserPass" placeholder="Enter your password" maxlength="30" type="password" runat="server" class="form-control">    
                </div>
                <div>&nbsp</div>
                <input type="submit" Value="Logon" runat="server" ID="cmdLogin" class="btn btn-primary btn-xs-10" ><p></p>
                <asp:Label id="lblMsg" ForeColor="red"  Font-Size="10" runat="server" />
            </div>
        </div>
    </form>
    <div style="float:right;margin-right:150px; margin-top:120px;">
        <img src="Images/logo.png" alt="Boox" width="420px" />
    </div>
    <div style="margin-top:450px; text-align:center; font-family:Verdana;"> 
            Copyright © 2016 - Boox Technology Indonesia. All Rights Reserved.

    </div>
</body>
</html>

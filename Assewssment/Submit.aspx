<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Submit.aspx.cs" Inherits="Assewssment.Submit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Submission Success</title>
</head>
<body>
    <h2>Form Submitted Successfully!</h2>
    <p>Name: <%= Request.Form["name"] %></p>
    <p>Email: <%= Request.Form["email"] %></p>
    <p>Phone: <%= Request.Form["phone"] %></p>
    <p>Signature:</p>
    <img src="<%= Request.Form["signature"] %>" alt="Signature" width="400" height="200" />
</body>
</html>

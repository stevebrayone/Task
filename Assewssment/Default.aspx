<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assewssment.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signature Form</title>
    <style>
        #signature-pad {
            border: 1px solid #ccc;
            width: 400px;
            height: 200px;
            cursor: crosshair;
        }
        body {
            outline: black double 20px;
            padding: 50px;
            overflow:scroll;
        }
         form {
             border-style: dotted solid;
             border-width: medium;
             border-color: bisque;
             border-radius: 5px;
            }
         button:hover {
            background-color: black;
            color: aquamarine;
        }
    </style>
</head>
<body>
    <h2>Signature Form</h2>
    <form id="signatureForm" method="post" action="Submit.aspx">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required /><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required /><br><br>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" required /><br><br>

        <label for="signature">Signature:</label>
        <canvas id="signature-pad"></canvas><br><br>

        <button type="submit" onclick="validateForm()">Submit</button>
    </form>

    <script>
        const canvas = document.getElementById('signature-pad');
        const ctx = canvas.getContext('2d');
        let drawing = false;
        canvas.width = 400;
        canvas.height = 200;

        canvas.addEventListener('mousedown', startDrawing);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stopDrawing);
        canvas.addEventListener('mouseout', stopDrawing);

        function startDrawing(e) {
            drawing = true;
            ctx.beginPath();
            ctx.moveTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
        }

        function draw(e) {
            if (!drawing) return;
            ctx.lineTo(e.clientX - canvas.offsetLeft, e.clientY - canvas.offsetTop);
            ctx.stroke();
        }

        function stopDrawing() {
            drawing = false;
        }

        // Validate form before submission
        function validateForm() {
            const form = document.getElementById('signatureForm');
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const signatureData = canvas.toDataURL(); 

            // Check if all fields are filled and signature exists
            if (!name || !email || !phone || signatureData === '') {
                alert("Please fill in all fields and provide a signature.");
                return false;
            }
            const signatureField = document.createElement('input');
            signatureField.type = 'hidden';
            signatureField.name = 'signature';
            signatureField.value = signatureData;
            form.appendChild(signatureField);

            return true;
        }
    </script>
</body>
</html>

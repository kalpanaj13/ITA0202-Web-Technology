<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IT Service Request</title>
</head>

<body>

    <h1>IT Service Request Management System</h1>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>
        <p><strong><%= errorMessage %></strong></p>
    <%
        }
    %>

    <form action="ServiceRequestServlet" method="post">

        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId">
        <br><br>

        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName">
        <br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department">
        <br><br>

        <label for="problemCategory">Problem Category:</label>

        <select id="problemCategory" name="problemCategory">
            <option value="">-- Select Category --</option>
            <option value="Network">Network</option>
            <option value="Software">Software</option>
            <option value="Hardware">Hardware</option>
            <option value="Account">Account</option>
            <option value="Other">Other</option>
        </select>

        <br><br>

        <label for="problemDescription">Problem Description:</label>
        <br>

        <textarea id="problemDescription"
                  name="problemDescription"
                  rows="5"
                  cols="40"></textarea>

        <br><br>

        <label for="priority">Priority:</label>

        <select id="priority" name="priority">
            <option value="">-- Select Priority --</option>
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>
            <option value="High">High</option>
        </select>

        <br><br>

        <input type="submit" value="Submit Service Request">

    </form>

</body>
</html>

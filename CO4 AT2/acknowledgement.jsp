<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.itservice.model.ServiceRequest" %>

<%
ServiceRequest serviceRequest =
    (ServiceRequest) request.getAttribute("serviceRequest");

String requestNumber =
    (String) request.getAttribute("requestNumber");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Request Submitted</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f3f6fa;
    color: #263238;
}

.header {
    background: linear-gradient(135deg, #173f5f, #20639b);
    color: white;
    padding: 25px 40px;
}

.header h1 {
    margin: 0;
    font-size: 27px;
}

.header p {
    margin: 6px 0 0;
    opacity: .85;
}

.container {
    width: 90%;
    max-width: 850px;
    margin: 45px auto;
}

.success-card {
    background: white;
    border-radius: 14px;
    padding: 40px;
    box-shadow: 0 6px 25px rgba(0,0,0,.08);
}

.success {
    text-align: center;
    margin-bottom: 30px;
}

.check {
    width: 65px;
    height: 65px;
    margin: auto;
    border-radius: 50%;
    background: #e8f5e9;
    color: #2e7d32;
    font-size: 38px;
    line-height: 65px;
}

.success h2 {
    color: #2e7d32;
    margin-bottom: 5px;
}

.success p {
    color: #607d8b;
}

.request-number {
    background: #f1f7fc;
    border: 1px solid #d7e5f0;
    border-radius: 8px;
    padding: 18px;
    text-align: center;
    margin-bottom: 30px;
}

.request-number span {
    display: block;
    color: #607d8b;
    font-size: 13px;
    margin-bottom: 5px;
}

.request-number strong {
    color: #173f5f;
    font-size: 23px;
}

.details {
    border-top: 2px solid #edf1f5;
    padding-top: 20px;
}

.details h3 {
    color: #173f5f;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    padding: 13px 5px;
    border-bottom: 1px solid #edf1f5;
}

.label {
    font-weight: 600;
    color: #546e7a;
}

.value {
    color: #263238;
    text-align: right;
    max-width: 55%;
}

.priority {
    background: #fff3cd;
    color: #856404;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: bold;
}

.actions {
    text-align: center;
    margin-top: 30px;
}

.actions a {
    display: inline-block;
    padding: 12px 22px;
    background: #20639b;
    color: white;
    text-decoration: none;
    border-radius: 7px;
    font-weight: 600;
}

.actions a:hover {
    background: #173f5f;
}

.footer {
    text-align: center;
    color: #78909c;
    font-size: 13px;
    margin: 25px;
}

</style>

</head>

<body>

<div class="header">
    <h1>IT Service Desk</h1>
    <p>Employee Technical Support Portal</p>
</div>

<div class="container">

<div class="success-card">

    <div class="success">

        <div class="check">✓</div>

        <h2>Service Request Submitted</h2>

        <p>
            Your IT service request has been successfully registered.
        </p>

    </div>

    <div class="request-number">

        <span>REQUEST NUMBER</span>

        <strong>
            <%= requestNumber %>
        </strong>

    </div>

    <div class="details">

        <h3>Request Details</h3>

        <div class="detail-row">
            <span class="label">Employee ID</span>
            <span class="value">
                <%= serviceRequest.getEmployeeId() %>
            </span>
        </div>

        <div class="detail-row">
            <span class="label">Employee Name</span>
            <span class="value">
                <%= serviceRequest.getEmployeeName() %>
            </span>
        </div>

        <div class="detail-row">
            <span class="label">Department</span>
            <span class="value">
                <%= serviceRequest.getDepartment() %>
            </span>
        </div>

        <div class="detail-row">
            <span class="label">Problem Category</span>
            <span class="value">
                <%= serviceRequest.getProblemCategory() %>
            </span>
        </div>

        <div class="detail-row">
            <span class="label">Priority</span>
            <span class="value">
                <span class="priority">
                    <%= serviceRequest.getPriority() %>
                </span>
            </span>
        </div>

        <div class="detail-row">
            <span class="label">Problem Description</span>
            <span class="value">
                <%= serviceRequest.getProblemDescription() %>
            </span>
        </div>

    </div>

    <div class="actions">

        <a href="serviceRequest.jsp">
            + Submit Another Request
        </a>

    </div>

</div>

</div>

<div class="footer">
    IT Service Desk • Internal Support Portal
</div>

</body>
</html>

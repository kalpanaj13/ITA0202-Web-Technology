package com.student;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // Get student information
        String name = request.getParameter("name");
        String regno = request.getParameter("regno");

        // Get subject marks
        String physicsString = request.getParameter("mark1");
        String mathsString = request.getParameter("mark2");
        String computerString = request.getParameter("mark3");

        // Check for empty values
        if (name == null || name.trim().isEmpty()
                || regno == null || regno.trim().isEmpty()
                || physicsString == null || physicsString.trim().isEmpty()
                || mathsString == null || mathsString.trim().isEmpty()
                || computerString == null || computerString.trim().isEmpty()) {

            showError(out, "Please enter all student details and marks.");
            return;
        }

        int physics;
        int maths;
        int computerScience;

        // Convert marks into integers
        try {

            physics = Integer.parseInt(physicsString);
            maths = Integer.parseInt(mathsString);
            computerScience = Integer.parseInt(computerString);

        } catch (NumberFormatException e) {

            showError(out, "Marks must be valid numbers.");
            return;
        }

        // Validate marks
        if (physics < 0 || physics > 100
                || maths < 0 || maths > 100
                || computerScience < 0 || computerScience > 100) {

            showError(out, "Marks must be between 0 and 100.");
            return;
        }

        // Calculate total
        int total = physics + maths + computerScience;

        // Calculate average
        double average = total / 3.0;

        // Find highest mark
        int highest = Math.max(
                physics,
                Math.max(maths, computerScience)
        );

        // Calculate result
        String status;

        if (physics >= 40
                && maths >= 40
                && computerScience >= 40) {

            status = "PASS";

        } else {

            status = "FAIL";
        }

        // Select result CSS class
        String resultClass;

        if (status.equals("PASS")) {

            resultClass = "pass";

        } else {

            resultClass = "fail";
        }

        // Start HTML
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");

        out.println("<meta charset='UTF-8'>");

        out.println("<meta name='viewport' " +
                "content='width=device-width, initial-scale=1.0'>");

        out.println("<title>Student Result Portal</title>");

        // CSS
        out.println("<style>");

        out.println("* {");
        out.println("box-sizing: border-box;");
        out.println("margin: 0;");
        out.println("padding: 0;");
        out.println("}");

        out.println("body {");

        out.println("font-family: Arial, Helvetica, sans-serif;");

        out.println("min-height: 100vh;");

        out.println("padding: 35px 20px;");

        out.println("background: ");

        out.println("radial-gradient(circle at 15% 20%, " +
                "rgba(255,255,255,0.25), transparent 25%),");

        out.println("radial-gradient(circle at 85% 75%, " +
                "rgba(255,255,255,0.20), transparent 25%),");

        out.println("linear-gradient(135deg, " +
                "#1769aa, #4f7ee8, #7b61d9, #d78bd8);");

        out.println("background-attachment: fixed;");

        out.println("}");

        /* Top Header */

        out.println(".top-header {");

        out.println("max-width: 900px;");

        out.println("margin: 0 auto 25px;");

        out.println("display: flex;");

        out.println("justify-content: space-between;");

        out.println("align-items: center;");

        out.println("color: white;");

        out.println("}");

        out.println(".brand {");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("gap: 15px;");

        out.println("}");

        out.println(".brand-icon {");

        out.println("width: 60px;");

        out.println("height: 60px;");

        out.println("border: 3px solid white;");

        out.println("border-radius: 50%;");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("justify-content: center;");

        out.println("font-size: 18px;");

        out.println("font-weight: bold;");

        out.println("}");

        out.println(".brand h2 {");

        out.println("font-size: 26px;");

        out.println("margin-bottom: 5px;");

        out.println("}");

        out.println(".brand p {");

        out.println("font-size: 14px;");

        out.println("opacity: 0.9;");

        out.println("}");

        out.println(".technology {");

        out.println("font-size: 14px;");

        out.println("font-weight: bold;");

        out.println("}");

        /* Main Result Card */

        out.println(".result-container {");

        out.println("max-width: 850px;");

        out.println("margin: auto;");

        out.println("background: rgba(255,255,255,0.97);");

        out.println("border-radius: 25px;");

        out.println("padding: 40px;");

        out.println("box-shadow: 0 25px 60px rgba(0,0,0,0.25);");

        out.println("}");

        /* Heading */

        out.println(".heading {");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("gap: 18px;");

        out.println("margin-bottom: 30px;");

        out.println("}");

        out.println(".heading-icon {");

        out.println("width: 70px;");

        out.println("height: 70px;");

        out.println("border-radius: 50%;");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("justify-content: center;");

        out.println("font-size: 12px;");

        out.println("font-weight: bold;");

        out.println("color: #ffffff;");

        out.println("background: linear-gradient(135deg, #2196f3, #7048e8);");

        out.println("}");

        out.println(".heading h1 {");

        out.println("font-size: 34px;");

        out.println("color: #173b78;");

        out.println("}");

        out.println(".heading p {");

        out.println("color: #7182a5;");

        out.println("margin-top: 5px;");

        out.println("}");

        /* Student Information */

        out.println(".info-card {");

        out.println("display: grid;");

        out.println("grid-template-columns: 1fr 1fr;");

        out.println("gap: 15px;");

        out.println("margin-bottom: 30px;");

        out.println("}");

        out.println(".info-box {");

        out.println("padding: 18px;");

        out.println("border-radius: 14px;");

        out.println("background: #f1f6ff;");

        out.println("border: 1px solid #dce7f7;");

        out.println("}");

        out.println(".info-label {");

        out.println("font-size: 13px;");

        out.println("color: #7182a5;");

        out.println("margin-bottom: 7px;");

        out.println("}");

        out.println(".info-value {");

        out.println("font-size: 19px;");

        out.println("font-weight: bold;");

        out.println("color: #173b78;");

        out.println("}");

        /* Section Title */

        out.println(".section-title {");

        out.println("font-size: 21px;");

        out.println("font-weight: bold;");

        out.println("color: #173b78;");

        out.println("padding-bottom: 12px;");

        out.println("border-bottom: 2px solid #e5eaf4;");

        out.println("margin-bottom: 18px;");

        out.println("}");

        /* Subjects */

        out.println(".subjects {");

        out.println("display: flex;");

        out.println("flex-direction: column;");

        out.println("gap: 12px;");

        out.println("}");

        out.println(".subject {");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("justify-content: space-between;");

        out.println("padding: 17px 20px;");

        out.println("border-radius: 13px;");

        out.println("}");

        out.println(".physics {");

        out.println("background: #eaf3ff;");

        out.println("}");

        out.println(".maths {");

        out.println("background: #f3eaff;");

        out.println("}");

        out.println(".computer {");

        out.println("background: #e7f8f0;");

        out.println("}");

        out.println(".subject-name {");

        out.println("font-size: 16px;");

        out.println("font-weight: bold;");

        out.println("color: #173b78;");

        out.println("}");

        out.println(".subject-mark {");

        out.println("font-size: 23px;");

        out.println("font-weight: bold;");

        out.println("color: #173b78;");

        out.println("}");

        /* Summary */

        out.println(".summary {");

        out.println("display: grid;");

        out.println("grid-template-columns: repeat(3, 1fr);");

        out.println("gap: 15px;");

        out.println("margin-top: 25px;");

        out.println("}");

        out.println(".summary-box {");

        out.println("text-align: center;");

        out.println("padding: 22px 10px;");

        out.println("border-radius: 14px;");

        out.println("}");

        out.println(".total {");

        out.println("background: #f1eaff;");

        out.println("}");

        out.println(".average {");

        out.println("background: #eaf3ff;");

        out.println("}");

        out.println(".highest {");

        out.println("background: #fff5dc;");

        out.println("}");

        out.println(".summary-title {");

        out.println("color: #61739a;");

        out.println("font-size: 14px;");

        out.println("margin-bottom: 8px;");

        out.println("}");

        out.println(".summary-value {");

        out.println("font-size: 23px;");

        out.println("font-weight: bold;");

        out.println("color: #173b78;");

        out.println("}");

        /* Result */

        out.println(".result-box {");

        out.println("margin-top: 22px;");

        out.println("padding: 20px;");

        out.println("border-radius: 15px;");

        out.println("display: flex;");

        out.println("align-items: center;");

        out.println("justify-content: space-between;");

        out.println("}");

        out.println(".pass {");

        out.println("background: #e3f8ed;");

        out.println("border: 1px solid #b8e9ce;");

        out.println("}");

        out.println(".fail {");

        out.println("background: #ffe7e7;");

        out.println("border: 1px solid #f3bcbc;");

        out.println("}");

        out.println(".result-title {");

        out.println("font-size: 20px;");

        out.println("font-weight: bold;");

        out.println("}");

        out.println(".pass .result-title {");

        out.println("color: #16834d;");

        out.println("}");

        out.println(".fail .result-title {");

        out.println("color: #d13a3a;");

        out.println("}");

        out.println(".status {");

        out.println("padding: 12px 30px;");

        out.println("border-radius: 30px;");

        out.println("font-size: 20px;");

        out.println("font-weight: bold;");

        out.println("color: white;");

        out.println("}");

        out.println(".pass .status {");

        out.println("background: #16a765;");

        out.println("}");

        out.println(".fail .status {");

        out.println("background: #dc4545;");

        out.println("}");

        /* Footer */

        out.println(".footer {");

        out.println("text-align: center;");

        out.println("margin-top: 25px;");

        out.println("color: #7182a5;");

        out.println("font-size: 13px;");

        out.println("line-height: 1.8;");

        out.println("}");

        out.println(".footer strong {");

        out.println("color: #4c65a0;");

        out.println("}");

        /* Responsive */

        out.println("@media (max-width: 650px) {");

        out.println(".top-header {");

        out.println("flex-direction: column;");

        out.println("gap: 15px;");

        out.println("text-align: center;");

        out.println("}");

        out.println(".result-container {");

        out.println("padding: 25px 18px;");

        out.println("}");

        out.println(".info-card {");

        out.println("grid-template-columns: 1fr;");

        out.println("}");

        out.println(".summary {");

        out.println("grid-template-columns: 1fr;");

        out.println("}");

        out.println(".result-box {");

        out.println("flex-direction: column;");

        out.println("gap: 15px;");

        out.println("}");

        out.println(".heading h1 {");

        out.println("font-size: 27px;");

        out.println("}");

        out.println("}");

        out.println("</style>");

        out.println("</head>");

        out.println("<body>");

        // Top Header

        out.println("<div class='top-header'>");

        out.println("<div class='brand'>");

        out.println("<div class='brand-icon'>SR</div>");

        out.println("<div>");

        out.println("<h2>Student Result Portal</h2>");

        out.println("<p>Check Your Performance and Build Your Future</p>");

        out.println("</div>");

        out.println("</div>");

        out.println("<div class='technology'>");

        out.println("Java Servlet and Apache Tomcat");

        out.println("</div>");

        out.println("</div>");

        // Main Card

        out.println("<div class='result-container'>");

        // Heading

        out.println("<div class='heading'>");

        out.println("<div class='heading-icon'>RESULT</div>");

        out.println("<div>");

        out.println("<h1>Student Result</h1>");

        out.println("<p>Academic performance summary</p>");

        out.println("</div>");

        out.println("</div>");

        // Student Information

        out.println("<div class='info-card'>");

        out.println("<div class='info-box'>");

        out.println("<div class='info-label'>Student Name</div>");

        out.println("<div class='info-value'>");

        out.println(name);

        out.println("</div>");

        out.println("</div>");

        out.println("<div class='info-box'>");

        out.println("<div class='info-label'>Register Number</div>");

        out.println("<div class='info-value'>");

        out.println(regno);

        out.println("</div>");

        out.println("</div>");

        out.println("</div>");

        // Subject Marks

        out.println("<div class='section-title'>");

        out.println("Subject Marks");

        out.println("</div>");

        out.println("<div class='subjects'>");

        // Physics

        out.println("<div class='subject physics'>");

        out.println("<div class='subject-name'>Physics</div>");

        out.println("<div class='subject-mark'>");

        out.println(physics);

        out.println("</div>");

        out.println("</div>");

        // Maths

        out.println("<div class='subject maths'>");

        out.println("<div class='subject-name'>Maths</div>");

        out.println("<div class='subject-mark'>");

        out.println(maths);

        out.println("</div>");

        out.println("</div>");

        // Computer Science

        out.println("<div class='subject computer'>");

        out.println("<div class='subject-name'>Computer Science</div>");

        out.println("<div class='subject-mark'>");

        out.println(computerScience);

        out.println("</div>");

        out.println("</div>");

        out.println("</div>");

        // Summary

        out.println("<div class='summary'>");

        out.println("<div class='summary-box total'>");

        out.println("<div class='summary-title'>Total</div>");

        out.println("<div class='summary-value'>");

        out.println(total + " / 300");

        out.println("</div>");

        out.println("</div>");

        out.println("<div class='summary-box average'>");

        out.println("<div class='summary-title'>Average</div>");

        out.println("<div class='summary-value'>");

        out.printf("%.2f", average);

        out.println("</div>");

        out.println("</div>");

        out.println("<div class='summary-box highest'>");

        out.println("<div class='summary-title'>Highest Mark</div>");

        out.println("<div class='summary-value'>");

        out.println(highest);

        out.println("</div>");

        out.println("</div>");

        out.println("</div>");

        // Final Result

        out.println("<div class='result-box " + resultClass + "'>");

        out.println("<div class='result-title'>");

        out.println("Final Result");

        out.println("</div>");

        out.println("<div class='status'>");

        out.println(status);

        out.println("</div>");

        out.println("</div>");

        // Footer

        out.println("<div class='footer'>");

        out.println("<strong>Student Result Processing System</strong>");

        out.println("<br>");

        out.println("Powered by Java Servlet and Apache Tomcat");

        out.println("</div>");

        out.println("</div>");

        out.println("</body>");

        out.println("</html>");
    }


    // Error page

    private void showError(PrintWriter out, String message) {

        out.println("<!DOCTYPE html>");

        out.println("<html>");

        out.println("<head>");

        out.println("<meta charset='UTF-8'>");

        out.println("<meta name='viewport' " +
                "content='width=device-width, initial-scale=1.0'>");

        out.println("<title>Input Error</title>");

        out.println("<style>");

        out.println("body {");

        out.println("font-family: Arial, Helvetica, sans-serif;");

        out.println("min-height: 100vh;");

        out.println("display: flex;");

        out.println("justify-content: center;");

        out.println("align-items: center;");

        out.println("background: linear-gradient(135deg, " +
                "#1769aa, #7b61d9, #d78bd8);");

        out.println("}");

        out.println(".error {");

        out.println("background: white;");

        out.println("padding: 40px;");

        out.println("border-radius: 20px;");

        out.println("text-align: center;");

        out.println("width: 90%;");

        out.println("max-width: 500px;");

        out.println("box-shadow: 0 20px 50px rgba(0,0,0,0.25);");

        out.println("}");

        out.println(".error-title {");

        out.println("font-size: 28px;");

        out.println("font-weight: bold;");

        out.println("color: #d13a3a;");

        out.println("margin-bottom: 15px;");

        out.println("}");

        out.println(".error-message {");

        out.println("color: #666;");

        out.println("font-size: 16px;");

        out.println("line-height: 1.6;");

        out.println("}");

        out.println("</style>");

        out.println("</head>");

        out.println("<body>");

        out.println("<div class='error'>");

        out.println("<div class='error-title'>Input Error</div>");

        out.println("<div class='error-message'>");

        out.println(message);

        out.println("</div>");

        out.println("</div>");

        out.println("</body>");

        out.println("</html>");
    }
}

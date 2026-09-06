package com.itservice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itservice.model.ServiceRequest;

@WebServlet("/ServiceRequestServlet")
public class ServiceRequestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read values submitted from JSP form
        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String department = request.getParameter("department");
        String problemCategory = request.getParameter("problemCategory");
        String problemDescription = request.getParameter("problemDescription");
        String priority = request.getParameter("priority");

        // 2. Validate mandatory fields
        if (employeeId == null || employeeId.trim().isEmpty()
                || employeeName == null || employeeName.trim().isEmpty()
                || department == null || department.trim().isEmpty()
                || problemCategory == null || problemCategory.trim().isEmpty()
                || problemDescription == null || problemDescription.trim().isEmpty()
                || priority == null || priority.trim().isEmpty()) {

            request.setAttribute("errorMessage",
                    "All fields are mandatory. Please fill in all the details.");

            request.getRequestDispatcher("serviceRequest.jsp")
                   .forward(request, response);

            return;
        }

        // 3. Create ServiceRequest Model object
        ServiceRequest serviceRequest = new ServiceRequest(
                employeeId.trim(),
                employeeName.trim(),
                department.trim(),
                problemCategory,
                problemDescription.trim(),
                priority
        );

        // 4. Generate service request number
        String requestNumber = "SR-" + System.currentTimeMillis();

        // 5. Store Model object and request number
        request.setAttribute("serviceRequest", serviceRequest);
        request.setAttribute("requestNumber", requestNumber);

        // 6. Forward to acknowledgement JSP
        request.getRequestDispatcher("acknowledgement.jsp")
               .forward(request, response);
    }
}

package com.itservice.model;

public class ServiceRequest {

    private String employeeId;
    private String employeeName;
    private String department;
    private String problemCategory;
    private String problemDescription;
    private String priority;

    // Constructor
    public ServiceRequest(String employeeId, String employeeName,
                          String department, String problemCategory,
                          String problemDescription, String priority) {

        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.department = department;
        this.problemCategory = problemCategory;
        this.problemDescription = problemDescription;
        this.priority = priority;
    }

    // Getter and Setter for Employee ID
    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    // Getter and Setter for Employee Name
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    // Getter and Setter for Department
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    // Getter and Setter for Problem Category
    public String getProblemCategory() {
        return problemCategory;
    }

    public void setProblemCategory(String problemCategory) {
        this.problemCategory = problemCategory;
    }

    // Getter and Setter for Problem Description
    public String getProblemDescription() {
        return problemDescription;
    }

    public void setProblemDescription(String problemDescription) {
        this.problemDescription = problemDescription;
    }

    // Getter and Setter for Priority
    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
}

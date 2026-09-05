<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
        method="html"
        encoding="UTF-8"
        indent="yes"/>

    <!-- =====================================================
         ROOT TEMPLATE
         ===================================================== -->

    <xsl:template match="/">

        <html>

            <head>

                <meta charset="UTF-8"/>

                <meta
                    name="viewport"
                    content="width=device-width, initial-scale=1.0"/>

                <title>High Enrollment Courses</title>

                <style>

                    * {
                        box-sizing: border-box;
                        margin: 0;
                        padding: 0;
                    }

                    body {
                        font-family: Arial, Helvetica, sans-serif;
                        background: #f4f6fb;
                        color: #111827;
                    }

                    .header {
                        background: #111827;
                        color: white;
                        padding: 28px 7%;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .brand {
                        display: flex;
                        align-items: center;
                        gap: 14px;
                    }

                    .logo {
                        width: 48px;
                        height: 48px;
                        border-radius: 12px;
                        background: white;
                        color: #111827;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: bold;
                    }

                    .brand h1 {
                        font-size: 20px;
                    }

                    .brand p {
                        color: #94a3b8;
                        font-size: 10px;
                        margin-top: 4px;
                        letter-spacing: 1px;
                    }

                    .status {
                        border: 1px solid #374151;
                        border-radius: 30px;
                        padding: 10px 15px;
                        font-size: 10px;
                        color: #d1d5db;
                    }

                    .dot {
                        display: inline-block;
                        width: 7px;
                        height: 7px;
                        border-radius: 50%;
                        background: #10b981;
                        margin-right: 7px;
                    }

                    .container {
                        width: 86%;
                        max-width: 1350px;
                        margin: auto;
                        padding: 45px 0 70px;
                    }

                    .eyebrow {
                        color: #4f46e5;
                        font-size: 9px;
                        font-weight: bold;
                        letter-spacing: 2px;
                        margin-bottom: 8px;
                    }

                    .intro {
                        display: flex;
                        justify-content: space-between;
                        align-items: end;
                        margin-bottom: 30px;
                    }

                    .intro h2 {
                        font-size: 36px;
                        letter-spacing: -1.5px;
                        margin-bottom: 8px;
                    }

                    .intro p {
                        color: #64748b;
                        font-size: 12px;
                    }

                    .flow {
                        color: #94a3b8;
                        font-size: 10px;
                    }

                    .summary {
                        display: grid;
                        grid-template-columns: repeat(4, 1fr);
                        gap: 15px;
                        margin-bottom: 25px;
                    }

                    .card {
                        background: white;
                        border: 1px solid #e5e7eb;
                        border-radius: 15px;
                        padding: 22px;
                    }

                    .card-label {
                        color: #64748b;
                        font-size: 9px;
                        font-weight: bold;
                        letter-spacing: 1px;
                    }

                    .card-number {
                        display: block;
                        font-size: 30px;
                        font-weight: bold;
                        margin-top: 14px;
                    }

                    .card-small {
                        color: #94a3b8;
                        font-size: 10px;
                        margin-top: 5px;
                        display: block;
                    }

                    .logic {
                        background: #111827;
                        color: white;
                        border-radius: 16px;
                        padding: 25px;
                        margin-bottom: 25px;
                    }

                    .logic-title {
                        font-size: 18px;
                        margin-bottom: 20px;
                    }

                    .logic-grid {
                        display: grid;
                        grid-template-columns: repeat(3, 1fr);
                        gap: 12px;
                    }

                    .logic-box {
                        background: #1f2937;
                        border: 1px solid #374151;
                        border-radius: 10px;
                        padding: 17px;
                    }

                    .logic-box span {
                        display: block;
                        color: #94a3b8;
                        font-size: 8px;
                        letter-spacing: 1px;
                        margin-bottom: 9px;
                    }

                    .logic-box code {
                        color: #c4b5fd;
                        font-size: 11px;
                    }

                    .table-card {
                        background: white;
                        border: 1px solid #e5e7eb;
                        border-radius: 18px;
                        overflow: hidden;
                    }

                    .table-title {
                        padding: 24px;
                        border-bottom: 1px solid #e5e7eb;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .table-title h3 {
                        font-size: 19px;
                    }

                    .table-title p {
                        color: #64748b;
                        font-size: 10px;
                        margin-top: 5px;
                    }

                    .count {
                        background: #111827;
                        color: white;
                        padding: 8px 12px;
                        border-radius: 8px;
                        font-size: 9px;
                        font-weight: bold;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    th {
                        text-align: left;
                        padding: 14px 18px;
                        background: #f8fafc;
                        color: #64748b;
                        font-size: 9px;
                        text-transform: uppercase;
                        letter-spacing: .7px;
                    }

                    td {
                        padding: 17px 18px;
                        border-top: 1px solid #f1f5f9;
                        font-size: 11px;
                    }

                    tr:hover {
                        background: #fafbff;
                    }

                    .rank {
                        width: 28px;
                        height: 28px;
                        border-radius: 8px;
                        background: #eef2ff;
                        color: #4338ca;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: bold;
                    }

                    .code {
                        color: #4f46e5;
                        font-weight: bold;
                    }

                    .name {
                        font-weight: bold;
                    }

                    .faculty {
                        color: #64748b;
                    }

                    .students {
                        font-weight: bold;
                        font-size: 14px;
                    }

                    .bar {
                        width: 100px;
                        height: 6px;
                        background: #e5e7eb;
                        border-radius: 10px;
                        margin-top: 6px;
                        overflow: hidden;
                    }

                    .bar-fill {
                        height: 100%;
                        background: #4f46e5;
                    }

                    .credits {
                        background: #f1f5f9;
                        color: #475569;
                        padding: 6px 8px;
                        border-radius: 6px;
                        font-size: 9px;
                        font-weight: bold;
                    }

                    .type {
                        background: #ecfdf5;
                        color: #047857;
                        padding: 6px 9px;
                        border-radius: 20px;
                        font-size: 9px;
                        font-weight: bold;
                    }

                    .footer {
                        margin-top: 35px;
                        border-top: 1px solid #e5e7eb;
                        padding-top: 20px;
                        display: flex;
                        justify-content: space-between;
                        color: #94a3b8;
                        font-size: 9px;
                    }

                    @media(max-width: 900px) {

                        .summary {
                            grid-template-columns: repeat(2, 1fr);
                        }

                        .logic-grid {
                            grid-template-columns: 1fr;
                        }

                    }

                    @media(max-width: 650px) {

                        .header {
                            padding: 22px;
                        }

                        .status {
                            display: none;
                        }

                        .container {
                            width: 92%;
                        }

                        .intro {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 15px;
                        }

                        .summary {
                            grid-template-columns: 1fr;
                        }

                        .table-card {
                            overflow-x: auto;
                        }

                        table {
                            min-width: 850px;
                        }

                        .footer {
                            flex-direction: column;
                            gap: 8px;
                        }

                    }

                </style>

            </head>


            <body>

                <!-- HEADER -->

                <header class="header">

                    <div class="brand">

                        <div class="logo">
                            UC
                        </div>

                        <div>

                            <h1>
                                UniCore
                            </h1>

                            <p>
                                UNIVERSITY ACADEMIC ANALYTICS
                            </p>

                        </div>

                    </div>


                    <div class="status">

                        <span class="dot"></span>

                        XSLT REPORT GENERATED

                    </div>

                </header>


                <!-- MAIN -->

                <main class="container">


                    <!-- INTRO -->

                    <div class="intro">

                        <div>

                            <div class="eyebrow">
                                SEMESTER WORKLOAD REPORT
                            </div>

                            <h2>
                                High Enrollment Courses
                            </h2>

                            <p>
                                Courses with more than 40 students,
                                sorted by enrollment.
                            </p>

                        </div>


                        <div class="flow">

                            XML → XPath → XSLT → HTML

                        </div>

                    </div>


                    <!-- SUMMARY -->

                    <div class="summary">


                        <div class="card">

                            <span class="card-label">
                                COURSES IN REPORT
                            </span>

                            <span class="card-number">

                                <xsl:value-of
                                    select="count(
                                        /courses/course[
                                            students &gt; 40
                                        ]
                                    )"/>

                            </span>

                            <span class="card-small">
                                Courses above 40 students
                            </span>

                        </div>


                        <div class="card">

                            <span class="card-label">
                                HIGHEST ENROLLMENT
                            </span>

                            <span class="card-number">

                                <xsl:for-each
                                    select="/courses/course">

                                    <xsl:sort
                                        select="students"
                                        data-type="number"
                                        order="descending"/>

                                    <xsl:if test="position()=1">

                                        <xsl:value-of
                                            select="students"/>

                                    </xsl:if>

                                </xsl:for-each>

                            </span>

                            <span class="card-small">
                                Maximum students
                            </span>

                        </div>


                        <div class="card">

                            <span class="card-label">
                                XSLT CONDITION
                            </span>

                            <span class="card-number">
                                &gt;40
                            </span>

                            <span class="card-small">
                                Student threshold
                            </span>

                        </div>


                        <div class="card">

                            <span class="card-label">
                                SORT ORDER
                            </span>

                            <span class="card-number">
                                DESC
                            </span>

                            <span class="card-small">
                                Student enrollment
                            </span>

                        </div>

                    </div>


                    <!-- XSLT LOGIC -->

                    <div class="logic">

                        <h3 class="logic-title">
                            XSLT Transformation Logic
                        </h3>


                        <div class="logic-grid">


                            <div class="logic-box">

                                <span>
                                    XPATH FILTER
                                </span>

                                <code>
                                    /courses/course[students &gt; 40]
                                </code>

                            </div>


                            <div class="logic-box">

                                <span>
                                    XSLT SORT
                                </span>

                                <code>
                                    students → number → descending
                                </code>

                            </div>


                            <div class="logic-box">

                                <span>
                                    OUTPUT
                                </span>

                                <code>
                                    XML → HTML Table
                                </code>

                            </div>


                        </div>

                    </div>


                    <!-- TABLE -->

                    <div class="table-card">


                        <div class="table-title">

                            <div>

                                <h3>
                                    Enrollment Ranking
                                </h3>

                                <p>
                                    Dynamically transformed using XSLT
                                </p>

                            </div>


                            <div class="count">

                                <xsl:value-of
                                    select="count(
                                        /courses/course[
                                            students &gt; 40
                                        ]
                                    )"/>

                                RECORDS

                            </div>

                        </div>


                        <table>


                            <thead>

                                <tr>

                                    <th>
                                        Rank
                                    </th>

                                    <th>
                                        Course Code
                                    </th>

                                    <th>
                                        Course Name
                                    </th>

                                    <th>
                                        Faculty
                                    </th>

                                    <th>
                                        Students
                                    </th>

                                    <th>
                                        Credits
                                    </th>

                                    <th>
                                        Type
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                                <!-- =================================
                                     FILTER + SORT
                                     ================================= -->

                                <xsl:for-each
                                    select="/courses/course[
                                        students &gt; 40
                                    ]">


                                    <xsl:sort
                                        select="students"
                                        data-type="number"
                                        order="descending"/>


                                    <tr>


                                        <!-- RANK -->

                                        <td>

                                            <span class="rank">

                                                <xsl:value-of
                                                    select="position()"/>

                                            </span>

                                        </td>


                                        <!-- CODE -->

                                        <td>

                                            <span class="code">

                                                <xsl:value-of
                                                    select="code"/>

                                            </span>

                                        </td>


                                        <!-- NAME -->

                                        <td>

                                            <span class="name">

                                                <xsl:value-of
                                                    select="name"/>

                                            </span>

                                        </td>


                                        <!-- FACULTY -->

                                        <td>

                                            <span class="faculty">

                                                <xsl:value-of
                                                    select="faculty"/>

                                            </span>

                                        </td>


                                        <!-- STUDENTS -->

                                        <td>

                                            <span class="students">

                                                <xsl:value-of
                                                    select="students"/>

                                            </span>


                                            <div class="bar">

                                                <div
                                                    class="bar-fill">

                                                    <xsl:attribute
                                                        name="style">

                                                        width:
                                                        <xsl:value-of
                                                            select="
                                                            number(students)
                                                            div 72
                                                            * 100
                                                            "/>%

                                                    </xsl:attribute>

                                                </div>

                                            </div>

                                        </td>


                                        <!-- CREDITS -->

                                        <td>

                                            <span class="credits">

                                                <xsl:value-of
                                                    select="credits"/>

                                                Credits

                                            </span>

                                        </td>


                                        <!-- TYPE -->

                                        <td>

                                            <span class="type">

                                                <xsl:value-of
                                                    select="type"/>

                                            </span>

                                        </td>


                                    </tr>


                                </xsl:for-each>


                            </tbody>

                        </table>

                    </div>


                    <!-- FOOTER -->

                    <footer class="footer">

                        <div>
                            UniCore Academic Analytics
                        </div>

                        <div>
                            Web Technology Unit IV
                            · XML
                            · XPath
                            · XSLT
                        </div>

                    </footer>


                </main>

            </body>

        </html>

    </xsl:template>

</xsl:stylesheet>

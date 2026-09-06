<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>

<title>University Course Analytics</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    background: #f4f6fb;
    color: #1f2937;
}

/* HEADER */

.header {
    background: #111827;
    color: white;
    padding: 25px 10%;
}

.header h1 {
    margin: 0;
    font-size: 28px;
}

.header p {
    color: #aab3c5;
    margin-top: 8px;
}


/* MAIN CONTAINER */

.container {
    width: 85%;
    margin: 35px auto;
}


/* XSLT LOGIC SECTION */

.logic-box {
    background: #131c2b;
    color: white;
    border-radius: 18px;
    padding: 25px;
    margin-bottom: 25px;
}

.logic-box h2 {
    margin-top: 0;
    font-size: 20px;
}

.logic-cards {
    display: flex;
    gap: 15px;
}

.card {
    flex: 1;
    background: #202b3d;
    border: 1px solid #344155;
    border-radius: 12px;
    padding: 18px;
}

.card-title {
    color: #9ca3af;
    font-size: 11px;
    letter-spacing: 1px;
}

.card-value {
    margin-top: 10px;
    color: #c4b5fd;
    font-family: monospace;
    font-size: 15px;
}


/* TABLE SECTION */

.table-box {
    background: white;
    border-radius: 18px;
    overflow: hidden;
    border: 1px solid #dbe1ea;
}

.table-header {
    padding: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.table-header h2 {
    margin: 0;
    font-size: 22px;
}

.table-header p {
    margin: 7px 0 0;
    color: #6b7280;
    font-size: 14px;
}

.record {
    background: #172033;
    color: white;
    padding: 9px 15px;
    border-radius: 10px;
    font-size: 12px;
    font-weight: bold;
}


/* TABLE */

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #f7f8fb;
    color: #64748b;
    font-size: 11px;
    letter-spacing: 1px;
    text-align: left;
    padding: 15px;
}

td {
    padding: 18px 15px;
    border-top: 1px solid #e5e7eb;
    font-size: 14px;
}

.rank {
    background: #eef2ff;
    color: #4f46e5;
    padding: 8px 12px;
    border-radius: 10px;
    font-weight: bold;
}

.code {
    color: #4f46e5;
    font-weight: bold;
}

.course-name {
    font-weight: bold;
}

.faculty {
    color: #64748b;
}


/* STUDENT BAR */

.student-number {
    font-weight: bold;
    font-size: 16px;
}

.bar-background {
    width: 100px;
    height: 6px;
    background: #dbe1ea;
    border-radius: 10px;
    margin-top: 8px;
}

.bar {
    height: 6px;
    background: #5b55c9;
    border-radius: 10px;
}


/* BADGES */

.credit-badge {
    background: #eef2f7;
    color: #475569;
    padding: 7px 10px;
    border-radius: 10px;
    font-size: 12px;
}

.type-badge {
    background: #e8f5ee;
    color: #2f855a;
    padding: 7px 12px;
    border-radius: 15px;
    font-size: 12px;
}


/* FOOTER */

.footer {
    margin-top: 30px;
    padding: 20px 0;
    color: #94a3b8;
    font-size: 12px;
    display: flex;
    justify-content: space-between;
}


/* MOBILE */

@media screen and (max-width: 700px) {

    .container {
        width: 95%;
    }

    .logic-cards {
        flex-direction: column;
    }

    table {
        font-size: 11px;
    }

}

</style>

</head>


<body>

<!-- HEADER -->

<div class="header">

    <h1>University Course Analytics</h1>

    <p>
        Semester Enrollment and Academic Workload Analysis
    </p>

</div>


<div class="container">


<!-- XSLT TRANSFORMATION LOGIC -->

<div class="logic-box">

    <h2>XSLT Transformation Logic</h2>

    <div class="logic-cards">

        <div class="card">

            <div class="card-title">
                XPATH FILTER
            </div>

            <div class="card-value">
                /courses/course[students &gt; 40]
            </div>

        </div>


        <div class="card">

            <div class="card-title">
                XSLT SORT
            </div>

            <div class="card-value">
                students → number → descending
            </div>

        </div>


        <div class="card">

            <div class="card-title">
                OUTPUT
            </div>

            <div class="card-value">
                XML → HTML Table
            </div>

        </div>

    </div>

</div>



<!-- ENROLLMENT TABLE -->

<div class="table-box">

<div class="table-header">

<div>

<h2>Enrollment Ranking</h2>

<p>Dynamically transformed using XSLT</p>

</div>


<div class="record">

<xsl:value-of select="count(courses/course[students &gt; 40])"/>
 RECORDS

</div>

</div>


<table>

<thead>

<tr>

<th>RANK</th>

<th>COURSE CODE</th>

<th>COURSE NAME</th>

<th>FACULTY</th>

<th>STUDENTS</th>

<th>CREDITS</th>

<th>TYPE</th>

</tr>

</thead>


<tbody>


<!-- FILTER AND SORT -->

<xsl:for-each select="courses/course[students &gt; 40]">

<xsl:sort
select="students"
data-type="number"
order="descending"/>


<tr>


<!-- RANK -->

<td>

<span class="rank">

<xsl:value-of select="position()"/>

</span>

</td>



<!-- COURSE CODE -->

<td class="code">

<xsl:value-of select="code"/>

</td>



<!-- COURSE NAME -->

<td class="course-name">

<xsl:value-of select="name"/>

</td>



<!-- FACULTY -->

<td class="faculty">

<xsl:value-of select="faculty"/>

</td>



<!-- STUDENTS -->

<td>

<div class="student-number">

<xsl:value-of select="students"/>

</div>


<div class="bar-background">

<div class="bar">

<xsl:attribute name="style">

width:

<xsl:value-of select="students * 1.3"/>

px;

</xsl:attribute>

</div>

</div>

</td>



<!-- CREDITS -->

<td>

<span class="credit-badge">

<xsl:value-of select="credits"/>

 Credits

</span>

</td>



<!-- TYPE -->

<td>

<span class="type-badge">

<xsl:value-of select="type"/>

</span>

</td>


</tr>


</xsl:for-each>


</tbody>

</table>

</div>


<!-- FOOTER -->

<div class="footer">

<span>UniCore Academic Analytics</span>

<span>Web Technology Unit IV · XML · XPath · XSLT</span>

</div>


</div>

</body>

</html>

</xsl:template>

</xsl:stylesheet>

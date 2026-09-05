from flask import Flask, render_template, request, jsonify
from lxml import etree
import os

app = Flask(__name__)

# ============================================================
# FILE PATHS
# ============================================================

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

XML_FILE = os.path.join(BASE_DIR, "courses.xml")
XSL_FILE = os.path.join(BASE_DIR, "transform.xsl")


# ============================================================
# LOAD XML
# ============================================================

def load_xml():
    parser = etree.XMLParser(
        remove_blank_text=True
    )

    return etree.parse(XML_FILE, parser)


# ============================================================
# LOAD XSLT
# ============================================================

def load_xslt():

    xslt_tree = etree.parse(XSL_FILE)

    return etree.XSLT(xslt_tree)


# ============================================================
# CONVERT COURSE XML NODE TO DICTIONARY
# ============================================================

def course_to_dict(course):

    return {
        "id": course.get("id"),
        "code": course.findtext("code"),
        "name": course.findtext("name"),
        "faculty": course.findtext("faculty"),
        "students": int(course.findtext("students")),
        "credits": int(course.findtext("credits")),
        "type": course.findtext("type")
    }


# ============================================================
# GET ALL COURSES
# ============================================================

def get_all_courses():

    tree = load_xml()

    # XPath Q2(a)
    courses = tree.xpath(
        "/courses/course"
    )

    return [
        course_to_dict(course)
        for course in courses
    ]


# ============================================================
# STATISTICS
# ============================================================

def get_statistics():

    tree = load_xml()

    # --------------------------------------------------------
    # Q2(a) All courses
    # --------------------------------------------------------

    all_courses = tree.xpath(
        "/courses/course"
    )

    # --------------------------------------------------------
    # Total courses
    # --------------------------------------------------------

    total_courses = len(all_courses)

    # --------------------------------------------------------
    # Total students
    # --------------------------------------------------------

    total_students = sum(
        int(course.findtext("students"))
        for course in all_courses
    )

    # --------------------------------------------------------
    # Total credits
    # --------------------------------------------------------

    total_credits = sum(
        int(course.findtext("credits"))
        for course in all_courses
    )

    # --------------------------------------------------------
    # Q2(e) Theory courses
    # --------------------------------------------------------

    theory_courses = tree.xpath(
        "/courses/course[type='Theory']"
    )

    # --------------------------------------------------------
    # Practical courses
    # --------------------------------------------------------

    practical_courses = tree.xpath(
        "/courses/course[type='Practical']"
    )

    # --------------------------------------------------------
    # Q2(d) Courses with exactly 4 credits
    # --------------------------------------------------------

    four_credit_courses = tree.xpath(
        "/courses/course[credits=4]"
    )

    # --------------------------------------------------------
    # Q2(c) Courses with more than 50 students
    # --------------------------------------------------------

    high_enrollment = tree.xpath(
        "/courses/course[students>50]"
    )

    # --------------------------------------------------------
    # Q4(e)
    # Courses with more than 60 students
    # --------------------------------------------------------

    support_courses = tree.xpath(
        "/courses/course[students>60]"
    )

    # --------------------------------------------------------
    # Q2(g)
    # Faculty handling courses with at least 4 credits
    # --------------------------------------------------------

    faculty_4_credit = tree.xpath(
        "/courses/course[credits>=4]/faculty"
    )

    # --------------------------------------------------------
    # Highest enrollment
    # --------------------------------------------------------

    highest = max(
        all_courses,
        key=lambda course:
        int(course.findtext("students"))
    )

    # --------------------------------------------------------
    # Lowest enrollment
    # --------------------------------------------------------

    lowest = min(
        all_courses,
        key=lambda course:
        int(course.findtext("students"))
    )

    return {

        "total_courses": total_courses,

        "total_students": total_students,

        "total_credits": total_credits,

        "theory_courses": len(theory_courses),

        "practical_courses": len(practical_courses),

        "four_credit_courses": len(four_credit_courses),

        "high_enrollment": len(high_enrollment),

        "support_required": len(support_courses),

        "highest": course_to_dict(highest),

        "lowest": course_to_dict(lowest),

        "four_credit_list": [
            course_to_dict(course)
            for course in four_credit_courses
        ],

        "support_list": [
            course_to_dict(course)
            for course in support_courses
        ],

        "theory_list": [
            course_to_dict(course)
            for course in theory_courses
        ],

        "faculty_4_credit": [
            faculty.text
            for faculty in faculty_4_credit
        ]
    }


# ============================================================
# HOME PAGE
# ============================================================

@app.route("/")
def index():

    courses = get_all_courses()

    statistics = get_statistics()

    return render_template(
        "index.html",
        courses=courses,
        statistics=statistics
    )


# ============================================================
# COURSE SEARCH
# ============================================================

@app.route("/api/course/<code>")
def course_search(code):

    tree = load_xml()

    search_code = code.strip().upper()

    # XPath using variable
    result = tree.xpath(
        "/courses/course[code=$course_code]",
        course_code=search_code
    )

    if not result:

        return jsonify({
            "success": False,
            "message": "Course not found"
        }), 404

    return jsonify({
        "success": True,
        "course": course_to_dict(result[0])
    })


# ============================================================
# COURSE FILTER
# ============================================================

@app.route("/api/filter")
def filter_courses():

    tree = load_xml()

    course_type = request.args.get(
        "type",
        "All"
    )

    minimum_students = request.args.get(
        "min_students",
        "0"
    )

    # --------------------------------------------------------
    # Convert minimum students to integer
    # --------------------------------------------------------

    try:

        minimum_students = int(
            minimum_students
        )

    except ValueError:

        minimum_students = 0

    # --------------------------------------------------------
    # All courses
    # --------------------------------------------------------

    if course_type == "All":

        courses = tree.xpath(
            "/courses/course[students >= $min_students]",
            min_students=minimum_students
        )

    # --------------------------------------------------------
    # Theory / Practical
    # --------------------------------------------------------

    else:

        courses = tree.xpath(
            "/courses/course[type=$course_type and students >= $min_students]",
            course_type=course_type,
            min_students=minimum_students
        )

    return jsonify([
        course_to_dict(course)
        for course in courses
    ])


# ============================================================
# XSLT REPORT
# ============================================================

@app.route("/report")
def report():

    try:

        xml_tree = load_xml()

        transform = load_xslt()

        result = transform(xml_tree)

        return str(result)

    except Exception as error:

        return f"""
        <html>
        <head>
            <title>XSLT Error</title>
        </head>

        <body>

            <h1>XSLT Transformation Error</h1>

            <pre>{error}</pre>

        </body>
        </html>
        """, 500


# ============================================================
# COMPLETE XPATH ANALYSIS
# ============================================================

@app.route("/api/analysis")
def analysis():

    tree = load_xml()

    # ========================================================
    # Q2(a)
    # All course records
    # ========================================================

    all_courses = tree.xpath(
        "/courses/course"
    )

    # ========================================================
    # Q2(b)
    # Names of all courses
    # ========================================================

    course_names = tree.xpath(
        "/courses/course/name/text()"
    )

    # ========================================================
    # Q2(c)
    # Courses having more than 50 students
    # ========================================================

    more_than_50 = tree.xpath(
        "/courses/course[students>50]"
    )

    # ========================================================
    # Q2(d)
    # Courses carrying 4 credits
    # ========================================================

    four_credits = tree.xpath(
        "/courses/course[credits=4]"
    )

    # ========================================================
    # Q2(e)
    # Courses whose type is Theory
    # ========================================================

    theory = tree.xpath(
        "/courses/course[type='Theory']"
    )

    # ========================================================
    # Q2(f)
    # Names of Theory courses with >50 students
    # ========================================================

    theory_more_50 = tree.xpath(
        "/courses/course[type='Theory' and students>50]/name/text()"
    )

    # ========================================================
    # Q2(g)
    # Faculty members handling courses with >=4 credits
    # ========================================================

    faculty_at_least_4 = tree.xpath(
        "/courses/course[credits>=4]/faculty/text()"
    )

    # ========================================================
    # Q2(h)
    # Course whose ID is C104
    # ========================================================

    course_c104 = tree.xpath(
        "/courses/course[@id='C104']"
    )

    # ========================================================
    # Q2(i)
    # First course
    # ========================================================

    first_course = tree.xpath(
        "/courses/course[1]"
    )

    # ========================================================
    # Q2(j)
    # Last course
    # ========================================================

    last_course = tree.xpath(
        "/courses/course[last()]"
    )

    return jsonify({

        "question_2_a_all_courses":
            len(all_courses),

        "question_2_b_course_names":
            course_names,

        "question_2_c_more_than_50_students":
            [
                course_to_dict(course)
                for course in more_than_50
            ],

        "question_2_d_four_credit_courses":
            [
                course_to_dict(course)
                for course in four_credits
            ],

        "question_2_e_theory_courses":
            [
                course_to_dict(course)
                for course in theory
            ],

        "question_2_f_theory_more_than_50":
            theory_more_50,

        "question_2_g_faculty_at_least_4_credits":
            faculty_at_least_4,

        "question_2_h_course_C104":
            [
                course_to_dict(course)
                for course in course_c104
            ],

        "question_2_i_first_course":
            [
                course_to_dict(course)
                for course in first_course
            ],

        "question_2_j_last_course":
            [
                course_to_dict(course)
                for course in last_course
            ]

    })


# ============================================================
# XML INFORMATION API
# ============================================================

@app.route("/api/xml-info")
def xml_info():

    tree = load_xml()

    root = tree.getroot()

    return jsonify({

        "root_element": root.tag,

        "repeating_element": "course",

        "unique_attribute": "id",

        "numeric_elements": [
            "students",
            "credits"
        ],

        "course_count":
            len(
                tree.xpath("/courses/course")
            ),

        "xml_well_formed": True

    })


# ============================================================
# HEALTH CHECK
# ============================================================

@app.route("/api/status")
def status():

    return jsonify({

        "server": "running",

        "xml": os.path.exists(XML_FILE),

        "xslt": os.path.exists(XSL_FILE),

        "technology": [
            "Flask",
            "XML",
            "XPath",
            "XSLT",
            "lxml"
        ]

    })


# ============================================================
# ERROR HANDLER
# ============================================================

@app.errorhandler(404)
def page_not_found(error):

    return """
    <h1>404 - Page Not Found</h1>
    <p>The requested page does not exist.</p>
    <a href="/">Return to Dashboard</a>
    """, 404


# ============================================================
# START SERVER
# ============================================================

if __name__ == "__main__":

    print()
    print("=" * 60)
    print("      UNIVERSITY COURSE ANALYTICS SYSTEM")
    print("=" * 60)
    print()
    print("XML File :", XML_FILE)
    print("XSLT File:", XSL_FILE)
    print()
    print("Dashboard:")
    print("http://127.0.0.1:5000")
    print()
    print("XPath Analysis:")
    print("http://127.0.0.1:5000/api/analysis")
    print()
    print("XSLT Report:")
    print("http://127.0.0.1:5000/report")
    print()
    print("=" * 60)
    print()

    app.run(
        host="127.0.0.1",
        port=5000,
        debug=True
    )

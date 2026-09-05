// --------------------------------------------------
// COURSE SEARCH
// --------------------------------------------------

async function searchCourse() {

    const input =
        document.getElementById("courseSearch");

    const code =
        input.value.trim().toUpperCase();

    const result =
        document.getElementById("courseResult");


    if (!code) {

        alert("Please enter a course code.");

        input.focus();

        return;

    }


    try {

        const response =
            await fetch(
                `/api/course/${encodeURIComponent(code)}`
            );


        const data =
            await response.json();


        if (!data.success) {

            result.classList.remove("hidden");

            result.innerHTML = `
                <div class="result-header">
                    <div>
                        <span class="eyebrow">
                            SEARCH RESULT
                        </span>

                        <h2>Course Not Found</h2>

                        <p>
                            No course exists with code
                            <strong>${code}</strong>.
                        </p>
                    </div>
                </div>
            `;

            return;

        }


        const course = data.course;


        result.classList.remove("hidden");


        result.innerHTML = `

            <div class="result-header">

                <div>

                    <span class="eyebrow">
                        COURSE FOUND
                    </span>

                    <h2>
                        ${course.name}
                    </h2>

                    <p class="faculty">
                        ${course.code}
                        ·
                        ${course.type}
                    </p>

                </div>

                <span class="type-badge">
                    ${course.id}
                </span>

            </div>


            <div class="result-grid">

                <div class="result-box">
                    <span>COURSE CODE</span>
                    <strong>${course.code}</strong>
                </div>

                <div class="result-box">
                    <span>COURSE NAME</span>
                    <strong>${course.name}</strong>
                </div>

                <div class="result-box">
                    <span>FACULTY</span>
                    <strong>${course.faculty}</strong>
                </div>

                <div class="result-box">
                    <span>STUDENTS</span>
                    <strong>${course.students}</strong>
                </div>

                <div class="result-box">
                    <span>CREDITS</span>
                    <strong>${course.credits}</strong>
                </div>

                <div class="result-box">
                    <span>TYPE</span>
                    <strong>${course.type}</strong>
                </div>

            </div>

        `;


        result.scrollIntoView({
            behavior: "smooth",
            block: "center"
        });


    } catch (error) {

        console.error(error);

        alert(
            "Unable to connect to the server."
        );

    }

}


// --------------------------------------------------
// SHOW COURSE
// --------------------------------------------------

function showCourse(code) {

    document.getElementById(
        "courseSearch"
    ).value = code;

    searchCourse();

}


// --------------------------------------------------
// ENTER KEY SEARCH
// --------------------------------------------------

document
    .getElementById("courseSearch")
    .addEventListener("keydown", function(event) {

        if (event.key === "Enter") {

            searchCourse();

        }

    });


// --------------------------------------------------
// FILTER COURSES
// --------------------------------------------------

async function filterCourses(
    type,
    minStudents,
    button
) {

    document
        .querySelectorAll(".filter")
        .forEach(btn => {

            btn.classList.remove("active");

        });


    button.classList.add("active");


    const response =
        await fetch(
            `/api/filter?type=${encodeURIComponent(type)}&min_students=${minStudents}`
        );


    const courses =
        await response.json();


    const grid =
        document.getElementById("courseGrid");


    if (!courses.length) {

        grid.innerHTML = `

            <div class="course-result">

                <h3>
                    No courses found.
                </h3>

            </div>

        `;

        return;

    }


    grid.innerHTML =
        courses.map(course => `

            <article class="course-card">

                <div class="course-card-top">

                    <span class="course-code">
                        ${course.code}
                    </span>

                    <span class="
                        type-badge
                        ${course.type === "Practical"
                            ? "practical"
                            : ""}
                    ">
                        ${course.type}
                    </span>

                </div>


                <h3>
                    ${course.name}
                </h3>


                <p class="faculty">
                    ${course.faculty}
                </p>


                <div class="course-metrics">

                    <div>

                        <span>Students</span>

                        <strong>
                            ${course.students}
                        </strong>

                    </div>


                    <div>

                        <span>Credits</span>

                        <strong>
                            ${course.credits}
                        </strong>

                    </div>


                    <div>

                        <span>ID</span>

                        <strong>
                            ${course.id}
                        </strong>

                    </div>

                </div>


                <button
                    class="details-button"
                    onclick="showCourse('${course.code}')"
                >
                    View Details →
                </button>

            </article>

        `).join("");

}


// --------------------------------------------------
// ACTIVE NAVIGATION
// --------------------------------------------------

const sections =
    document.querySelectorAll(
        "section[id]"
    );


const navLinks =
    document.querySelectorAll(
        ".nav-item"
    );


window.addEventListener(
    "scroll",
    () => {

        let current = "";

        sections.forEach(section => {

            const sectionTop =
                section.offsetTop - 150;


            if (
                window.scrollY >=
                sectionTop
            ) {

                current =
                    section.getAttribute("id");

            }

        });


        navLinks.forEach(link => {

            link.classList.remove("active");


            if (
                link.getAttribute("href") ===
                `#${current}`
            ) {

                link.classList.add("active");

            }

        });

    }
);

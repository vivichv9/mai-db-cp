document.getElementById("registrationForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    const firstname = document.getElementById("firstname").value;
    const lastname = document.getElementById("lastname").value;
    const birth_date = document.getElementById("birth_date").value;
    const login = document.getElementById("login").value;
    const password = document.getElementById("password").value;

    const messageDiv = document.getElementById("message");
    const loadingDiv = document.getElementById("loading");

    messageDiv.textContent = "";
    loadingDiv.classList.remove("hidden");

    try {
        const response = await fetch("http://localhost:8000/auth/register", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                firstname,
                lastname,
                birth_date,
                login,
                password,
            }),
        });

        loadingDiv.classList.add("hidden");

        if (response.ok) {
            messageDiv.style.color = "green";
            messageDiv.textContent = `User with login "${login}" successfully registered!`;
        } else {
            const errorData = await response.json();
            messageDiv.style.color = "red";
            messageDiv.textContent = errorData.detail || "An error occurred!";
        }
    } catch (error) {
        loadingDiv.classList.add("hidden");
        messageDiv.style.color = "red";
        messageDiv.textContent = "Failed to connect to the server!";
    }
});

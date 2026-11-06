<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Welcome back</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body class="auth-page">

    <a class="brand auth-brand" href="${pageContext.request.contextPath}/restaurants">
        <span class="brand-mark">F</span>
        <span>food<span class="brand-accent">app</span></span>
    </a>

    <main class="auth-layout">

        <section class="auth-story">
            <span class="eyebrow">GOOD FOOD IS CLOSER THAN YOU THINK</span>

            <h1>
                Bring the
                <br>
                <em>joy of food</em>
                <br>
                to your door.
            </h1>

            <p>
                Discover neighbourhood favourites, order your comfort food, and make today a little more delicious.
            </p>

            <div class="auth-story-art">
                🍕 <span>🥗</span> 🍜
            </div>
        </section>

        <section class="auth-card">

            <div class="auth-card-icon">👋</div>

            <h2>Welcome back</h2>
            <p class="muted">Sign in to pick up where you left off.</p>

            <c:if test="${not empty error}">
                <p class="error">
                    <c:out value="${error}"/>
                </p>
            </c:if>

            <c:if test="${not empty message}">
                <p class="success">
                    <c:out value="${message}"/>
                </p>
            </c:if>

            <form action="${pageContext.request.contextPath}/login"
                  method="post"
                  class="auth-form">

                <label for="email">Email address</label>

                <input id="email"
                       type="email"
                       name="email"
                       autocomplete="email"
                       placeholder="you@example.com"
                       required>

                <label for="password">Password</label>

                <input id="password"
                       type="password"
                       name="password"
                       autocomplete="current-password"
                       placeholder="Your password"
                       required>

                <button class="button button-primary button-full" type="submit">
                    Sign in
                    <span aria-hidden="true">→</span>
                </button>

            </form>

            <p class="auth-switch">
                New to FoodApp?
                <a href="${pageContext.request.contextPath}/register">Create an account</a>
            </p>

            <a class="back-link" href="${pageContext.request.contextPath}/restaurants">
                Browse as a guest →
            </a>

        </section>

    </main>

    <footer class="auth-footer">
        Made with care. Served with flavour.
    </footer>

</body>
</html>
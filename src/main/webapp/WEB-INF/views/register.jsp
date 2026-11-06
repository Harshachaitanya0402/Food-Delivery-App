<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Create account</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body class="auth-page">

    <a class="brand auth-brand" href="${pageContext.request.contextPath}/restaurants">
        <span class="brand-mark">F</span>
        <span>food<span class="brand-accent">app</span></span>
    </a>

    <main class="auth-layout register-layout">

        <section class="auth-story">

            <span class="eyebrow">YOUR TABLE IS WAITING</span>

            <h1>
                Good taste.
                <br>
                <em>Great choices.</em>
            </h1>

            <p>
                Create an account to make ordering your favourites quicker and easier.
            </p>

            <div class="auth-story-art">
                🥟 <span>🍔</span> 🍰
            </div>

        </section>

        <section class="auth-card">

            <div class="auth-card-icon">✨</div>

            <h2>Create your account</h2>
            <p class="muted">A few details and you’re all set.</p>

            <c:if test="${not empty error}">
                <p class="error">
                    <c:out value="${error}"/>
                </p>
            </c:if>

            <form action="${pageContext.request.contextPath}/register"
                  method="post"
                  class="auth-form">

                <label for="username">Full name</label>

                <input id="username"
                       name="username"
                       autocomplete="name"
                       placeholder="Your name"
                       required>

                <label for="email">Email address</label>

                <input id="email"
                       type="email"
                       name="email"
                       autocomplete="email"
                       placeholder="you@example.com"
                       required>

                <label for="password">
                    Password
                    <span class="label-hint">(at least 6 characters)</span>
                </label>

                <input id="password"
                       type="password"
                       name="password"
                       minlength="6"
                       autocomplete="new-password"
                       placeholder="Create a password"
                       required>

                <label for="phone">
                    Phone number
                    <span class="label-hint">(optional)</span>
                </label>

                <input id="phone"
                       name="phone"
                       autocomplete="tel"
                       placeholder="Your contact number">

                <label for="address">
                    Delivery address
                    <span class="label-hint">(optional)</span>
                </label>

                <textarea id="address"
                          name="address"
                          autocomplete="street-address"
                          placeholder="House number, street, area"></textarea>

                <button class="button button-primary button-full" type="submit">
                    Create account
                    <span aria-hidden="true">→</span>
                </button>

            </form>

            <p class="auth-switch">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login">Sign in</a>
            </p>

        </section>

    </main>

    <footer class="auth-footer">
        Made with care. Served with flavour.
    </footer>

</body>
</html>
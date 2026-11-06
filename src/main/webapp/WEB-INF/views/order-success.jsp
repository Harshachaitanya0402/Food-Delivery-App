<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Order placed</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body class="success-page">

    <main class="success-card">

        <div class="success-check">✓</div>

        <span class="eyebrow eyebrow-dark">ORDER CONFIRMED</span>

        <h1>That’s a wrap!</h1>

        <p>
            Your order has been placed. Get ready for something delicious to arrive at your door.
        </p>

        <div class="success-details">

            <span>🥡</span>

            <div>
                <strong>What happens next?</strong>

                <p>
                    Your kitchen will prepare your order. Keep your phone nearby.
                </p>
            </div>

        </div>

        <a class="button button-primary" href="${pageContext.request.contextPath}/restaurants">
            Explore more food →
        </a>

    </main>

    <footer class="auth-footer">
        FoodApp · Made for good appetites.
    </footer>

</body>
</html>
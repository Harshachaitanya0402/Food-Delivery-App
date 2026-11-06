<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

    <header class="site-header">
        <a class="brand" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <nav class="main-nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/cart">← Back to cart</a>
        </nav>
    </header>

    <main class="page section-block checkout-layout">

        <section class="checkout-main">

            <div class="page-intro">
                <span class="eyebrow eyebrow-dark">ONE LAST STEP</span>
                <h1>Checkout.</h1>
                <p class="muted">Where should we bring all that goodness?</p>
            </div>

            <c:if test="${not empty error}">
                <p class="error">
                    <c:out value="${error}"/>
                </p>
            </c:if>

            <c:choose>

                <c:when test="${empty sessionScope.user}">
                    <div class="form-panel">
                        <h2>Sign in to continue</h2>
                        <p class="muted">Please sign in before placing your order.</p>

                        <a class="button button-primary" href="${pageContext.request.contextPath}/login">
                            Sign in
                        </a>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="form-panel">

                        <form action="${pageContext.request.contextPath}/checkout"
                              method="post"
                              class="checkout-form">

                            <label for="address">Delivery address</label>

                            <textarea id="address"
                                      name="address"
                                      placeholder="House number, street, area, city"
                                      required><c:out value="${sessionScope.user.address}"/></textarea>

                            <label for="paymentMethod">Payment method</label>

                            <select id="paymentMethod" name="paymentMethod">
                                <option value="Cash on Delivery">Cash on Delivery</option>
                            </select>

                            <div class="secure-note">
                                <span>✓</span>
                                Your order details are securely processed by the app.
                            </div>

                            <button class="button button-primary button-full" type="submit">
                                Place my order · ₹ <c:out value="${sessionScope.cart.total}"/>
                            </button>

                        </form>

                    </div>
                </c:otherwise>

            </c:choose>

        </section>

        <aside class="checkout-aside">

            <div class="checkout-aside-icon">🥡</div>

            <h2>Good choice.</h2>
            <p>Your favourites are almost on their way.</p>

            <div class="aside-divider"></div>

            <div class="aside-row">
                <span>Items total</span>
                <strong>₹ <c:out value="${sessionScope.cart.total}"/></strong>
            </div>

            <div class="aside-row">
                <span>Delivery</span>
                <strong>Calculated at delivery</strong>
            </div>

            <div class="aside-divider"></div>

            <p class="muted small-copy">
                Please double-check your address before placing your order.
            </p>

        </aside>

    </main>

    <footer class="site-footer">
        <span>FoodApp · A little joy in every delivery.</span>
    </footer>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Your cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

    <header class="site-header">
        <a class="brand" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <nav class="main-nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/restaurants">← Continue shopping</a>
        </nav>
    </header>

    <main class="page section-block narrow">

        <div class="page-intro">
            <span class="eyebrow eyebrow-dark">ALMOST THERE</span>
            <h1>Your cart.</h1>
            <p class="muted">Double-check your picks before checkout.</p>
        </div>

        <c:if test="${not empty error}">
            <p class="error">
                <c:out value="${error}"/>
            </p>
        </c:if>

        <c:if test="${not empty success}">
            <p class="success">
                <c:out value="${success}"/>
            </p>
        </c:if>

        <c:choose>

            <c:when test="${empty sessionScope.cart or empty sessionScope.cart.items}">
                <div class="empty-cart">
                    <div class="empty-cart-icon">🛍️</div>
                    <h2>Your cart is taking a little break.</h2>
                    <p class="muted">Add something tasty and it’ll show up here.</p>
                    <a class="button button-primary" href="${pageContext.request.contextPath}/restaurants">
                        Browse restaurants
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="cart-panel">

                    <div class="table-scroll">
                        <table class="cart-table">

                            <thead>
                                <tr>
                                    <th>Dish</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${sessionScope.cart.items}" var="entry">
                                    <tr>

                                        <td>
                                            <strong>
                                                <c:out value="${entry.value.name}"/>
                                            </strong>
                                        </td>

                                        <td>
                                            ₹ <c:out value="${entry.value.price}"/>
                                        </td>

                                        <td>
                                            <form class="inline quantity-update"
                                                  action="${pageContext.request.contextPath}/cart/update"
                                                  method="post">

                                                <input type="hidden" name="menuId" value="${entry.key}">

                                                <input class="quantity-input"
                                                       type="number"
                                                       name="quantity"
                                                       min="0"
                                                       max="20"
                                                       value="${entry.value.quantity}"
                                                       aria-label="Quantity for ${entry.value.name}">

                                                <button class="button button-outline button-small">Update</button>
                                            </form>
                                        </td>

                                        <td class="cart-subtotal">
                                            ₹ <c:out value="${entry.value.totalPrice}"/>
                                        </td>

                                        <td>
                                            <form action="${pageContext.request.contextPath}/cart/remove"
                                                  method="post">

                                                <input type="hidden" name="menuId" value="${entry.key}">

                                                <button class="remove-button" type="submit">Remove</button>
                                            </form>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>

                    <div class="cart-summary">

                        <div>
                            <span class="muted">Order subtotal</span>

                            <strong class="cart-total">
                                ₹ <c:out value="${sessionScope.cart.total}"/>
                            </strong>

                            <span class="summary-note">
                                Delivery charges, if any, are calculated at checkout.
                            </span>
                        </div>

                        <div class="cart-actions">

                            <form action="${pageContext.request.contextPath}/cart/clear"
                                  method="post">
                                <button class="button button-outline" type="submit">Clear cart</button>
                            </form>

                            <a class="button button-primary" href="${pageContext.request.contextPath}/checkout">
                                Continue to checkout →
                            </a>

                        </div>
                    </div>

                </div>
            </c:otherwise>

        </c:choose>

    </main>

    <footer class="site-footer">
        <span>FoodApp · Made for good appetites.</span>
        <a href="${pageContext.request.contextPath}/restaurants">Back to restaurants</a>
    </footer>

</body>
</html>
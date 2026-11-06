<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Menu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

    <header class="site-header">

        <a class="brand" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <nav class="main-nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/restaurants">
                ← All restaurants
            </a>

            <a class="button button-primary button-small" href="${pageContext.request.contextPath}/cart">
                Your cart
            </a>
        </nav>

    </header>

    <main class="page section-block menu-page">

        <div class="page-intro">
            <span class="eyebrow eyebrow-dark">FRESH FROM THE KITCHEN</span>
            <h1>Something delicious.</h1>
            <p class="muted">Choose your favourites and we’ll get them ready for you.</p>
        </div>

        <div class="menu-toolbar">

            <div class="search-wrap">
                <span aria-hidden="true">⌕</span>

                <input id="menuSearch"
                       type="search"
                       placeholder="Search menu items..."
                       aria-label="Search menu items">
            </div>

            <span class="menu-note">
                Made to order
                <span aria-hidden="true">✦</span>
            </span>

        </div>

        <c:if test="${not empty success}">
            <p class="success">
                <c:out value="${success}"/>
            </p>
        </c:if>

        <c:if test="${not empty error}">
            <p class="error">
                <c:out value="${error}"/>
            </p>
        </c:if>

        <section class="menu-grid" id="menuGrid">

            <c:forEach items="${menus}" var="m">

                <article class="menu-card"
                         data-search="${m.itemName} ${m.description}">

                    <div class="menu-image-wrap">

                        <c:choose>

                            <c:when test="${not empty m.imagePath}">
                                <img src="${pageContext.request.contextPath}/${m.imagePath}"
                                     alt="<c:out value='${m.itemName}'/>"
                                     loading="lazy">
                            </c:when>

                            <c:otherwise>
                                <div class="image-placeholder">🍴</div>
                            </c:otherwise>

                        </c:choose>

                        <span class="veg-mark" title="Menu item">✦</span>

                    </div>

                    <div class="menu-info">

                        <h2>
                            <c:out value="${m.itemName}"/>
                        </h2>

                        <p class="menu-description">
                            <c:out value="${m.description}"/>
                        </p>

                        <div class="menu-card-bottom">

                            <strong class="price">
                                ₹ <c:out value="${m.price}"/>
                            </strong>

                            <form action="${pageContext.request.contextPath}/cart/add"
                                  method="post"
                                  class="add-form">

                                <input type="hidden"
                                       name="menuId"
                                       value="${m.menuId}">

                                <input type="hidden"
                                       name="restaurantId"
                                       value="${m.restaurantId}">

                                <label class="sr-only" for="qty-${m.menuId}">
                                    Quantity
                                </label>

                                <input id="qty-${m.menuId}"
                                       class="quantity-input"
                                       type="number"
                                       name="quantity"
                                       min="1"
                                       max="20"
                                       value="1">

                                <button class="add-button"
                                        type="submit"
                                        aria-label="Add ${m.itemName} to cart">
                                    ＋ Add
                                </button>

                            </form>

                        </div>

                    </div>

                </article>

            </c:forEach>

        </section>

        <p id="noMenuItems" class="empty-state" hidden>
            No menu items match your search.
        </p>

        <c:if test="${empty menus}">
            <div class="empty-state">
                This restaurant’s menu is being refreshed. Please check back soon.
            </div>
        </c:if>

        <div class="center-action">
            <a class="button button-outline" href="${pageContext.request.contextPath}/restaurants">
                Browse other restaurants
            </a>
        </div>

    </main>

    <footer class="site-footer">

        <a class="brand brand-footer" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <span>Good food, delivered with love.</span>

    </footer>

    <script>
        (function() {
            const input = document.getElementById('menuSearch');
            const cards = [...document.querySelectorAll('.menu-card')];
            const empty = document.getElementById('noMenuItems');

            if (input) {
                input.addEventListener('input', () => {
                    const q = input.value.toLowerCase().trim();
                    let shown = 0;

                    cards.forEach(card => {
                        const match = card.dataset.search.toLowerCase().includes(q);
                        card.hidden = !match;

                        if (match) shown++;
                    });

                    empty.hidden = shown !== 0;
                });
            }
        })();
    </script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FoodApp | Discover restaurants</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

    <header class="site-header">

        <a class="brand" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <nav class="main-nav">
            <a class="nav-link active" href="${pageContext.request.contextPath}/restaurants">Discover</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/cart">Your cart</a>

            <c:choose>

                <c:when test="${not empty sessionScope.user}">
                    <span class="welcome">
                        Hi, <c:out value="${sessionScope.user.username}"/>
                    </span>

                    <form class="inline"
                          action="${pageContext.request.contextPath}/logout"
                          method="post">
                        <button class="button button-quiet" type="submit">Log out</button>
                    </form>
                </c:when>

                <c:otherwise>
                    <a class="button button-primary button-small"
                       href="${pageContext.request.contextPath}/login">
                        Sign in
                    </a>
                </c:otherwise>

            </c:choose>
        </nav>

    </header>

    <main>

        <section class="hero">

            <div class="hero-copy">

                <span class="eyebrow">
                    <span class="eyebrow-dot"></span>
                    GOOD FOOD, GOOD MOOD
                </span>

                <h1>
                    Your next
                    <br>
                    <em>great meal</em> is here.
                </h1>

                <p>
                    From comfort-food classics to fresh new favourites, find something delicious nearby.
                </p>

                <a class="button button-light" href="#restaurants">
                    Explore restaurants
                    <span aria-hidden="true">↓</span>
                </a>

                <div class="hero-stats">

                    <div>
                        <strong>8+</strong>
                        <span>local kitchens</span>
                    </div>

                    <div>
                        <strong>30 min</strong>
                        <span>average delivery</span>
                    </div>

                    <div>
                        <strong>4.5★</strong>
                        <span>customer favourites</span>
                    </div>

                </div>

            </div>

            <div class="hero-art" aria-hidden="true">

                <div class="hero-orbit orbit-one"></div>
                <div class="hero-orbit orbit-two"></div>

                <div class="hero-food">🍜</div>

                <div class="floating-chip chip-top">✦ Made fresh</div>
                <div class="floating-chip chip-bottom">♥ Something tasty</div>

            </div>

        </section>

        <section class="page section-block" id="restaurants">

            <div class="section-heading">

                <div>
                    <span class="eyebrow eyebrow-dark">THE NEIGHBOURHOOD FAVOURITES</span>
                    <h2>What are you craving?</h2>
                    <p class="muted">
                        Hand-picked restaurants for every kind of appetite.
                    </p>
                </div>

                <div class="search-wrap">
                    <span aria-hidden="true">⌕</span>

                    <input id="restaurantSearch"
                           type="search"
                           placeholder="Search food or cuisine..."
                           aria-label="Search restaurants">
                </div>

            </div>

            <c:if test="${not empty error}">
                <p class="error">
                    <c:out value="${error}"/>
                </p>
            </c:if>

            <section class="restaurant-grid" id="restaurantGrid">

                <c:forEach items="${restaurants}" var="r">

                    <article class="restaurant-card"
                             data-search="${r.name} ${r.cuisineType}">

                        <div class="restaurant-image-wrap">

                            <c:choose>

                                <c:when test="${not empty r.imageUrl}">
                                    <img class="restaurant-image"
                                         src="${pageContext.request.contextPath}/${r.imageUrl}"
                                         alt="<c:out value='${r.name}'/>"
                                         loading="lazy">
                                </c:when>

                                <c:otherwise>
                                    <div class="image-placeholder">🍽️</div>
                                </c:otherwise>

                            </c:choose>

                            <span class="delivery-pill">${r.deliveryTime} min</span>

                        </div>

                        <div class="restaurant-info">

                            <div class="restaurant-title-row">

                                <h3>
                                    <c:out value="${r.name}"/>
                                </h3>

                                <span class="rating">★ ${r.rating}</span>

                            </div>

                            <p class="cuisine">
                                <c:out value="${r.cuisineType}"/>
                            </p>

                            <p class="restaurant-address">
                                <c:out value="${r.address}"/>
                            </p>

                            <a class="button button-primary button-full"
                               href="${pageContext.request.contextPath}/menu?restaurantId=${r.restaurantId}">
                                Explore menu
                                <span aria-hidden="true">→</span>
                            </a>

                        </div>

                    </article>

                </c:forEach>

            </section>

            <p id="noRestaurants" class="empty-state" hidden>
                No restaurants match that search. Try another cuisine.
            </p>

        </section>

        <section class="bottom-cta">

            <div>
                <span class="eyebrow">YOUR NEXT FAVOURITE IS ONE CLICK AWAY</span>
                <h2>Come hungry. Leave happy.</h2>
            </div>

            <a class="button button-light" href="#restaurants">
                Find your food ↑
            </a>

        </section>

    </main>

    <footer class="site-footer">

        <a class="brand brand-footer" href="${pageContext.request.contextPath}/restaurants">
            <span class="brand-mark">F</span>
            <span>food<span class="brand-accent">app</span></span>
        </a>

        <span>Made with care for people who love good food.</span>

    </footer>

    <script>
        (function() {
            const input = document.getElementById('restaurantSearch');
            const cards = [...document.querySelectorAll('.restaurant-card')];
            const empty = document.getElementById('noRestaurants');

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
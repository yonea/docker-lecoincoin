<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title>Visualisation annonce</title>
</head>

<body>
<a href="#show-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">Liste des annonces</g:link></li>
        <li><g:link class="create" action="create">Nouvelle annonce</g:link></li>
    </ul>
</div>

<div id="show-saleAd" class="content scaffold-show" role="main">
    <h1>Annonce ${saleAd.title}</h1>
</div>

<div style="margin: 0 auto; width: 70%">
    <ol class="property-list saleAd">
        <li class="fieldcontain">
            <span id="title-label" class="property-label">Titre</span>

            <div class="property-value" aria-labelledby="password-label">${saleAd.title}</div>
        </li>
        <li class="fieldcontain">
            <span id="descShort-label" class="property-label">Description courte</span>

            <div class="property-value" aria-labelledby="password-label">${saleAd.descShort}</div>
        </li>
        <li class="fieldcontain">
            <span id="descLong-label" class="property-label">Description longue</span>

            <div class="property-value" aria-labelledby="password-label">${saleAd.descLong}</div>
        </li>
        <li class="fieldcontain">
            <span id="price-label" class="property-label">Prix</span>

            <div class="property-value" aria-labelledby="password-label">${saleAd.price} €</div>
        </li>
        <li class="fieldcontain">
            <span id="illustrations-label" class="property-label">Illustration</span>

            <div class="property-value" aria-labelledby="password-label">
                <g:each status="i" in="${saleAd.illustrations}" var="item">
                    <g:img dir="images" file="${item.filename}" width="70%" height="70%"/>
                </g:each>
            </div>
        </li>
    </ol>
</div>

</body>
</html>

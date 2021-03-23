<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>Création d'une annonce</title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><a class="home" href="${createLink(uri: '/saleAd/index')}">Liste des annonces</a></li>
    </ul>
</div>
<div>
    <h3>L'annonce ${title} à bien été créé.
    </h3>
</div>
</body>
</html>
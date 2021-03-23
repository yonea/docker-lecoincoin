<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>Création d'un compte</title>
</head>
<body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
            <li><a class="home" href="${createLink(uri: '/user/index')}">Liste des utilisateurs</a></li>
        </ul>
    </div>
    <div>
        <h3>
            <bold>
            <g:if test="${role.toString() == "Role(authority:ROLE_ADMIN)"}">
                L'administrateur
            </g:if>
            <g:elseif test="${role.toString() == "Role(authority:ROLE_MOD)"}">
                Le modérateur
            </g:elseif>
            <g:else>
                L'utilisateur
            </g:else>
            </bold>
            ${user.username} à bien été créé.
        </h3>
    </div>
</body>
</html>
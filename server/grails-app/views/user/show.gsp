<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>Visualisation utilisateur</title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
                <li><g:link class="create" action="create">Nouvel utilisateur</g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1>Utilisateur ${user.username}</h1>
        </div>

        <div style="margin: 0 auto; width: 70%">
            <ol class="property-list user">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label">Nom d'utilisateur</span>
                    <div class="property-value" aria-labelledby="password-label">${user.username}</div>
                </li>
                <li class="fieldcontain">
                    <span id="password-label" class="property-label">Rôle</span>
                    <div class="property-value" aria-labelledby="password-label">
                        <g:if test="${user.getAuthorities().toString() == "[Role(authority:ROLE_ADMIN)]"}">
                            Administrateur
                        </g:if>
                        <g:elseif test="${user.getAuthorities().toString() == "[Role(authority:ROLE_MOD)]"}">
                            Modérateur
                        </g:elseif>
                        <g:else>
                            Utilisateur
                        </g:else>
                    </div>
                </li>
            </ol>
        </div>
    </body>
</html>

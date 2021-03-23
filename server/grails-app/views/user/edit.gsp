<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>Modification utilisateur</title>
</head>

<body>
<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
        <li><g:link class="create" action="create">Nouvel utilisateur</g:link></li>
    </ul>
</div>

<div id="edit-user" class="content scaffold-edit" role="main">
    <h1>Modification utilisateur</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <div style="margin: 0 auto; width: 70%">
        <ol class="property-list user">
        <li class="fieldcontain">
            <g:form resource="${this.user}" method="PUT">
                <span id="username-label" class="property-label">Nom d'utilisateur</span>

                <div class="property-value" aria-labelledby="password-label">
                    <input type="text" name="username" value="${user.username}" required="" id="username">
                </div>
                </li>
                <li class="fieldcontain">
                    <span id="password-label" class="property-label">Mot de passe</span>

                    <div class="property-value" aria-labelledby="password-label">
                        <input type="password" name="password" required="" value="${user.password}" id="password">
                    </div>
                </li>
                <li class="fieldcontain">
                    <span class="property-label">Rôle</span>

                    <div class="property-value" aria-labelledby="password-label">
                        <select name="role" id="role">
                            <option value="1"
                                    <g:if test="${user.getAuthorities().toString() == "[Role(authority:ROLE_ADMIN)]"}">selected</g:if>>Administrateur</option>
                            <option value="2"
                                    <g:if test="${user.getAuthorities().toString() == "[Role(authority:ROLE_MOD)]"}">selected</g:if>>Modérateur</option>
                            <option value="3"
                                    <g:if test="${user.getAuthorities().toString() == "[Role(authority:ROLE_USER)]"}">selected</g:if>>Utilisateur</option>
                        </select>
                    </div>
                </li>
                <li class="fieldcontain">
                    <div class="property-value">
                        <fieldset>
                            <input class="save" type="submit" value="Modifier" style="background-color: darkgray; color: white"
                                   onclick="return confirm('Confirmez-vous la modification de l\'utilisateur ${user.username} ?')"/>
                        </fieldset>
                    </div>
                </li>
            </g:form>
        </ol>
    </div>

</div>
</body>
</html>

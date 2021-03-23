<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>Création d'un utilisateur</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
    </ul>
</div>
<div>
    <div>
        <div>
            <g:form resource="${this.user}" url="[action: 'createUser', controller: 'BackEnd']" method="POST">
                <fieldset>
                    <h2>Creation d'un utilisateur</h2><br>

                    <div style="margin: 0 auto; width: 70%">
                        <div>
                            <label>Nom d'utilisateur *</label>
                        </div>

                        <div>
                            <input name="username" id="username" required>
                        </div>

                        <div>
                            <g:if test="${message}">
                                <p style="color:red">L'utilisateur ${username} existe déjà.</p>
                            </g:if>
                        </div>

                        <div>
                            <label>Mot de passe *</label>
                        </div>

                        <div>
                            <input name="password" id="password" required>
                        </div>

                        <div>
                            <label>Role *</label>
                        </div>

                        <div>
                            <select name="role" id="role">
                                <option value="1">Administrateur</option>
                                <option value="2">Modo</option>
                                <option value="3" selected>Utilisateur</option>
                            </select>
                        </div><br>

                        <div>
                            <g:submitButton name="create" class="save" value="Créer"
                                            style="background-color: darkgray; color: white"/>
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>

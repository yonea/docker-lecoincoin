<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>Liste des utilisateurs</title>
    <style type="text/css">
    .title{
        text-align: center;
        font-weight: bold;
    }
    </style>
</head>


<body>

<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="create" action="create">Nouvel utilisateur</g:link></li>
    </ul>
</div>

<div style="margin: 0 auto; width: 70%">
    <h2 style="font-weight: bold;">Liste des utilisateurs</h2><br>
    <table style="background-color: white">
        <tr>
            <td class="title">Utilisateur</td>
            <td class="title">Rôle</td>
            <td></td>
            <td></td>
            <td></td>

        </tr>
        <g:each in="${userList}" var="item">
            <tr>
                <td>${item.username}</td>
                <td>
                    <g:if test="${item.getAuthorities().toString() == "[Role(authority:ROLE_ADMIN)]"}">
                        Administrateur
                    </g:if>
                    <g:elseif test="${item.getAuthorities().toString() == "[Role(authority:ROLE_MOD)]"}">
                        Modérateur
                    </g:elseif>
                    <g:else>
                        Utilisateur
                    </g:else>
                </td>
                <td>
                    <a href="/user/show/${item.getId()}">
                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
                            <path fill-rule="evenodd"
                                  d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                        </svg>
                    </a>
                </td>
                <td>
                    <a href="/user/edit/${item.getId()}">
                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-pencil-square"
                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd"
                                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </a>
                </td>
                <td>
                    <g:link controller="user" action="delete" id="${item.getId()}" onclick="return confirm('Confirmez-vous la suppression de l utilisateur ${item.username} ?');">
                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                            <path fill-rule="evenodd"
                                  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg>
                    </g:link>
                </td>
            </tr>
        </g:each>
    </table>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>
</body>
</html>
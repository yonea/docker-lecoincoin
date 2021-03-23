<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title>Modification annonce</title>
</head>

<body>
<a href="#edit-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">Liste des annonces</g:link></li>
        <li><g:link class="create" action="create">Nouvelle annonce</g:link></li>
    </ul>
</div>

<div id="edit-saleAd" class="content scaffold-edit" role="main">
    <h1>Annonce ${saleAd.title}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.saleAd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.saleAd}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:uploadForm resource="${this.saleAd}" url="[action: 'updateSaleAd', controller: 'BackEnd']">
        <div style="margin: 0 auto; width: 70%">
            <ol class="property-list saleAd">
                <li class="fieldcontain">
                    <div class="property-value" aria-labelledby="password-label">
                        <input style="display: none" type="text" name="idS" value="${saleAd.getId()}" id="idS">
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="title-label" class="property-label">Titre</span>
                    <div class="property-value" aria-labelledby="password-label">
                        <input type="text" name="title" value="${saleAd.title}" required="" id="title">
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="descShort-label" class="property-label">Description courte</span>
                    <div class="property-value" aria-labelledby="password-label">
                        <textarea name="descShort" id="descShort" style="margin: 0; width: 550px; height: 50px;">${saleAd.descShort}</textarea>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="descLong-label" class="property-label">Description longue</span>
                    <div class="property-value" aria-labelledby="password-label">
                        <textarea name="descLong" id="descLong" style="margin: 0; width: 550px; height: 170px;">${saleAd.descLong}</textarea>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="price-label" class="property-label">Prix</span>
                    <div class="property-value" aria-labelledby="password-label">
                        <input min=0 type="number" step=0.01  name="price" id="price" value="${saleAd.price}">
                    </div>
                </li>
                <li class="fieldcontain">
                    <g:each status="i" in="${saleAd.illustrations}" var="item">
                        <span class="property-label">Illustration ${i + 1}</span>
                        <div class="property-value">${item.filename}
                            <input type="checkbox" name="illustration${i}" id="illustration${i}" value="${saleAd.illustrations.getAt(i).getId()}"/><label
                                for="illustration${i}">Supprimer</label><br>
                        </div>
                    </g:each>
                </li>
                <li class="fieldcontain">
                    <span id="illustrations-label" class="property-label">Ajouter une illustration</span>
                    <div id="uploaderfield">
                            <input multiple="true" id ="choseFile" type="file" name="fileInputName"/><br>
                    </div>
                </li>
                <li class="fieldcontain">
                    <div class="property-value">
                        <fieldset>
                            <input class="save" type="submit" value="Modifier"
                                   style="background-color: darkgray; color: white"
                                   onclick="return confirm('Confirmez-vous la modification de l\'annonce ${saleAd.title} ?')"/>
                        </fieldset>
                    </div>
                </li>
            </ol>
        </div>
    </g:uploadForm>

</div>
</body>
</html>

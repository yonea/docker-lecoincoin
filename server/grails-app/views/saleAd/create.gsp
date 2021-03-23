<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title>Création d'annonce</title>
    </head>
    <body>
        <a href="#create-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="list" action="index">Liste des annonces</g:link></li>
            </ul>
        </div>
        <div id="create-saleAd" class="content scaffold-create" role="main">
            <h1>Création d'une annonce</h1>



            <g:uploadForm resource="${this.saleAd}" url="[action: 'createSaleAd', controller: 'BackEnd']" method="POST">
                <fieldset>
                    <div style="margin: 0 auto; width: 70%">
                        <div>
                            <label>Titre *</label>
                        </div>

                        <div>
                            <input name="title" id="title" minlength="5" maxlength="200" required>
                        </div>
                        <div>
                            <label>Description courte *</label>
                        </div>
                        <div>
                            <textarea name="descShort" id="descShort" required style="margin: 0px; width: 550px; height: 50px;"></textarea>
                        </div>
                        <div>
                            <label>Description longue *</label>
                        </div>
                        <div>
                            <textarea name="descLong" id="descLong" required style="margin: 0px; width: 550px; height: 170px;"></textarea>
                        </div>
                        <div>
                            <label>Prix *</label>
                        </div>
                        <div>
                            <input min=0 type="number" step=0.01 name="price" id="price" required>
                        </div>
                        <div>
                            <label>Image *</label>
                        </div>
                        <div id="uploaderfield">
                            <input multiple="true" id ="choseFile" type="file" name="fileInputName"/><br>
                        </div>
                        <div>
                            <g:submitButton name="create" class="save" value="Créer"
                                            style="background-color: gray; color: white"/>
                        </div>
                    </div>
                </fieldset>
            </g:uploadForm>
        </div>
    </body>
</html>

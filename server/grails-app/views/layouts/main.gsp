<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
    <style>
    /*source :https://www.w3schools.com/howto/howto_css_dropdown.asp*/
    .dropbtn {
        background-color: #424649;
        color: white;
        padding: 16px;
        font-size: 18px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #424649;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: gray;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown:hover .dropbtn {
        background-color: #ff6e14;
    }
    </style>
</head>

<body>

<nav class="navbar navbar-default navbar-static-top" style="height: 75px;" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a href="/"
               style="font-weight: bold;color: #ff6e14!important;font-size: 23px!important;"><asset:image style="width: auto;
    height: 50px;" src="lecoincoin-text.png"/>
        </div>

        <div class="navbar" style="float: right">
            <div class="dropdown">
                <a href="/" style="padding: 16px">Accueil</a>
            </div>

            <div class="dropdown">
                <button class="dropbtn">Utilisateur</button>

                <div class="dropdown-content">
                    <a href="/user/index">Liste des utilisateurs</a>
                    <a href="/user/create">Créer un utilisateur</a>
                </div>
            </div>

            <div class="dropdown">
                <button class="dropbtn">Annonce</button>

                <div class="dropdown-content">
                    <a href="/saleAd/index">Liste des annonces</a>
                    <a href="/saleAd/create">Créer une annonce</a>
                </div>
            </div>

            <div class="dropdown">
                <g:link style="padding: 16px" controller='logout'>Logout</g:link>
            </div>
        </div>


        <div class="navbar-collapse collapse" aria-expanded="false">
            <ul class="nav navbar-nav navbar-right">
                <g:pageProperty name="page.nav"/>
            </ul>
        </div>
    </div>
</nav>

<g:layoutBody/>

<!--<div class="footer" role="contentinfo"></div>-->

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

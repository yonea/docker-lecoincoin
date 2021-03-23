# Lecoincoin

Réalisé par Alexis PANZERA et Yoni BAROUKH

Frontoffice : https://lecoincoin-web.herokuapp.com/

Backoffice: https://lecoincoin-serveur.herokuapp.com/

## Fonctionnalités implémentées
### Backend
Accessible sur ```http://localhost:8080/``` à l'exécution.

* Une couche de sécurité donnant l’accès à la partie backend au administrateur et au modérateur.
    * S’identifier / Se déconnecter (login admin : admin/admin | login modérateur : modo/modo)
* Opération CRUD sur les 2 entités :
  * Annonce : Comporte des illustrations qui sont modifiables(ajout/suppression). Les illustrations sont enregistrées dans le dossier ```assets/images```. Elles pourront dans un futur être hébérgées sur un serveur externe (exemple S3) afin de les conserver en cas de panne.
  * Utilisateur : Dans lequel son rôle peut être modifié
* Menu permettant de faciliter la navigation entre les pages.
* L'API ne gère pas encore les images.

### Frontend

Frontend réalisé avec Angular
* Code à partir de la racine du projet : ./Angular
* Formulaire de login pour les clients enregistrés et les nouveaux (formulaire d'inscription)
* Listing des annonces
* Vue détaillée des annonces
* (BONUS) Moteur de recherche permettant de filtrer les annonces

### API

* Documentation API via POSTMAN
* Tests de l'API via POSTMAN
* Prise en compte du format JSON et XML en retour (Ne fonctionne pas par le biais des requêtes faite d'Angular)

### REQUESTS
* Login
  * POST /api/login : connexion

* Annonces
  * GET /api/annonces?id=xxx&offset=x&max=x&q=textreasearch : obtention des annonces
  * POST /api/annonces : création d'une annonce
  * PUT /api/annonces?id=x : mise à jour complète d'une annonce
  * PATCH /api/anonnces?id=x : mise à jour partielle d'une annonce
  * DELETE /api/annonces?id=x : suppression d'une annonce

* Utlisateurs
  * GET /api/utilsateurs?id=xxx&offset=x&max=x : obtention des utilisateurs
  * POST /api/utilsateurs : création d'un utilisateur
  * PUT /api/utilsateurs?id=x : mise à jour complète d'un utilisateur
  * PATCH /api/utilsateurs?id=x : mise à jour partielle d'un utilisateur
  * DELETE /api/utilsateurs?id=x : suppression d'un utilisateur

Dans la partie utilisateurs, les rôles sont attribués uniquement à la création ou via la partie backend ce qui permettra de limiter les risque quant à la distribution de cette API à d'autre personnes.

Adresse de la doc POSTMAN en supposant que le serveur tourne en localhost sur le port 8080 : https://documenter.getpostman.com/view/12791253/TVKBZe5x

Le serveur et le front office sont en cours de déploiement sur Heroku :


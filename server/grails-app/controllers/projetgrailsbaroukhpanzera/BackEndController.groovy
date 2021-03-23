package projetgrailsbaroukhpanzera

import grails.plugin.springsecurity.annotation.Secured


@Secured(value = ["hasAnyRole('ROLE_ADMIN', 'ROLE_MOD')"])
class BackEndController {

    def createUser() {
        def isPresent = checkUser()
        if(isPresent) {
            def message = true
            render(view: "/user/create", model: [username: params.username, message: message])
        } else
        {
            int role = params.role as Integer
            def userRole = Role.get(role)
            def user = new User(username: params.username, password: params.password).save()
            UserRole.create(user , userRole, true)
            render(view: "/backEnd/create", model: [user: user, role: userRole])
        }
    }

    def fileService
    def illustrationService

    def createSaleAd() {
        def fileName = fileExist() as String
        fileService.create(params, fileName)
        def title = params.title
        render(view: "/backEnd/createS", model: [title: title])
    }

    def fileExist() {
        def uploadedFile = request.getFile("fileInputName")
        def fileName = uploadedFile.originalFilename
        if(fileName.isEmpty()) {
            fileName = "noimage.png"
            return fileName
        }else {
            fileService.save(uploadedFile)
            return fileName
        }
    }

    def saleAdService

    def updateSaleAd(){
        def id = params.idS as Integer
        def saleAd = saleAdService.get(id)
        fileService.update(saleAd, params)

        def nbIllustration = saleAd.illustrations.size() as Integer
        for(def i=0; i<nbIllustration; i++){
            if(params.get("illustration" + i) != null){
                def idIllustration = params.get("illustration" + i) as Integer
                illustrationService.removeIllustration(saleAd, idIllustration)
            }
        }
        def uploadedFile = request.getFile("fileInputName")
        def fileName = uploadedFile.originalFilename
        if(!fileName.isEmpty()){
            illustrationService.addIllustration(saleAd, fileName)
        }

        saleAdService.save(saleAd)

        redirect(uri: "/saleAd/show/"+id)
    }


    def checkUser() {
        for(userList in User.list()) {
            if(params.username == userList.username ) {
                return true
            }
        }
        return false
    }

    def index() {
        def a = "a"
        render(view: "/backEnd/index")
    }
}

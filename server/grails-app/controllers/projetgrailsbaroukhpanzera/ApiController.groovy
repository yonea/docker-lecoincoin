package projetgrailsbaroukhpanzera

import grails.converters.JSON
import grails.converters.XML

import grails.validation.ValidationException
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.awt.image.BufferedImage

import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

class ApiController {

    SaleAdService saleAdService
    UserService userService
    def fileService

    private myCustomRender(response, resp){
        response.withFormat {
            json { render resp as JSON }
            xml { render resp as XML }
        }
    }

    private checkUser() {
        List listU = User.findAllByUsername(request.JSON.username);
        println(listU.size() > 0 ? false : true)
        return listU.size() > 0 ? true : false
    }


    def illustration(){
        println(params)
        switch(request.getMethod()){
            case "GET":
                if(params.id) {
                    println(Illustration.get(params.id).filename)
                    render(view: "/api/imageRender", model: [filename: Illustration.get(params.id).filename])
                    return response.status = 200
                }
                else
                    return response.status = 400
                break
            default:
                return response.status = 405

        }
    }

    def utilisateurs() {
//        println(params)
        switch(request.getMethod()){
            case "GET":
                if(params.id == null || !params.id.isInteger()) {
                    myCustomRender(response, userService.list(params))
                }
                else{
                    myCustomRender(response, userService.get(params.id))
                }
                break
            case "POST":
                if(request.JSON.username == null || request.JSON.username.isEmpty() ||
                        request.JSON.password == null || request.JSON.password.isEmpty())
                    return response.status = 400
                if(checkUser()) {
                    return response.status = 409
                }
                def userRole = Role.findByAuthority("ROLE_USER")
                def user = new User(username: request.JSON.username, password: request.JSON.password).save()
                UserRole.create(user , userRole, true)
                return response.status = 200
                break
            case "PUT":
                if(params.id == null || !params.id.isInteger() ||
                        request.JSON.username == null || request.JSON.username.isEmpty() ||
                        request.JSON.password == null || request.JSON.password.isEmpty())
                    return response.status = 400
                else {
                    def user = userService.get(params.id)
                    println(user)
                    if (user == null) {
                        return response.status = 404
                    }
                    user.username = request.JSON.username
                    user.password = request.JSON.password
                    user.save(flush: true)
//                    def newRole = Role.findByAuthority("ROLE_USER")
//                    def newRole = Role.find{authority ==~ "ROLE_" + role.toUpperCase()}
//                    def userRole = UserRole.findByUser(user)
//                    if (userRole.role != newRole){
//                        userRole.delete()
//                        new UserRole(user: user, role: newRole).save(flush: true)
//                    }
                    return response.status = 200
                }

                break
            case "PATCH":
                println(params)
                println(request.JSON)
                if(params.id == null || !params.id.isInteger() ||
                        request.JSON.username == null || request.JSON.username.isEmpty() ||
                        request.JSON.password == null || request.JSON.password.isEmpty())
                    return response.status = 400
                else {
                    def user = userService.get(params.id)
                    println(user)
                    if (user == null) {
                        return response.status = 404
                    }
                    user.username = request.JSON.username != null ? request.JSON.username : user.username
                    user.password = request.JSON.password != null ? request.JSON.password : user.password
                    user.save(flush: true)
//                    def newRole = Role.findByAuthority("ROLE_USER")
//                    def newRole = Role.find{authority ==~ "ROLE_" + role.toUpperCase()}
//                    def userRole = UserRole.findByUser(user)
//                    if (userRole.role != newRole){
//                        userRole.delete()
//                        new UserRole(user: user, role: newRole).save(flush: true)
//                    }
                    return response.status = 200
                }
                break
            case "DELETE":
                if(params.id) {
                    def user = userService.get(params.id)
                    println(user)
                    if (user == null) {
                        return response.status = 404
                    }
                    UserRole.removeAll(user)
                    user.delete(flush: true)
                    return response.status = 200
                }
                else{
                    return response.status = 400
                }
                break
            default:
                return response.status = 405
        }
    }


    def annonces() {
        switch(request.getMethod()){
            case "GET":
                if(params.id == null || !params.id.isInteger()) {
                    String search = ""
                    def query
                    if (params.q != null) {
                        search = params.q
                    }
                    query = SaleAd.where {
                        (title =~ "%" + search + "%" || descShort =~ "%" + search + "%" || descLong =~ "%" + search + "%")
                    }
                    println(params)

                    def resp = [:]
                    resp.data = query.list(params)
                    resp.count = query.count()
                    myCustomRender(response, resp)
                }
                else{
                    myCustomRender(response, saleAdService.get(params.id))
                }
                break
            case "POST":
                if(request.JSON.title == null || request.JSON.title.isEmpty() ||
                        request.JSON.descShort == null || request.JSON.descShort.isEmpty() ||
                        request.JSON.descLong == null || request.JSON.descLong.isEmpty() ||
                        request.JSON.price == null || request.JSON.price.isEmpty())
                    return response.status = 400
                def annonce = new SaleAd(title: request.JSON.title,
                        descShort: request.JSON.descShort,
                        descLong: request.JSON.descLong,
                        price: request.JSON.price
                ).save()
                return request.status = 200
                break
            case "PUT":
                println(request.JSON)
                println(params)
                if(params.id == null || !params.id.isInteger() ||
                        request.JSON.title == null || request.JSON.title.isEmpty() ||
                        request.JSON.descShort == null || request.JSON.descShort.isEmpty() ||
                        request.JSON.descLong == null || request.JSON.descLong.isEmpty() ||
                        request.JSON.price == null || request.JSON.price.isEmpty())
                    return response.status = 400
                def saleAd = saleAdService.get(params.id)
                println("annonce : ")
                println(saleAd)
                if (saleAd == null) {
                    return response.status = 404
                }
                saleAd.title = request.JSON.title
                saleAd.descShort = request.JSON.descShort
                saleAd.descLong = request.JSON.descLong
                saleAd.price = request.JSON.price as float
                println(saleAd as JSON)
                saleAd.save(flush: true)
                return response.status = 200
                break
            case "PATCH":
                if(params.id == null || !params.id.isInteger())
                    return response.status = 400
                def saleAd = saleAdService.get(params.id)
                if (saleAd == null)
                    return response.status = 404
                saleAd.title  = request.JSON.title != null ? request.JSON.title : saleAd.title
                saleAd.descShort = request.JSON.descShort != null ? request.JSON.descShort : saleAd.descShort
                saleAd.descLong = request.JSON.descLong != null ? request.JSON.descLong : saleAd.descLong
                saleAd.price = request.JSON.price != null ? request.JSON.price as float : saleAd.price
                println(saleAd as JSON)
                saleAd.save(flush: true)
                return response.status = 200
                break
            case "DELETE":
                if(params.id && params.id.isInteger()) {
                    def annonce = saleAdService.get(params.id)
                    println(annonce)
                    if (annonce == null) {
                        return response.status = 404
                    }
                    annonce.delete(flush: true)
                    return response.status = 200
                }
                else{
                    return response.status = 400
                }
                break
            default:
                return response.status = 405

        }

    }

}

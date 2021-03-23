package projetgrailsbaroukhpanzera

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(value = ["hasAnyRole('ROLE_ADMIN', 'ROLE_MOD')"])
class SaleAdController {

    SaleAdService saleAdService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
//        respond saleAdService.list(params), model:[saleAdCount: saleAdService.count()]
        String search = ""
        def query
        if(params.q != null) {
            search = params.q
        }
        query = SaleAd.where {
            (title =~ "%" + search + "%" || descShort =~ "%" + search + "%" || descLong =~ "%" + search + "%")
        }
        println(params)

        def resp = [:]
        //resp.data = saleAdService.list(params)
        resp.data = query.list(params)
        resp.count = query.count()
        respond resp , model:[saleAdCount: resp.count, saleAdList: resp.data]

    }

    def show(Long id) {
        respond saleAdService.get(id)
    }

    def create() {
        respond new SaleAd(params)
    }

    def save(SaleAd saleAd) {
        if (saleAd == null) {
            notFound()
            return
        }

        try {
            saleAdService.save(saleAd)
        } catch (ValidationException e) {
            respond saleAd.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*' { respond saleAd, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond saleAdService.get(id)
    }

    def update(SaleAd saleAd) {
        if (saleAd == null) {
            notFound()
            return
        }

        try {
            saleAdService.save(saleAd)
        } catch (ValidationException e) {
            respond saleAd.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), saleAd.id])
                redirect saleAd
            }
            '*'{ respond saleAd, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        saleAdService.delete(id)

        request.withFormat {
            '*'{ flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), id])
                redirect action:"index", method:"GET" }
        }
    }

       //uploadIllustration() {

       //}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleAd.label', default: 'SaleAd'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

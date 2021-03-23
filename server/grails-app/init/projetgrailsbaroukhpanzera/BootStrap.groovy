package projetgrailsbaroukhpanzera

import javax.security.sasl.SaslException

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority : 'ROLE_ADMIN').save()
        def adminInstance = new User( username : 'admin', password : 'admin').save()
        UserRole.create(adminInstance , adminRole, true)

        def modRole = new Role(authority : 'ROLE_MOD').save()
        def userModInstance = new User( username : 'modo', password : 'modo').save()
        UserRole.create(userModInstance , modRole, true)

        def userRole = new Role(authority : 'ROLE_USER').save()
        def userInstance = new User( username : 'user', password : 'user').save()
        UserRole.create(userInstance , userRole, true)

        def userInstance2 = new User( username : 'jean', password : 'jean').save()
        UserRole.create(userInstance2 , userRole, true)

        (1..5).each {
            Illustration illustration = new Illustration(filename: "noimage.png")
            Illustration illustration2 = new Illustration(filename: "velo.jpeg")
            SaleAd saleAd = new SaleAd(title: "title" + it,
                    descShort: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    descLong: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    price: it)
                    .addToIllustrations(illustration)
                    .addToIllustrations(illustration2)
                    .save()
            saleAd.removeFromIllustrations(illustration)
        }
    }
    def destroy = {
    }
}

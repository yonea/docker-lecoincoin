package projetgrailsbaroukhpanzera

import grails.gorm.services.Service

@Service(Illustration)
class IllustrationService {

    def addIllustration(SaleAd saleAd, String filename) {
        saleAd.addToIllustrations(new Illustration(filename: filename)).save()
    }

    def removeIllustration(SaleAd saleAd, Integer id) {
        def illustration = Illustration.get(id)
        saleAd.removeFromIllustrations(illustration)
        illustration.delete()
    }
}

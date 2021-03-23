package projetgrailsbaroukhpanzera

class Illustration {

    String filename

    static belongsTo = [saleAd: SaleAd]

    static constraints = {
        filename nullable: false, blank: false
    }
}

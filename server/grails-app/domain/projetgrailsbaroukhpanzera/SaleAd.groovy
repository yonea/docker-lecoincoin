package projetgrailsbaroukhpanzera

class SaleAd {

    String descShort
    String descLong
    String title
    Float price
    Date dateCreated

    static hasMany = [illustrations: Illustration]


    static constraints = {
        title nullable: false, blank: false, size: 5..200
        descShort nullable: false, blank: false
        descLong nullable: false, blank: false
        price nullable: false
        illustrations nullable: true
    }

    static mapping = {
        descLong type: 'text'
    }
}

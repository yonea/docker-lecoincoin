package projetgrailsbaroukhpanzera

import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile

import java.nio.file.FileSystems

class FileService {

    void save(MultipartFile file){
        def filename = file.originalFilename
        String userDirectory = FileSystems.getDefault()
                .getPath("")
                .toAbsolutePath()
                .toString()
        file.transferTo(new File(userDirectory + '/grails-app/assets/images/' + filename))
    }

    void create(GrailsParameterMap params, String filename) {
        def price = params.get("price") as float

        new SaleAd(title: params.get("title"),
                descShort:  params.get("descShort"),
                descLong: params.get("descLong"),
                price: price)
                .addToIllustrations(new Illustration(filename: filename))
                .save()
    }

    void update(SaleAd saleAd, GrailsParameterMap params) {
        saleAd.setTitle(params.get("title") as String)
        saleAd.setDescShort(params.get("descShort") as String)
        saleAd.setDescLong(params.get("descLong") as String)
        def price = params.get("price") as float
        saleAd.setPrice(price)
    }

}
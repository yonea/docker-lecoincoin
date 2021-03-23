package projetgrailsbaroukhpanzera

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	static constraints = {
		authority nullable: false, blank: false, unique: true, inList: ["ROLE_ADMIN", "ROLE_MOD", "ROLE_USER"]
	}

	static mapping = {
		cache true
	}
}

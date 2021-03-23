

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'projetgrailsbaroukhpanzera.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'projetgrailsbaroukhpanzera.UserRole'
grails.plugin.springsecurity.authority.className = 'projetgrailsbaroukhpanzera.Role'
grails.plugin.springsecurity.requestMap.className = 'projetgrailsbaroukhpanzera.UserRole'
//grails.plugin.springsecurity.securityConfigType = 'Requestmap'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/**',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/api/login',      access: ['permitAll']],
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter'],
	[pattern: '/api/**',         filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter']




]
grails.plugin.springsecurity.rest.login.active=true
grails.plugin.springsecurity.rest.login.endpointUrl='/api/login'
grails.plugin.springsecurity.rest.login.failureStatusCode=401
grails.plugin.springsecurity.rest.login.useJsonCredentials=true
grails.plugin.springsecurity.rest.login.usernamePropertyName='username'
grails.plugin.springsecurity.rest.login.passwordPropertyName='password'
grails.plugin.springsecurity.logout.postOnly = false




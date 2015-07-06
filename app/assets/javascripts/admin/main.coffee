angular.module('keppler', [
	'admin'
	'pageslide-directive'
]).config [
	'$httpProvider'
	(provider) ->
		# permite leer csrf token y añadirlo al ajax de angular para poder autenticar la seguridad de la aplicación
		provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
		return
	]

# iniciar ng-app mediante turbolinks
$(document).on 'ready page:load', () ->		
		angular.bootstrap document.body, [ 'keppler' ] #añadir ng-app al body
		$('#waiting').remove()
		Waves.displayEffect() # agregar el efecto de olas de los botones
		$('.dropdown-button').dropdown() #activar los dropdowns
		$('.tooltipped').tooltip({delay: 1}); #activar tooltips
		$('.collapsible').collapsible({accordion : false}); #activar collapse

		#capturar status de peticion del show-row
		$('.show-row').on('ajax:success', (e, data, status, xhr) ->
	    #console.log status
	    return
	  ).bind 'ajax:error', (e, xhr, status, error) ->
	    $(".listing-show-body").html("<p class='not_found'>Este registro no fue encontrado, por favor recargue la página para actualizar los datos.</p>")
	    return
	return



	
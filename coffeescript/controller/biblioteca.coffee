app.controller 'bibliotecaCrtl',['$scope','$http','$timeout','$location',(scope,http,timeout,location2) ->
	scope.arrarea = []
	scope.arrarea = {}
	scope.arranio = []
	scope.arranio = {}
	scope.arrmes  = []
	scope.arrmes  = {}
	scope.selectedArea = []
	scope.selectedAnio = []
	scope.selectedDist = []
	scope.formData = new FormData()
	scope.url = "../controller/edificio/procesar.php"
	scope.ocultarmensaje = ()->
		$("#new_post .msje").fadeOut('slow')
		if $("#new_post .msje .alert").hasClass('alert-success')
			$("#new_post .msje .alert").removeClass('alert-success')
		if $("#new_post .msje .alert").hasClass('alert-danger')
			$("#new_post .msje .alert").removeClass('alert-danger')
		return
	scope.cargarArea = ()->
		scope.arranio = {}
		scope.arrmes = {}

		url = 'controller/biblioteca/area.php'
		result = http.post(url)
		result.then (response) ->
			scope.arrarea = response.data.arr
			console.log scope.arrarea
			scope.selectedArea = scope.arrarea[0]
			##console.log scope.selectedArea
			return
		return
	scope.cargarProvincia = ()->
		## alert 121
		## console.log scope.selectedDep.id
		scope.arrmes = {}
		if scope.selectedDep? && scope.selectedDep.id? && scope.selectedDep.id != 0
			## alert 2
			url = '../controllers/ubigeo/provincia.php'
			scope.idDpto = scope.selectedDep.id
			data = {
				id : scope.idDpto
			}
			## console.log data
			result = http.post(url,data)
			result.success (response) ->
				## console.log response
				scope.arranio = jQuery.parseJSON(response.arr)
				scope.selectedPro = scope.arranio[0] 
				return
			result.error (error) ->
				console.log(error)
				return
		else
			scope.arranio = {}
			scope.arrmes = {}

		return
	scope.cargarDistrito = ()->
		if scope.selectedPro? && scope.selectedPro.id?
			url = '../controllers/ubigeo/distrito.php'
			data = {
				id : scope.selectedPro.id,
				idDpto : scope.idDpto 
			}
			result = http.post(url,data)
			result.success (response) ->
				## console.log response
				scope.arrmes = jQuery.parseJSON(response.arr)
				scope.selectedDist = scope.arrmes[0] 
				return
			result.error (error) ->
				console.log(error)
				return
		else
			scope.arrmes = {}
		return
	scope.cargarArea()
	## Fin del controlador
	return
]

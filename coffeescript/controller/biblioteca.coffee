app.controller 'inmobiliariaCrtl',['$scope','$http','$timeout','$location',(scope,http,timeout,location2) ->
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
	scope.url = "../controllers/edificio/procesar.php"
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

		url = '../controllers/biblioteca/area.php'
		result = http.post(url)
		result.success (response) ->			
			console.log response
			scope.arrarea = jQuery.parseJSON(response.arr)
			console.log scope.arrarea
			scope.selectedDep = scope.arrarea[0] 
			console.log scope.selectedDep
			return
		result.error (error) ->
			console.log(error)
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
	scope.initUpload = ()->
		url = '../controllers/imagen/subida.php'
		$("#uploader").plupload({
			runtimes : 'html5,flash,silverlight,html4',
			url : url,
			## Maximum file size
			max_file_size : '2mb',

			chunk_size: '1mb',

			## Resize images on clientside if we can
			resize : {
				width : 200, 
				height : 200, 
				quality : 90,
				crop: true ## crop to exact dimensions
			},

			## Specify what files to browse for
			filters : [
				{
					title : "Image files",
					extensions : "jpg,gif,png"
				},
				{
					title : "Zip files",
					extensions : "zip,avi"
				}
			],

			## Rename files by clicking on their titles
			rename: true,

			## Sort files
			sortable: true,

			## Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
			dragdrop: true,

			## Views to activate
			views: {
				list: true,
				thumbs: true, ## Show thumbs
				active: 'thumbs'
			},
			## Flash settings
			flash_swf_url : '/plupload/js/Moxie.swf',

			## Silverlight settings
			silverlight_xap_url : '/plupload/js/Moxie.xap',

			init : {
				FileUploaded: (up, file, info) ->
					## Called when file has finished uploading
					console.log file
					console.log info
					console.log up
					return
				FilesRemoved: (up, files) ->
					##Called when files are removed from queue
					##log('[FilesRemoved]');
					plupload.each(files, (file) ->
						console.log file
						return
					)
					return
			}
		})
		## fin de la funcion
		return
	timeout scope.iniciarlizar, 500
	scope.cargarDepartamento()
	scope.initUpload()
	## Fin del controlador
	return
]

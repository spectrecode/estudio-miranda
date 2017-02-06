app.controller 'inmobiliariaCrtl',['$scope','$http','$timeout','$location',(scope,http,timeout,location2) ->	
	## Mostramos la operación
	scope.arroperacion = []
	scope.arroperacion = {}
	scope.arroperacion = [
		{
			id : 0,
			name : "Seleccione Operación"
		},
		{
			id : 1,
			name : "Venta"
		},
		{
			id : 2,
			name : "Alquiler"
		}
	]
	scope.selectedOpe = scope.arroperacion[0]
	## Mostramos la inmueble
	scope.arrinmueble = []
	scope.arrinmueble = {}
	scope.arrinmueble = [
		{
			id : 0,
			name : "Seleccione Inmueble"
		},
		{
			id : 1,
			name : "Casa"
		},
		{
			id : 2,
			name : "Departamento"
		},
		{
			id : 3,
			name : "Locales"
		},
		{
			id : 4,
			name : "Oficinas"
		},
		{
			id : 5,
			name : "Terrenos"
		}
	]
	scope.selectedInm = scope.arrinmueble[0]

	## Mostramos la etiqueta
	scope.arretiqueta = []
	scope.arretiqueta = {}
	scope.arretiqueta = [
		{
			id : 0,
			name : "Seleccione Etiqueta"
		},
		{
			id : 1,
			name : "Ocación"
		},
		{
			id : 2,
			name : "Oferta"
		},
		{
			id : 3,
			name : "Remato"
		},
		{
			id : 4,
			name : "Exclusivo"
		},
		{
			id : 5,
			name : "Estreno"
		}
	]
	scope.selectedEti = scope.arretiqueta[0]
	## Mostramos la moneda
	scope.arrmoneda = []
	scope.arrmoneda = {}
	scope.arrmoneda = [
		{
			id : 1,
			name : "US$"
		},
		{
			id : 2,
			name : "S/."
		}
	]
	scope.selectedMon = scope.arrmoneda[0]
	## Mostramos el estado
	scope.arrestado = []
	scope.arrestado = {}
	scope.arrestado = [
		{
			id : 1,
			name : "Usado"
		},
		{
			id : 2,
			name : "Estreno"
		}
	]
	scope.selectedEst = scope.arrestado[0]
	## ubigeo
	scope.arrdepartamento = []
	scope.arrdepartamento = {}
	scope.arrprovincia = []
	scope.arrprovincia = {}
	scope.arrdistrito = []
	scope.arrdistrito = {}
	scope.selectedDep = []
	scope.selectedPro = []
	scope.selectedDist = []
	scope.form = []
	scope.form = {}
	scope.idDpto = 0
	## variables
	scope.cambio = 3.35 ## soles
	scope.formData = new FormData()
	scope.url = "../controllers/edificio/procesar.php"
	scope.iniciarlizar = () ->
		## scope.validacion()
		url = '../controllers/edificio/inicializar.php'
		result = http.post(url)
		result.success (response) ->
			## console.log response
			return
		result.error (error) ->
			console.log(error)
			return
		return
	scope.ocultarmensaje = ()->
		$("#new_post .msje").fadeOut('slow')
		if $("#new_post .msje .alert").hasClass('alert-success')
			$("#new_post .msje .alert").removeClass('alert-success')
		if $("#new_post .msje .alert").hasClass('alert-danger')
			$("#new_post .msje .alert").removeClass('alert-danger')
		return
	scope.guardarPropiedad = (datos)->
		## console.log scope.selectedEst.id
		scope.formData.append("titulo",datos.titulo)
		scope.formData.append("selectedOpeId",scope.selectedOpe.id)
		scope.formData.append("selectedInmId",scope.selectedInm.id)
		scope.formData.append("descripcion",datos.descripcion)
		scope.formData.append("selectedEtiId",scope.selectedEti.id)
		scope.formData.append("selectedMonId",scope.selectedMon.id)
		scope.formData.append("precio",datos.precio)

		scope.formData.append("txtArea",datos.txtArea)
		scope.formData.append("txtAreaConstruida",datos.txtAreaConstruida)
		scope.formData.append("txtHabitaciones",datos.txtHabitaciones)
		scope.formData.append("txtBanos",datos.txtBanos)
		scope.formData.append("txtBanosMedios",datos.txtBanosMedios)
		scope.formData.append("selectedEstId",scope.selectedEst.id)
		scope.formData.append("txtAnos",datos.txtAnos)
		scope.formData.append("textCocheras",datos.textCocheras)
		scope.formData.append("textNumPiso",datos.textNumPiso)
		scope.formData.append("textConstruye",datos.textConstruye)
		scope.formData.append("textComercializa",datos.textComercializa)
		scope.formData.append("textFinancia",datos.textFinancia)

		scope.formData.append("filedoc",$("#filedoc")[0].files[0])
		scope.formData.append("embed_video_id",datos.embed_video_id)
		scope.formData.append("embed_video_id2",datos.embed_video_id2)
		scope.formData.append("selectedDepId",scope.selectedDep.id)
		scope.formData.append("selectedProId",scope.selectedPro.id)
		scope.formData.append("selectedDistId",scope.selectedDist.id)
		scope.formData.append("txtVia",datos.txtVia)
		scope.formData.append("txtReferencia",datos.txtReferencia)
		##$("#lat").val()
		##$("#lng").val()
		##$("#formatted_address").val()
		##alert $("#lat").val()
		scope.formData.append("latitud",$("#lat").val())
		scope.formData.append("longitud",$("#lng").val())
		scope.formData.append("formatted_address",$("#formatted_address").val())
		scope.formData.append("property_google_view",datos.property_google_view)
		scope.formData.append("ascensor",datos.ascensor)
		scope.formData.append("areadepo",datos.ad)
		scope.formData.append("abq",datos.abq)
		scope.formData.append("balcon",datos.balcon)
		scope.formData.append("bp",datos.bp)
		scope.formData.append("bs",datos.bs)
		scope.formData.append("cable",datos.cable)
		scope.formData.append("caseta",datos.caseta)
		scope.formData.append("closet",datos.closet)
		scope.formData.append("cocina",datos.cocina)
		scope.formData.append("servicio",datos.servicio)
		scope.formData.append("deposito",datos.deposito)
		scope.formData.append("parque",datos.parque)
		scope.formData.append("independiente",datos.independiente)
		scope.formData.append("internet",datos.internet)
		scope.formData.append("jacuzzi",datos.jacuzzi)
		scope.formData.append("jardin",datos.jardin)
		scope.formData.append("kitchenette",datos.kitchenette)
		scope.formData.append("lavanderia",datos.lavanderia)
		scope.formData.append("patio",datos.patio)
		scope.formData.append("piscina",datos.piscina)
		scope.formData.append("portero",datos.portero)
		scope.formData.append("terraza",datos.terraza)
		scope.formData.append("calle",datos.calle)
		scope.formData.append("txtNombre",datos.txtNombre)
		scope.formData.append("txtApellidoPat",datos.txtApellidoPat)
		scope.formData.append("txtApellidoMat",datos.txtApellidoMat)
		scope.formData.append("txtTelf01",datos.txtTelf01)
		scope.formData.append("txtTelf02",datos.txtTelf02)
		scope.formData.append("txtCorreo",datos.txtCorreo)		
		$.ajax({
			url: scope.url,
			type: "post",
			dataType: "html",
			data: scope.formData,
			cache: false,
			contentType: false,
			processData: false
		}).done((res) ->
			##console.log res
			response = JSON.parse(res)
			$(".flex-form.msje .alert p").html(response.mensaje)
			$("#new_post .msje .alert").addClass(response.class_mess)
			$("#new_post .msje").fadeIn('slow')
			## console.log response
			##alert "se grabo correctamente"
			##$("#new_post")[0].reset()
			if response.bool_inmueble
				alert "Se grabó correctamente"
				top.location.href = 'subir-propiedad.php';
			return 
		)
		timerId = timeout(scope.ocultarmensaje,5000);
		## fin de la funcion
		return
	scope.cargarDepartamento = ()->
		scope.arrprovincia = {}
		scope.arrdistrito = {}

		url = '../controllers/ubigeo/departamento.php'
		result = http.post(url)
		result.success (response) ->			
			console.log response
			scope.arrdepartamento = jQuery.parseJSON(response.arr)
			console.log scope.arrdepartamento
			scope.selectedDep = scope.arrdepartamento[0] 
			console.log scope.selectedDep
			return
		result.error (error) ->
			console.log(error)
			return
		return
	scope.cargarProvincia = ()->
		## alert 121
		## console.log scope.selectedDep.id
		scope.arrdistrito = {}
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
				scope.arrprovincia = jQuery.parseJSON(response.arr)
				scope.selectedPro = scope.arrprovincia[0] 
				return
			result.error (error) ->
				console.log(error)
				return
		else
			scope.arrprovincia = {}
			scope.arrdistrito = {}

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
				scope.arrdistrito = jQuery.parseJSON(response.arr)
				scope.selectedDist = scope.arrdistrito[0] 
				return
			result.error (error) ->
				console.log(error)
				return
		else
			scope.arrdistrito = {}
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

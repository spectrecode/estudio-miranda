// Generated by CoffeeScript 1.10.0
app.controller('bannerCrtl', [
  '$scope', '$location', '$timeout', function(scope, location, timeout) {
    $('.fancybox').fancybox();
    $('.fancybox2').fancybox();
    scope.verMenu = function(e) {
      $("#navMovil").toggle("slow");
    };
    scope.mostrarPopup = function() {
      $("#suscribete").fadeIn("slow");
    };
    scope.ocultarPopup = function() {
      $("#suscribete").fadeOut("slow");
    };
  }
]);

app.controller('desplegarCrtl', [
  '$scope', '$location', '$timeout', function(scope, location, timeout) {
    scope.desplegarTexto = function() {
      if ($("#texto").hasClass("cerrar") === false) {
        $("#texto").addClass("cerrar");
        $(".inner-energia .filtros").css("width", "100%");
        $(".inner-energia .filtros .mesa").css("width", "100%");
      } else {
        $("#texto").removeClass("cerrar");
        $(".inner-energia .filtros").css("width", "auto");
        $(".inner-energia .filtros .mesa").css("width", "auto");
      }
    };
  }
]);

app.controller('bibliotecaCrtl', [
  '$scope', '$http', '$timeout', '$location', function(scope, http, timeout, location2) {
    scope.arrarea = [];
    scope.arrarea = {};
    scope.arranio = [];
    scope.arranio = {};
    scope.arrmes = [];
    scope.arrmes = {};
    scope.selectedArea = [];
    scope.selectedAnio = [];
    scope.selectedDist = [];
    scope.formData = new FormData();
    scope.url = "../controller/edificio/procesar.php";
    scope.ocultarmensaje = function() {
      $("#new_post .msje").fadeOut('slow');
      if ($("#new_post .msje .alert").hasClass('alert-success')) {
        $("#new_post .msje .alert").removeClass('alert-success');
      }
      if ($("#new_post .msje .alert").hasClass('alert-danger')) {
        $("#new_post .msje .alert").removeClass('alert-danger');
      }
    };
    scope.cargarArea = function() {
      var result, url;
      scope.arranio = {};
      scope.arrmes = {};
      url = 'controller/biblioteca/area.php';
      result = http.post(url);
      result.then(function(response) {
        scope.arrarea = response.data.arr;
        console.log(scope.arrarea);
        scope.selectedArea = scope.arrarea[0];
      });
    };
    scope.cargarProvincia = function() {
      var data, result, url;
      scope.arrmes = {};
      if ((scope.selectedDep != null) && (scope.selectedDep.id != null) && scope.selectedDep.id !== 0) {
        url = '../controllers/ubigeo/provincia.php';
        scope.idDpto = scope.selectedDep.id;
        data = {
          id: scope.idDpto
        };
        result = http.post(url, data);
        result.success(function(response) {
          scope.arranio = jQuery.parseJSON(response.arr);
          scope.selectedPro = scope.arranio[0];
        });
        result.error(function(error) {
          console.log(error);
        });
      } else {
        scope.arranio = {};
        scope.arrmes = {};
      }
    };
    scope.cargarDistrito = function() {
      var data, result, url;
      if ((scope.selectedPro != null) && (scope.selectedPro.id != null)) {
        url = '../controllers/ubigeo/distrito.php';
        data = {
          id: scope.selectedPro.id,
          idDpto: scope.idDpto
        };
        result = http.post(url, data);
        result.success(function(response) {
          scope.arrmes = jQuery.parseJSON(response.arr);
          scope.selectedDist = scope.arrmes[0];
        });
        result.error(function(error) {
          console.log(error);
        });
      } else {
        scope.arrmes = {};
      }
    };
    scope.cargarArea();
  }
]);

$(document).ready(function(){
  $(".naranja span").click(function(){
      $(".inner-contenido ul").slideToggle(500, function(){
          if ($(".inner-contenido ul").css("display") != "block") {
            $(".inner-contenido ul").removeClass('hidelist'); 
            $(".naranja span").removeClass("spanUp");
          } else{
            $(".naranja span").addClass("spanUp");
          }
        });
    });
  $(".naranja2 span").click(function(){
      $(".inner-experiencia .hidelist").slideToggle(500, function(){
          if ($(".inner-experiencia .hidelist").css("display") != "block") {
            $(".inner-experiencia .hidelist").removeClass('hidelist'); 
            $(".naranja2 span").removeClass("spanUp");
          } else{
            $(".naranja2 span").addClass("spanUp");
          }
        });
    });

  $("#anio").change(function(){
      var valorAnio;
      valorAnio = $(this).val();
      if (valorAnio == "2017") {
        $("#mes").html("<option>Enero</option>");
      }
      else {
        $("#mes").html("<option>Diciembre</option>"); 
      }
  })
  $("#anio").change(function(){
      var valorAnio;
      valorAnio = $(this).val();
      if (valorAnio == "2017") {
        $("#mes").html("<option>Enero</option>");
      }
      else {
        $("#mes").html("<option>Diciembre</option>"); 
      }
  })
});
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require bootstrap-timepicker.min

//= require_self

function timeBetween(start, end){
    var startdate = Date.parseExact(start, "HH:mm").getTime();
    var enddate = Date.parseExact(end, "HH:mm").getTime();
	var diff = enddate - startdate;
    var seconds = diff/1000;
    var minutes = seconds/60;
	var hour = 0;

	while(minutes >= 60){
		hour++;
		minutes -= 60;
	}
	var rs = new Date();
	rs.setHours(hour);
	rs.setMinutes(minutes);
		return rs;
	}
      $(".btn-copy").click(function(){
		var inputs = $(this).parents("tr").find("td").find("input") ; // as inputs

		var linhaAtual = $(this).parents("tr").next();
		while(linhaAtual.length != 0){
			var prox = linhaAtual.find("td").find("input"); // prox linha inputs
			$(prox.eq(0)).val($(inputs.eq(0)).val());
			$(prox.eq(1)).val($(inputs.eq(1)).val());
			linhaAtual = $(linhaAtual).next();
		}
	});


	$(".btn-calcular").click(function(){
		var linha = $(this).parents("table").find("tr").first().next(); //primeira linha da tablea
		var inputs = linha.find("td").find("input");
		var time = timeBetween(inputs.eq(0).val(), inputs.eq(1).val());
		var horas = time.getHours();
		var minutos = time.getMinutes();
		for(i=0;i<6;i++){// Faz o de terça, quarta, quinta....domingo
			linha = linha.next()
			inputs = linha.find("td").find("input");
			time = timeBetween(inputs.eq(0).val(), inputs.eq(1).val());
			horas+= time.getHours();
			minutos += time.getMinutes();
		}

		$("#total").val(horas + " horas e " + minutos + " minutos")

	});
    $(".timepicker").timepicker({
      showInputs: false, showMeridian: false
    });


      $("input[type='checkbox']").change(function(){
		var inputs = $(this).parents("tr").find("td").find("input[type=time]") ; // as inputs
		$(inputs.eq(0)).prop('readonly', !this.checked);
		$(inputs.eq(1)).prop('readonly', !this.checked);
	});

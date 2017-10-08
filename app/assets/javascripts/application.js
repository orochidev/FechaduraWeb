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

//= require jquery
//= require jquery_ujs

//= require jquery-ui.min
//= require bootstrap.min
//= require app.min

//= require jquery.slimscroll.min
//= require datepicker

//= require date

//= require inputmask
//= require jquery.inputmask
//= require jquery-mask
//= require maskmoney

//= require fastclick.min


//= require_self

$('.table-linkable tr[data-href]').on("click", function() {
	document.location = $(this).data('href');
});

    $(".telefones-fixos").inputmask("(99)9999-9999");
    $(".telefones-celular").inputmask('(99) 9999[9]-9999');
    $(".telefones").inputmask('(99) 9999[9]-9999');

	$(".pis").inputmask("999.99999.99-9")
    $(".cep").inputmask("99999-999");
	$(".inss").inputmask("99.999.99999/9");
    $(".rg").inputmask("99.999.999-a|9");
    $(".cpf").inputmask("999.999.999-99");
    $(".datas").inputmask("99/99/9999");
    $(".cnpj").inputmask("99.999.999/9999-99");
    $(".tempo").inputmask("h:m");

  
    //Date picker
    $('.datas').datepicker({
      autoclose: true
    });

       $('.monetario').maskMoney();

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function() {
   $('.rating input').change(function () {
      var $radio = $(this);
      $('.rating .selected').removeClass('selected');
      $radio.closest('label').addClass('selected');
    }); 
    
    $( "#_rental_end_date_3i, #_rental_end_date_2i " ).change(function() {
         var price_per_day = parseFloat($("#price-per-day").text());
         var start_month = $("#_rental_start_date_2i").val();
         var start_day = $("#_rental_start_date_3i").val();
         var start_year = $("#_rental_start_date_1i").val();
         var end_month = $("#_rental_end_date_2i").val();
         var end_day = $("#_rental_end_date_3i").val();
         var end_year = $("#_rental_end_date_1i").val();
         var start_date = new Date(start_month + "/" + start_day + "/" + start_year);
         var end_date = new Date(end_month + "/" + end_day + "/" + end_year);
         var diff = new Date(end_date - start_date);
         var days = diff/1000/60/60/24;
         var total_price = days * price_per_day
         
         if(total_price < 0) {
            total_price = "Enter a end date after the start date.";
         } else {
            total_price = total_price.toFixed(2);
         }
         
        $( "#total-price" ).val( total_price );
      });
})


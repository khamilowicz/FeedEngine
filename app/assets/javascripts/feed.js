jQuery(document).ready(function($) {
  $('.forms .tabs .tab').on( 'click', function() {
    $('.forms .form').each(function(i, elem) {
      if($(elem).css('z-index') == '10'){
        $(elem).css('z-index', '0');
      }
      else{
        $(elem).css('z-index', '10'); 
      }
    });
  });
});

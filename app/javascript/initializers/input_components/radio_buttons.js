import $ from 'jquery';

export default function(controller) {

  // Handles reloading active state for radio buttons
  var radio_buttons = $('.radio_buttons input');
  $.each(radio_buttons, function(index, input) {
    if ($(input).is(":checked")) {
      $(input).parents('span').addClass('active');
    }
  });

};

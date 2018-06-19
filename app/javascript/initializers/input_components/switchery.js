import 'switchery';

export default function(controller) {

  var Switchery = require('switchery');

  var switches = $("[data-toggle='bs-switchery']");

  $.each(switches, function(index, input) {
    new Switchery(input, {
      speed: '0.1s',
      className: 'switchery',
      color: '#00a8e4'
    });
  });

};

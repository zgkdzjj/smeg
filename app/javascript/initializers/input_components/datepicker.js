import $ from 'jquery';

import 'bootstrap-datepicker';
import 'bootstrap-datepicker/dist/css/bootstrap-datepicker';

export default function(controller) {

  $("[data-toggle='datepicker-default']").datepicker({
    format: 'dd/mm/yyyy'
  });

};

import $ from 'jquery';

import 'inputmask/dist/inputmask/jquery.inputmask';
import 'inputmask/dist/inputmask/inputmask.phone.extensions';
import Inputmask from "inputmask";

export default function(controller) {
  $('input.birth-date').inputmask('date')
  $('input.datepicker-default').inputmask('date')
  $("input.auth_code").inputmask("9999");
};

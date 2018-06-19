import 'shopify-jquery-minicolors/jquery.minicolors.js';
import 'shopify-jquery-minicolors/jquery.minicolors.css';
import $ from 'jquery';

// set default wide settings for sweetalerts
export default function (controller) {
  $("input.minicolors").minicolors({
    changeDelay: 200,
    letterCase: 'uppercase',
    theme: 'bootstrap'
  });
}

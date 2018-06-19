import Colorful from "mixins/colorful"

import "sweetalert2/dist/sweetalert2.css";

// set default wide settings for sweetalerts
export default function (controller) {
  Colorful.call(this);
  swal.setDefaults({
    confirmButtonColor: this.colors.blue
  })
}

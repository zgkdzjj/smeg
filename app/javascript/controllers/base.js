import FlashMessages    from "mixins/flash";
import {displaySuccessFlash, displayErrorFlash} from "servos/ajaxFlash";

class Controller {
  call() {
    document.controller = this

    // EXAMPLE
    // this.flash = { options: { message: 'You have updated your account settings, well done mate.', url: 'http://www.google.com', icon: 'fa fa-check' }, settings: { type: 'info', placement: { from: 'top', align: 'center' } } };

    FlashMessages.call(this, this.flash);

    // Display flash messages from AJAX responses
    displaySuccessFlash.call(this);

    // Display flash messages from AJAX responses
    displayErrorFlash.call(this);
  }
}


export default Controller

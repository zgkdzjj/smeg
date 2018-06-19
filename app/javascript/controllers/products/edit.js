import BaseController from "controllers/base"

import $        from "jquery"
import select2  from "select2"
import "select2/dist/css/select2.min.css"
import "select2-bootstrap-theme/dist/select2-bootstrap.min.css"

class Controller extends BaseController {
  call() {
    // bindSearchFeaturesSelect2.call(this);
  }

};

let bindSearchFeaturesSelect2 = function() {
  let featureSelect = $(this.root.find('select#search_features'))

  featureSelect.select2({
    placeholder: 'Select',
    allowClear: true,
    width: '100%',
    minimumInputLength: 1,
    maximumSelectionLength: 5,
    multiple: true
  });
};

export default Controller;

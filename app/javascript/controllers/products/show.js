import BaseController from "controllers/base"

import $ from "jquery"

class Controller extends BaseController {
  call() {
    bindHistoryModal.call(this);
  }

};

let bindHistoryModal = function() {
  this.root.find('.btn-history').on('click', (e) => {
    e.preventDefault();

    let url = e.target.href

    $.ajax({
      url: url,
      method: 'get',
      dataType: "json"
    }).done((response) => {
      this.root.find('#modal-container').html(response.html)
      this.root.find('#modal-container .modal').modal('show')
    })
  })
}

export default Controller;
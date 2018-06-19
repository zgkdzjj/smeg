import FlashMessages from "mixins/flash";

const displaySuccessFlash = function() {
  $(document).ajaxComplete(function(event, jqxhr, settings) {
    if (settings.method == "GET" || settings.type == "GET") { return }

    let response = jqxhr.responseJSON;

    _.map(response.flash, (message, type) => {
      $("#flash-container").append($("<div>", { id: "flash" }));
      FlashMessages.call(this, { options: { message: message }, settings: { type: type } });
    })
  })
}

const displayErrorFlash = function() {
  $(document).ajaxError(function(event, jqxhr, settings) {
    let response = jqxhr.responseJSON;

    if (jqxhr.status == 403) {
      _.map(response.flash, (message, type) => {
        $("#flash-container").append($("<div>", { id: "flash" }));
        FlashMessages.call(this, { options: { message: message }, settings: { type: type } });
      })
    }

  })
}

export {displaySuccessFlash, displayErrorFlash};

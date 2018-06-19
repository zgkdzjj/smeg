import $ from "jquery";
import "bootstrap-notify";

const FlashMessages = function(custom_flash) {
  if ($.isEmptyObject(custom_flash)) {
    // Flash messages in the view
    let view_flash = $('#flash');

    if (view_flash.length > 0) {
      let default_options   = customFlashOptions.call(this, { message: view_flash.data("message") });
      let default_settings  = customFlashSettings.call(this, { type: view_flash.data("type") });

      flash.call(this, default_options, default_settings);
    }
  } else {
    // Custom flash messages (AJAX responses/manual/etc)
    flash.call(this, customFlashOptions.call(this, custom_flash.options), customFlashSettings.call(this, custom_flash.settings));
  }
}

const flash = function(options, settings) {
  $.notify(options, settings);
}

const customFlashOptions = function(options) {
  return { ...defaultFlashOptions.call(this), ...options };
}

const customFlashSettings = function(settings) {
  // If the type of flash alert is "alert" - a common rails thing, we map this to "danger" for bootstrap
  Object.assign(settings,
    Object.keys(settings)
      .filter(key => (key == "type" && settings[key] == "alert"))
      .map(key => [key, "danger"])
      .reduce((obj, [key, value]) => (obj[key] = value, obj), {})
  )
  return { ...defaultFlashSettings.call(this), ...settings };
}

const defaultFlashOptions = function() {
  return { }
}

const defaultFlashSettings = function() {
  return {
    type: "info",
    allow_dismiss: true,
    placement: {
      from:   "top",
      align:  "center"
    },
    timer: 20000,
  }
}

export default FlashMessages;

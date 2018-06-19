import $        from "jquery"
import select2  from "select2"
import "select2/dist/css/select2.min.css"
import "select2-bootstrap-theme/dist/select2-bootstrap.min.css"

export default function() {
  $(".select2").select2({
    placeholder: 'Select',
    theme: "bootstrap",
  }).on('change', (e) => {
    controller.emit('select2-changed', this)
  })

  $("[data-toggle='multi-select2-fixed']").select2({
    placeholder: '',
    width: '100%',
    multiple: true,
    minimumInputLength: 1,
    allowClear: true,
    tags: false
  })

  $("[data-toggle='multi-select2-accessories']").select2({
    placeholder: 'Please enter values',
    allowClear: true,
    width: '100%',
    minimumInputLength: 1,
    multiple: true,
    tags: true,
    insertTag: function (data, tag) {
      // Insert the tag at the end of the results
      data.push(tag);
    }
  })

  $(".multi-select2").select2({
    multiple: true,
    theme: "bootstrap",
  }).on('change', (e) => {
    controller.emit('select2-changed', this)
  })

  $(".auto-submit-select2").select2({
    placeholder: 'Select',
    allowClear: true,
    theme: "bootstrap",
  }).on('change', (e) => {
    let form = $(e.target).parents('form')
    $.get(form.attr("action"), form.serialize(), null, "script")
    controller.emit('select2-changed', this)
  })
}

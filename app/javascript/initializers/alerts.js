export default function (controller) {
  $(document).ready(function() {
    setTimeout(function() {
      $('.notice, .alert').fadeOut();
    }, 3000);
  })
}

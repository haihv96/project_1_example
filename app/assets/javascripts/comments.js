$(document).ready(function () {
  $('#new_comment').submit(function (event) {
    event.preventDefault();
    var form = $(this);
    var params = form.serialize();
    var method = method_form(form);
    var button_submit = form.find('#submit_new_comment');
    var old_html_button_submit = button_submit.html();
    button_loading_style(button_submit);
    $.ajax({
      type: method,
      url: form.attr('action'),
      data: params,
      dataType: 'json',
      success: function (response) {
      },
      error: function (xhr, ajaxOptions, thrownError) {
        console.log('error...', xhr);
      },
      complete: function () {
        reset_button(button_submit, old_html_button_submit)
      }
    });
    return false;
  });
});

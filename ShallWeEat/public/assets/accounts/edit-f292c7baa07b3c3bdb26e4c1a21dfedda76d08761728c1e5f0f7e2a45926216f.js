(function() {
  var initialize, sendEditPasswordRequest, sendEditProfileRequest;

  $(document).ready(function() {
    return initialize();
  });

  initialize = function() {
    $('#button_edit_password').click(function() {
      return sendEditPasswordRequest();
    });
    return $('#button_edit_profile').click(function() {
      return sendEditProfileRequest();
    });
  };

  sendEditPasswordRequest = function() {
    return $.ajax({
      url: '/account/edit_password',
      type: 'post',
      data: {
        pass_old: $('#input_pass_old').val(),
        pass_new: $('#input_pass_new').val()
      },
      success: function(data) {
        if (data.st === 0) {
          return alert('success!');
        } else {
          return alert('fail');
        }
      },
      error: function() {},
      dataType: 'json'
    });
  };

  sendEditProfileRequest = function() {
    return $.ajax({
      url: '/account/edit_profile',
      type: 'post',
      data: {
        email: $('#input_email').val(),
        gender: $('input:radio[name=gender]:checked').val(),
        birth: $('#input_birth').val()
      },
      success: function(data) {
        if (data.st === 0) {
          return alert('success!');
        } else {
          return alert('fail');
        }
      },
      error: function() {},
      dataType: 'json'
    });
  };

}).call(this);

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .


$( function() {
  $('#sampleButton').click( function () {
    $('#sampleModal').modal();
  });
});


$( function() {
  $('#sampleButton2').click( function () {
    $('#sampleModal2').modal();
  });
});



$(function() {
  $(document).on('click', '.sign_button', function() {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    if ($(this).hasClass('sign_up_button')) {
      $('.sign_up_modal').show();
    } else {
      $('.sign_in_modal').show();
    }
  })

  $(document).on('click', '.sign_modal_wrapper, .fa_wrapper', function() {
    $('.sign_modal_wrapper').hide();
    $('.sign_modal').hide();
    $('.sign_modal_content').hide();
	})
})


$(function() {
  $(document).on('click', '.sign_button2', function() {
    $('.sign_modal_wrapper2').show();
    $('.sign_modal2').show();
    if ($(this).hasClass('sign_up_button2')) {
      $('.sign_up_modal2').show();
    } else {
      $('.sign_in_modal2').show();
    }
  });
});

$(document).on('click', '.sign_modal_wrapper2, .fa_wrapper2', function() {
    $('.sign_modal_wrapper2').hide();
    $('.sign_modal2').hide();
    $('.sign_modal_content2').hide();
})




$(function() {
  $(document).on('click', '.new_button', function() {
    $('.new_modal_wrapper').show();
    $('.new_modal').show();
    $('.test').css('pointer-events','none');
    if ($(this).hasClass('news_button')) {
      $('.news_modal').show();
    
    }
  });
});

$(document).on('click', '.new_modal_wrapper, .new_fa_wrapper', function() {
    $('.new_modal_wrapper').hide();
    $('.new_modal').hide();
    $('.new_modal_content').hide();
    $('.test').css('pointer-events','');
})


$(function() {
  $(document).on('click', '.new_button2', function() {
    $('.new_modal_wrapper2').show();
    $('.new_modal2').show();
    if ($(this).hasClass('news_button2')) {
      $('.news_modal2').show();
    
    }
  });
});

$(document).on('click', '.new_modal_wrapper2, .new_fa_wrapper2', function() {
    $('.new_modal_wrapper2').hide();
    $('.new_modal2').hide();
    $('.new_modal_content2').hide();
})



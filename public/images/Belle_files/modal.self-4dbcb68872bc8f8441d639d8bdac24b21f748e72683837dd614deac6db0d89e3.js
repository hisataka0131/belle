$(function () {
  $('#modal-sign-up').on('click',function(){
  	$('#open-sign-up').fadeIn();
  });
  
  $('.closemodal , #modalbg').on('click',function(){
  	$('.modalarea').fadeOut();
   });
});

$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#submit_tweet').submit(function(e){
    e.preventDefault();
    $('#loading_img').show();
    $('#tweet_button').attr('disabled', 'disabled');
    $.ajax({
      type: "post",
      url: "/",
      data: $('#submit_tweet').serialize(),
      success: function(response){
        $('#tweet_show').html(response);
      },
      error: function(){
        alert('error');
      },
      complete: function(){
        $('#tweet_button').attr('disabled', false );
        $('#loading_img').hide();
      }
    });
  });

});

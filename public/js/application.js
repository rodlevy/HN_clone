$(document).ready(function() {

// wait for a submit click from index page
// on submit, post the url = "/vote/<%=post.id%>/<%=current_user.id%>"
// and the user info   @post_id = params[:post_id]
//   @user_id = params[:user_id]
//   PostVote.create(:user_id => @user_id,
//                   :post_id => @post_id,
//                   :upvoted => true)
//   get rid of the submit

  // $('.submit-form').on('submit', function(event){
  //   event.preventDefault();
  //   var action = $(this).attr('action');
  //   var type = $(this).attr('method');



  //   alert('we are rock stars');

  $('a.post-vote').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href'); // May need to hardcode
    var clickedLink = this;
    var data = {
      "user_id" : $(this).attr('data-user-id'),
      "post_id" : $(this).attr('data-post-id')
    };


    $.post(url, data, function(response, status, jqXHR){
      $(clickedLink).hide();
    }, "json");
  });

  $('a.comment-vote').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href'); // May need to hardcode
    var clickedLink = this;
    var data = {
      "user_id" : $(this).attr('data-user-id'),
      "comment_id" : $(this).attr('data-comment-id')
    };


    $.post(url, data, function(response, status, jqXHR){
      $(clickedLink).hide();
    }, "json");
  });

});

// response here is the response from index.rb -- the return value
// of the post/vote, it's optional, as are status and jqXHR

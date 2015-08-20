$(document).ready(function() {
  createComment()
});

function createComment() {
  $("#new-comment").click(function(event) {
    event.preventDefault();
    var postId = $("#post-id").val();
    var commentParams = { comment: { author: $("#comment-author").val(), body: $("#comment-body").val() } }
    $.ajax({
      type: "POST",
      url: "/posts/" + postId + "/comments",
      data: commentParams,
      success: function(newComment) {
        renderComment(newComment)
      }
    })
    $("#comment-author").val("");
    $("#comment-body").val("");
  })
}

function renderComment(comment) {
  $(".comments").append("" +
    "<div class='comment'>" +
    "<b>" +
    comment.author +
    "</b>:" +
    comment.body +
    "</div>"
  )
}

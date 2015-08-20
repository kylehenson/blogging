$(document).ready(function() {
  $('#draft-posts').click(function() {
    $(".draft-posts").toggle();
    $(".published-posts").toggle();
    $(this).text(function(i, text){
        return text === "published" ? "draft" : "published";
    })
  });

});

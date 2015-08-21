$(document).ready(function() {
  $('#draft-posts').click(function() {
    $(".draft-posts").toggle();
    $(".published-posts").toggle();
    $(this).text(function(i, text){
        return text === "published" ? "draft" : "published";
    })
  });

  $("#title-filter").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".comment-title").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
    $(".comment-title").each(function(){
      if ($(this).text().search(new RegExp(text, "i")) < 0) {
          $(this.parentElement).fadeOut();
      } else {
          $(this).show();
      }
    });
    }
  });

  $("#author-filter").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".comment-author").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
    $(".comment-author").each(function(){
      if ($(this).text().search(new RegExp(text, "i")) < 0) {
          $(this.parentElement).fadeOut();
      } else {
          $(this).show();
      }
    });
    }
  });

});

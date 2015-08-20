$(document).ready(function() {
  $('#draft-posts').click(function() {
    $(".draft-posts").toggle();
    $(".published-posts").toggle();
    $(this).text(function(i, text){
        return text === "published" ? "draft" : "published";
    })
  });

  // $("#title-filter").keyup(function(){
  //   var filter = $(this).val()
  //   if (filter == "") {
  //     $(".task-title").each(function(){
  //       $(this.parentElement).fadeIn();
  //     });
  //   } else {
  //     $(".task-title").each(function(){
  //       debugger;
  //       if ($(this).text().search(new RegExp(filter, "i")) < 0) {
  //           $(this.parentElement).fadeOut();
  //       } else {
  //           $(this).show();
  //       }
  //     });
  //   }
  // });
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

});

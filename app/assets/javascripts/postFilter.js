$(document).ready(function() {
  $('#draft-posts').click(function() {
    $(".draft-posts").toggle();
    $(".published-posts").toggle();
    $(this).text(function(i, text){
        return text === "published" ? "draft" : "published";
    })
  });

  $('.tag-filter').click(function() {
    var filter = $(this).text();
    if (filter === "all") {
      $(".post-tags").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
      $(".post-tags").each(function() {
        if ($(this.children).text().indexOf(filter) > -1) {
          $(this.parentElement).show();
        } else {
          $(this.parentElement).fadeOut();
        }
      });
    }
  });

  // $(".tag-filter").click(function() {
    // $(".post-title").each(function() {
    //   $(this.parentElement).fadeOut();
    // })
    // var tagName = $(this).text()
    // $(".post-tags").each(function(){
    //   debugger;
    //
    //   $(this.parentElement).fadeIn();
    // });
    // $(".post-title").each(function() {
    //   $(this.parentElement).fadeOut()
    //   .then(function() {
    //     $("[data-post-tags=" + tagName + "]").fadeIn();
    //   })
    // })
      // debugger;

    // $(".post-tags").each(function(){
    //
    //   if ( ($(this).text().search(new RegExp(tagName, "i")) < 0)) {
    //     $(this.parentElement).fadeOut();
    //   } else {
    //     $(this.parentElement).show();
    //   }
    // });
  // });

  $("#title-filter").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".post-title").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
    $(".post-title").each(function(){
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
      $(".post-author").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
    $(".post-author").each(function(){
      if ($(this).text().search(new RegExp(text, "i")) < 0) {
          $(this.parentElement).fadeOut();
      } else {
          $(this).show();
      }
    });
    }
  });

});

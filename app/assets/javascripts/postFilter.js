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

  $("#num-of-comments").click(function() {
    var $publishedPosts = $('.published-posts');
    var $post = $publishedPosts.children('.post');

    $post.sort(function(a,b) {
      var aData = a.getAttribute('data-comments');
      var bData = b.getAttribute('data-comments');

      return bData - aData;
    });

    $post.detach().appendTo($publishedPosts)
  });

});

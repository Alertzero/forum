$(function () {
  $(".vote").on("click", ".upvote, .downvote", function () {
    let post_id = $(this).parent().data("id"),
     is_upvote = $(this).hasClass("upvote")
    console.log("clicked " + post_id );

    $.ajax({
      url: "post/vote",
      type:'POST',
      data: { post_id: post_id, upvote: is_upvote },
      success: function(){
        console.log("success");
      }
    });
  });
});

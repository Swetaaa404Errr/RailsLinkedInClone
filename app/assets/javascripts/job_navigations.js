$(function () {
  $(".like-btn").on("click", function () {
    var job_navigation_id = $(this).data("id");

    $.ajax({
      url: "/job_navigations/:id/like" 
      method: "GET",
    }).done(function (response) {
      console.log(response);
    });
  });
});




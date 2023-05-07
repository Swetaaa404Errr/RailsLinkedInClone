import "controllers";
import "trix";
import "@rails/actiontext";
import Rails from "@rails/ujs";
Rails.start();
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;
import "controllers";

//= require jquery
//= require jquery_ujs

// Using jQuery for simplicity, but you can use any JavaScript library or plain JavaScript
$(document).on("click", ".suggested-user button", function () {
  var userId = $(this).closest(".suggested-user").data("user-id");

  $.ajax({
    url: "/remove_suggested_user",
    type: "POST",
    data: { user_id: userId },
    success: function () {
      // Remove the HTML element representing the suggested user from the page
      $(".suggested-user[data-user-id='" + userId + "']").remove();
    },
  });
});

import "@hotwired/turbo-rails";
import "controllers";
import { Application } from "@hotwired/stimulus";
Turbo.session.drive = false;
const application = Application.start();
// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;
export { application };

$(document).ready(function () {
  $(".cv").on("input", function () {
    $("#download").css("display", "block");
  });
});

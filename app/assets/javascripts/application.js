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

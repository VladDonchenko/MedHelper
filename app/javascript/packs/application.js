// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "@fortawesome/fontawesome-free/js/all";
import "@fortawesome/fontawesome-free/css/all";
import "channels"
import "bootstrap"
import "jquery-ui/ui/widgets/autocomplete"
import "./search"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "jquery-ui/ui/widgets/autocomplete"

document.addEventListener("turbolinks:load", function() {
  $(function () {
    setTimeout(function(){
      $(".alert-hidden" ).slideUp(500);
    }, 2000);
  })
})

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .
import Rails from "@rails/ujs"

Rails.start()

var jQuery = require('jquery')
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

require("bootstrap")
require("@fortawesome/fontawesome-free")

import toastr from 'toastr';
toastr.options = {
    progressBar: true
}
global.toastr = toastr

require("./includes/properties");

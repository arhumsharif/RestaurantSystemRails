// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

console.log("acha")

function generateID()
{
    var string=""
    for (var i=0;i<8;i++)
    {
        var digit =  Math.floor(Math.random() * 10);
        string += digit.toString()
    }
    console.log(string)
}
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require("@rails/ujs").start()
//= require("turbolinks").start()
// require("channels")
//= require("jquery")
//= require activestorage
//= require ('puppeteer')
//= require('fs/promises')
//= require_tree .

// import "../functions/slideout.js"

import "bootstrap";
import 'cocoon';
import { reviewStars } from '../functions/stars_review'
import { changeAmounts } from '../functions/change_amounts'
import { slideMenu } from '../functions/slideout'
import { preview } from '../functions/photo_input'
import { fadeOut } from '../functions/alert_fade'
import { nav_search_display } from '../functions/navbar_search'
import { delete_confirmation } from '../functions/delete_confirmation'
// import { snap } from '../functions/snapshot'

reviewStars();
changeAmounts();
slideMenu();
preview();
fadeOut();
nav_search_display();
// delete_confirmation();
// snap();

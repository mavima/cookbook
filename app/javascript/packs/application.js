// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap";
//= require("@rails/ujs").start()
//= require("turbolinks").start()
// require("channels")
//= require("jquery")
//= require activestorage
//= require ('puppeteer')
//= require('fs/promises')

// import "../functions/slideout.js"

import 'cocoon';
import { reviewStars } from '../functions/stars_review'
import { changeAmounts } from '../functions/change_amounts'
import { slideMenu } from '../functions/slideout'
import { preview } from '../functions/photo_input'
import { fadeOut } from '../functions/alert_fade'
import { nav_search_display } from '../functions/navbar_search'
import { sendRecipe } from '../functions/send_recipe'
// import { snap } from '../functions/snapshot'

reviewStars();
changeAmounts();
slideMenu();
preview();
fadeOut();
nav_search_display();
sendRecipe();
// snap();

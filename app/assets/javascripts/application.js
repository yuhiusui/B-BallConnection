//= require rails-ujs
//= require turbolinks
//= require activestorage
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require jquery.raty
//= require jquery.jposta
//= require jquery.uploadThumbs

$(document).ready(function () {
// jpostal
  $(document).on('turbolinks:load', () => {
    $('#court_postal_code').jpostal({
      postcode : [
        '#court_postal_code'
      ],
      address: {
        "#court_prefecture_code": "%3",
        "#court_city"           : "%4%5",
        "#court_street"         : "%6%7"
      }
    });
  });

// jQuery Upload Thumbs
  $('form input:file').uploadThumbs({
      position : 0,      // 0:before, 1:after, 2:parent.prepend, 3:parent.append,
                         // any: arbitrarily jquery selector
      imgbreak : true    // append <br> after thumbnail images
  });
});



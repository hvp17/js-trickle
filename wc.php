<?php
require_once "components/top.php";
?>

    <div class="unit-5 overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">Weekly Challenges</h2>
        <p class="mb-0 unit-6"><a href="index.html">Home</a> <span class="sep">></span> <span>Weekly Challenges</span></p>
      </div>
    </div>

    
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-5 mb-lg-4" data-aos="fade">
            <div class="position-relative unit-8">
            <a href="#" class="d-block col-md-4 mb-3 img-a"><img src="images/img_1.jpg" alt="Image" class="img-fluid rounded"></a>
            <span class="d-block text-gray-500 text-normal small mb-3">By <a href="#">Colorlib</a> <span class="mx-2">&bullet;</span> Jan 20th, 2019</span>
            
            <div class="col-md-4">
            <h2 class="h5 font-weihgt-normal line-height-sm mb-3"><a href="#" class="text-black">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In pariatur nostrum asperiores corrupti delectus.</p>
            </div>
        </div>
            
          </div>
          <div class="col-md-12 mb-5 mb-lg-4 col-lg-3" data-aos="fade">
            <div class="position-relative unit-8">
            <a href="#" class="mb-3 d-block img-a"><img src="images/img_2.jpg" alt="Image" class="img-fluid rounded"></a>
            <span class="d-block text-gray-500 text-normal small mb-3">By <a href="#">Colorlib</a> <span class="mx-2">&bullet;</span> Jan 20th, 2019</span>
            <h2 class="h5 font-weihgt-normal line-height-sm mb-3"><a href="#" class="text-black">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In pariatur nostrum asperiores corrupti delectus.</p>
            </div>
          </div>
          <div class="col-md-12 mb-5 mb-lg-4 col-lg-3" data-aos="fade">
            <div class="position-relative unit-8">
            <a href="#" class="mb-3 d-block img-a"><img src="images/img_3.jpg" alt="Image" class="img-fluid rounded"></a>
            <span class="d-block text-gray-500 text-normal small mb-3">By <a href="#">Colorlib</a> <span class="mx-2">&bullet;</span> Jan 20th, 2019</span>
            <h2 class="h5 font-weihgt-normal line-height-sm mb-3"><a href="#" class="text-black">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In pariatur nostrum asperiores corrupti delectus.</p>
            </div>
          </div>
          
          
         
        </div>



      </div>
    </div>   

    


    
      
    <?php
    require_once "components/bottom.php";
    ?>
    

  <script>
      document.addEventListener('DOMContentLoaded', function() {
                var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

                for (var i = 0; i < total; i++) {
                    new MediaElementPlayer(mediaElements[i], {
                        pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                        shimScriptAccess: 'always',
                        success: function () {
                            var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                            for (var j = 0; j < targetTotal; j++) {
                                target[j].style.visibility = 'visible';
                            }
                  }
                });
                }
            });
    </script>


    <script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&libraries=places&callback=initAutocomplete"
        async defer></script>

  </body>
</html>
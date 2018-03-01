function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var offerLocation = document.getElementById('offer_location');

    if (offerLocation) {
      var autocomplete = new google.maps.places.Autocomplete(offerLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(offerLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

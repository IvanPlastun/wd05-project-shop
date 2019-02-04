
function initMap() {

    let Peterburg = {lat: 59.933280, lng: 30.362593};
    //59.933280, 30.362593
    let map = new google.maps.Map(document.getElementById('map'), {
        center: Peterburg,
        zoom: 10,
        disableDefaultUI: true,
        styles: [{"featureType":"administrative.country","elementType":"geometry","stylers":[{"visibility":"on"},{"hue":"#ff0000"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"hue":"#ff0000"}]}]
    });


    let markerPeterburg = new google.maps.Marker({
        position: Peterburg,
        map: map,
        title: 'Санкт-Петербург'
    });
    markerPeterburg.setMap(map);
}
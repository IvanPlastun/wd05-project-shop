
function initMap() {

    let zelenograd = {lat: 55.987127, lng: 37.202124};
    
    let map = new google.maps.Map(document.getElementById('map'), {
        center: zelenograd,
        zoom: 14,
        disableDefaultUI: true,
        styles: [{"featureType":"administrative.country","elementType":"geometry","stylers":[{"visibility":"on"},{"hue":"#ff0000"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"hue":"#ff0000"}]}]
    });


    let markerZelenograd = new google.maps.Marker({
        position: zelenograd,
        map: map,
        title: 'Зеленоград',
        icon: '../img/location/pin-green.png'
    });
}
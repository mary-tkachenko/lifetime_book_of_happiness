$(document).on('turbolinks:load', function() {
    const form = $('#geolocate_me');
    if (form.length !== 1) {
        return false;
    }

    if (!navigator.geolocation) {
        console.log('Geolocation is not supported by this browser.');
        return false;
    }

    navigator.geolocation.getCurrentPosition(
        (position) => {
            console.log(position.coords.latitude, position.coords.longitude);
            $('#location_latitude').val(position.coords.latitude);
        },
        (error) => {
            console.log(error);
        }
    );
})

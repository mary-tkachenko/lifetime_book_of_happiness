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
            $('#post_latitude').val(position.coords.latitude);
            $('#post_longitude').val(position.coords.longitude);
        },
        (error) => {
            console.log(error);
        }
    );
})

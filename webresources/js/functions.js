function codeTranslate(code) {
    code = parseInt(code);
    switch (code) {
        case 0:
            return 'wi-tornado';
        case 1:
            return 'wi-hurricane';
        case 2:
            return 'wi-hurricane';
        case 3:
            return 'wi-thunderstorm';
        case 4:
            return 'wi-thunderstorm';
        case 5:
            return 'wi-rain-mix';
        case 6:
            return 'wi-rain-mix';
        case 7:
            return 'wi-rain-mix';
        case 8:
            return 'wi-hail';
        case 9:
            return 'wi-sprinkle';
        case 10:
            return 'wi-hail';
        case 11:
            return 'wi-showers';
        case 12:
            return 'wi-showers';
        case 13:
            return 'wi-snow';
        case 14:
            return 'wi-snow';
        case 15:
            return 'wi-snow-wind';
        case 16:
            return 'wi-snow';
        case 17:
            return 'wi-hail';
        case 18:
            return 'wi-hail';
        case 19:
            return 'wi-fog';
        case 20:
            return 'wi-fog';
        case 21:
            return 'wi-fog';
        case 22:
            return 'wi-fog';
        case 23:
            return 'wi-cloudy-gusts';
        case 24:
            return 'wi-cloudy-windy';
        case 25:
            return 'wi-thermometer-exterior';
        case 26:
            return 'wi-cloudy';
        case 27:
            return 'wi-night-cloudy';
        case 28:
            return 'wi-day-cloudy';
        case 29:
            return 'wi-night-cloudy';
        case 30:
            return 'wi-day-cloudy';
        case 31:
            return 'wi-night-clear';
        case 32:
            return 'wi-day-sunny';
        case 33:
            return 'wi-night-clear';
        case 34:
            return 'wi-day-sunny-overcast';
        case 35:
            return 'wi-rain-mix';
        case 36:
            return 'wi-day-sunny';
        case 37:
            return 'wi-thunderstorm';
        case 38:
            return 'wi-thunderstorm';
        case 39:
            return 'wi-thunderstorm';
        case 40:
            return 'wi-thunderstorm';
        case 41:
            return 'wi-snow';
        case 42:
            return 'wi-snow';
        case 43:
            return 'wi-snow';
        case 44:
            return 'wi-day-cloudy';
        case 45:
            return 'wi-storm-showers';
        case 46:
            return 'wi-snow';
        case 47:
            return 'wi-thunderstorm';
        case 3200:
            return 'wi-cloud';
        default:
            return '';
    }
};

function pintarForecast(columna, dia, unidad, capa, diaSemana) {
    $(capa + " .forecast").append('<div class="col-sm-' + columna + ' mb-30 day"><div>' +
        '<div class="mb-10">' + diaSemana + '</div>' +
        '<i class="wi  ' + codeTranslate(dia.code) + ' font-size-30 mb-10"></i>' +
        '<div><i class="wi wi-thermometer"></i> ' + dia.high + 'º' + '<span class="font-size-12">' + unidad + '   </span>' +
        '<i class="wi wi-thermometer-exterior"></i> ' + dia.low + 'º' + '<span class="font-size-12">' + unidad + '</span>' +
        '</div></div></div>');
}
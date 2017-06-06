// Generated by CoffeeScript 1.12.4
var WEATHER, colors;

colors = require('colors');

WEATHER = {
  getWeather: function(options) {
    return new Promise(function(resolve, reject) {
      var apiKey, city, http, units;
      http = require('http');
      city = encodeURIComponent(options.city);
      apiKey = options.api_key;
      units = options.units;
      return http.get({
        host: 'api.openweathermap.org',
        path: "/data/2.5/forecast/?q=" + (encodeURIComponent(city)) + "&APPID=" + apiKey + "&units=" + units
      }, function(res) {
        var body;
        body = '';
        res.on('data', function(d) {
          return body += d;
        });
        return res.on('end', function() {
          return resolve({
            data: JSON.parse(body)
          });
        });
      });
    });
  }
};

module.exports = WEATHER;
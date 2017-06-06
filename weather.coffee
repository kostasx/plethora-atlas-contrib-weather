colors = require 'colors'

WEATHER =

	getWeather: (options)->

		new Promise((resolve, reject)->

			http       = require 'http'
			city       = encodeURIComponent(options.city)
			apiKey     = options.api_key
			units      = options.units

			http.get {

				host: 'api.openweathermap.org'
				path: "/data/2.5/forecast/?q=#{encodeURIComponent(city)}&APPID=#{apiKey}&units=#{units}"

			}, (res) ->

				body = ''
				res.on 'data', (d) -> body += d
				res.on 'end', -> resolve { data: JSON.parse(body) }
		)


module.exports = WEATHER


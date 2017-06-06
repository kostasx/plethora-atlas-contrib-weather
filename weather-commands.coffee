colors = require 'colors'

initCommands = (program)->

	program
		.command('weather')
		.description('Weather Utilities')
		.option('-g, --get-weather <city>', 'Get weather forecast for a give city')
		.action (options) ->

			WEATHER = require('./weather')

			if options.getWeather

				API_KEY    = config.keys.openweathermap.api_key
				units      = "metric" # "imperial"
				units_sign = if units is "metric" then "C" else "F"

				WEATHER.getWeather({ city: options.getWeather, api_key: API_KEY, units: units })
				.then((res)->

					res.data.list.forEach((forecast)->
						console.log forecast.dt_txt, forecast.main.temp, units_sign
					)

				)
				.catch(console.log)

module.exports = initCommands
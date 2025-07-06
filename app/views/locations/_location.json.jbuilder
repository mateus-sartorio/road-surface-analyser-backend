json.extract! location, :id, :latitude, :longitude, :altitude, :accuracy, :bearing, :speed, :timestamp, :speedAccuracy, :bearingAccuracyDegrees, :verticalAccuracyMeters, :created_at, :updated_at
json.url location_url(location, format: :json)

class Key
    def self.key
        Rails.application.credentials.dig(:google_key)
    end

    def self.weatherkey
        Rails.application.credentials.dig(:weather_key)
    end
end
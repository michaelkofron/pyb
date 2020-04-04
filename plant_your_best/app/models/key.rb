class Key
    def self.key
        Rails.application.credentials.dig(:google_key)
    end
end
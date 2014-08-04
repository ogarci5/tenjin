require 'devise/strategies/base'

module Devise
  module Strategies
    # This strategy should be used as basis for authentication strategies. It retrieves
    # parameters both from params or from http authorization headers. See database_authenticatable
    # for an example.
    class Authenticatable < Base

      def parse_authentication_key_values(hash, keys)
        keys.each do |key, enforce|
          value = hash[key].presence
          if key == :username
            self.authentication_hash[key] = value || ''
          elsif value
            self.authentication_hash[key] = value
          else
            return false unless enforce == false
          end
        end
        true
      end

    end
  end
end

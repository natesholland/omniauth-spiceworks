require 'omniauth/strategies/oauth2'
module OmniAuth
  module Strategies
    class Spiceworks < OmniAuth::Strategies::OAuth2

      option :name, 'spiceworks'
      option :client_options, {
        site: 'https://accounts.spiceworks.com'
      }
      uid{raw_info['spiceworks_id']}
      info do
        {
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          name: raw_info['first_name'],
          email: raw_info['email']
        }
      end
      extra do
        {
          'raw_info' => raw_info
        }
      end

      private
      def raw_info
        @raw_info ||= access_token.get('http://www.account.spiceworks.com/api/public/v1/users/user').parsed['user'] || {}
      end

    end
  end
end

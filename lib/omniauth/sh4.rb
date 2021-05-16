# frozen_string_literal: true

require_relative "sh4/version"
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sh4 < OmniAuth::Strategies::OAuth2
      option :name, "sh4"

      option :client_options, {
        :site => 'https://9128cbca6787.ngrok.io/',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"],
          name: raw_info["fullname"]
        }
      end

      extra do
        {
          "raw_info": raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end

#      def callback_url
#        full_host + script_name + callback_path
#      end

    end
  end
end

OmniAuth.config.add_camelization "sh4", "Sh4"

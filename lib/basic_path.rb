require 'rack/auth/abstract/handler'
require 'rack/auth/abstract/request'

module Rack
  module Auth
    class BasicPath < AbstractHandler
      def initialize(app, username, password, *paths)
        @app = app
        @username = username
        @password = password
        @path_regex = Regexp.union(paths)
      end

      def call(env)
        return @app.call(env) unless env['PATH_INFO'].match(@path_regex)

        auth = BasicPath::Request.new(env)

        return unauthorized unless auth.provided?

        return bad_request unless auth.basic?

        if valid?(auth)
          env['REMOTE_USER'] = auth.username

          return @app.call(env)
        end

        unauthorized
      end

      private

      def challenge
        'Basic realm="%s"' % realm
      end

      def valid?(auth)
        [@username, @password] == auth.credentials
      end

      class Request < Auth::AbstractRequest
        def basic?
          "basic" == scheme
        end

        def credentials
          @credentials ||= params.unpack("m*").first.split(/:/, 2)
        end

        def username
          credentials.first
        end
      end

    end
  end
end

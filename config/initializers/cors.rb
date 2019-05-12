    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # in a real world scenario we may be restrictive here
        resource '/visits',
          headers: :any,
          methods: [:post, :options]
      end
    end

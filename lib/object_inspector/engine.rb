require 'object_inspector'
require 'rails'

module ObjectInspector
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      if app.config.serve_static_assets
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
    end

    initializer "f with activerecord" do |app|
      ActiveRecord::Base.include_root_in_json = false

      ActiveRecord::Base.class_eval do
        def class_name
          self.class.name
        end
      end
    end
  end
end

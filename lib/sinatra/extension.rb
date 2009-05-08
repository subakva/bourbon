module Sinatra
  module Bourbon

    def liquid(template = nil, options = {}, &block)
      require 'liquid' unless defined? ::Liquid
      template = block if template.nil?
      self.send(:render, :liquid, template, options)
    end

    def self.included(app)
      original_lookup_layout = app.instance_method(:lookup_layout)

      # This is a little tricky for my taste. Template handling needs to be
      # made extensible in Sinatra.
      app.send(:define_method, :lookup_layout) do |engine, options|
        return if engine == :liquid
        original_lookup_layout.bind(self).call(engine, options)
      end
    end
    
    def render_liquid(template, data, options, &block)
      context = {}

      # Exclude variables that are created by Sintra, these can be explicitly
      # included in the locals.
      #   - One exception is @params, which ought to be accessible in the
      #     template.
      #   - Revisit this if it turns out to be stupid.
      known_sinatra_vars = [
        '@response','@status','@body','@env', '@app', '@block_params',
        '@request'
      ]
      var_names = self.instance_variables - known_sinatra_vars
      var_names.each do |var_name|
        var_value = self.instance_variable_get(var_name)
        context[var_name.gsub(/^@/,'')] = var_value
      end

      # merge explicit locals into the Liquid context
      locals = options[:locals] || {}
      context.merge!(locals)

      t = ::Liquid::Template.parse(data)
      t.render(context)
    end
  end
  helpers Bourbon
end

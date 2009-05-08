require 'sinatra/base'

module Sinatra
  module Bourbon

    def liquid(template = nil, options = {}, &block)
      require 'liquid' unless defined? ::Liquid
      template = block if template.nil?
      options.merge!(:layout => false) # Liquid does not support layouts.
      self.send(:render, :liquid, template, options)
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


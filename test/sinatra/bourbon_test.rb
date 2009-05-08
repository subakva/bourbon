require File.dirname(__FILE__) + '/../helper'

class BourbonTest < Test::Unit::TestCase
  include Webrat::Methods
  include Webrat::Matchers

  if ENV['RACK_ENV'] == 'modular'
    def app
      Bourbon::Tester.tap do |app|
        app.set :environment, :test
        app.set :views, File.join(File.dirname(__FILE__), '..', 'app', 'views')
      end
    end
  end

  def assert_layout_rendered
    assert_contain("I've got your layout right here.")
  end

  def test_liquid_file_template
    visit "/liquid/file"
    assert_contain("This is a Liquid file template, Frank.")
  end

  def test_liquid_inline_template
    visit "/liquid/inline"
    assert_contain("This is an inline Liquid template, Frank.")
  end

  def test_liquid_block_template
    visit "/liquid/block"
    assert_contain("This is a block template, Frank.")
  end

  def test_erb_file_template
    visit "/erb/file"
    assert_layout_rendered
    assert_contain("This is an ERB file template, Frank.")
  end

  def test_erb_inline_template
    visit "/erb/inline"
    assert_layout_rendered
    assert_contain("This is an inline ERB template, Frank.")
  end

end

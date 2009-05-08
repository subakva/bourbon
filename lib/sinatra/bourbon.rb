require 'sinatra/base'

# Two implementation options are included here:
# 1. extension.rb ... The extension ostensibly follows the rules for an
#   extension, but needs to dynamically define a method.
# 2. monkey_patch.rb ... The monkey patch has less magic, but it doesn't use
#   the standard Sinatra extension mechanism.
# 
# Other options:
# 3. Fork Sinatra and add the ability to cleanly implement a template extension.
# 4. It would also be relatively easy to add support for liquid with Sinatra,
#   but a reluctance to add support for another template engine would be
#   understandable.
# 
# Option 3 is probably the best idea. I should do a fork when I get a chance.

require File.join(File.dirname(__FILE__), 'extension')
# require File.join(File.dirname(__FILE__), 'monkey_patch')

begin
	require 'rubygems'
	require 'wirble'

	Wirble.init
	Wirble.colorize
rescue LoadError => err
	warn "Couldn't load Wirble: #{err}"
end

begin
    require 'rubygems'
    require 'interactive_editor'
rescue LoadError => err
    warn "Couldn't load interactive_editor: #{err}"
end

class Object
	def interesting_methods
		(self.methods - Object.new.methods).sort
	end
end

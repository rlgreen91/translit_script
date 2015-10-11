class TranslitMiddleware
	def initialize(appl)
		@appl = appl
	end

	def call(env)
		#we call the inner application passed to the middleware
		status, headers, body = @appl.call(env)
		append_s = "...I promise!!"
		new_body = ""
		body.each { |string| new_body << " " << string }
		new_body << " " << append_s
		[status, headers, [new_body]]
	end

end
class ApplicationController < ActionController::Base
	before_action :print_display_message

	after_action :after_display_message

	private

	def print_display_message
		puts "i am inherited before action filter"
	end

	def after_display_message
		puts "========================"
		puts "i am after action filter"
		puts "========================"
	end
end

class PagesController < ApplicationController

before_action :require_admin, only: [:admin]

	def thankyou

	end

	def about

	end

	def careers

	end

	def contact

	end

	def newsletter

	end

	def terms

	end

	def services

	end

	def directories

    end

	def admin
		set_meta_tags noindex: true
		set_meta_tags noindex: 'googlebot'
	end

private

 def require_admin
      if !current_seller.admin
        redirect_to root_path 
      end
  end
end
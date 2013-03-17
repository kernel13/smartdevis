
class StatementPdf < Prawn::Document
	include ActionView::Helpers::TranslationHelper

	def initialize(statement, view)
		@company = statement.company
		@customer = statement.customer
		@statement = statement
		@view = view

		super(:margin => [20, 10, 10, 10 ], :page_size => "A4")

		# Title (invoice or estimate)
		formatted_text_box  [ { :text => t("statements.index.#{view.controller_name}").upcase, :style => [:bold],
							:size => 30	}
							], :at => [50, 800]


		# Invoice or Estimate date
		formatted_text_box [{ :text => statement.created_at.strftime("%A %d %B %Y"), :styles => [:bold] }], :at => [400, 800]

		# Company Logo
		move_down 80
		image open(@company.logo_url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)

		# Company Address
		move_down 20
		company_address

		# Customer Address		
		bounding_box([350, 700], :width => 250) do
			text @customer.customer_name, :style => :bold
			customer_address
		end

		# Reference
		move_down 180
		text "Reference: #{statement.id.to_s}", :style => :bold, :size => 20, :align => :right

		# Worksites
		worksites
	end

	def company_address
		text @company.address.address_line1
		text @company.address.address_line2
		text @company.address.city + ", " +  @company.address.postal_code.to_s

		text "<b>Phone:</b> " + @company.address.phone.to_s, :inline_format => true
		text "<b>Fax:</b> " + @company.address.fax.to_s, :inline_format => true
		text "<b>Email:</b> " + @company.address.email.to_s, :inline_format => true
	end

	def customer_address
		text @customer.address.address_line1
		text @customer.address.address_line2
		text @customer.address.city + ", " +  @customer.address.postal_code.to_s
		
		text "<b>Phone:</b> " + @customer.address.phone.to_s, :inline_format => true
		text "<b>Fax:</b> " + @customer.address.fax.to_s, :inline_format => true
		text "<b>Email:</b> " + @customer.address.email.to_s, :inline_format => true
	end

	def worksites
		@statement.worksites.each do |worksite|
			move_down 40
			text worksite.reason, :style => :bold, :size => 15
			move_down 20
			text worksite.description

			move_down 20
			table materials(worksite) do
				row(0).font_style = :bold				
				columns(0).width = 250
				columns(1..2).width = 100
				self.row_colors = ["DDDDDD", "FFFFFF"]
				self.header = true				
			end

			move_down 20
			text "Nombre de jour:"
			text "Nombre de Personne: #{worksite.employees.length.to_s}"
		end
	end

	def materials(worksite)
		[["Material", "Quantity", "Total"]] +
		worksite.items.map do |item|
			[item.material.name, item.quantity, @view.number_to_currency(item.totalTF)]
		end
	end

end
module GnomesHelper
   
  def more_link(h)
      if h.description.length > 65
    		link_to_function("more", nil, :id => "1") do |page|
    			page["desc#{h.id}"].replace_html "#{h.description}"
    		end
    	end
  end
end

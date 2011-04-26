module GnomesHelper
  
  def more_link(h)
  	if h.description.length > 65
  		link_to_function("more", nil, :id => "1") do |page|
  			page["desc#{h.id}"].replace_html "#{h.description}"
  		end
  		
  		less_link(h)
  	end
  end
  
  def less_link(h)
    link_to_function("less", nil, :id => "1") do |page|
      page["desc#{h.id}"].replace_html "#{truncate(h.description, :length => 65)}"
    end
    more_link(h)
  end
  
end

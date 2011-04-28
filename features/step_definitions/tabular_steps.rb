Then /^(?:|I )should see the following table:$/ do |table|
  body = Nokogiri(page.body)
  table.hashes.each_with_index do |hash, row|
    hash.each do |title, value|
      heading = body.xpath("//table//th[contains(., '#{title}')]").first
      unless heading
        heading = body.xpath("//table//th/a[contains(., '#{title}')]").first.try(:parent)
      end
      raise "No such heading: #{title}" unless heading
      column = heading.parent.children.reject(&:blank?).index(heading)
      page.should have_xpath("//tr[#{row+1}]/td[#{column+1}]/descendant-or-self::*[contains(normalize-space(.), '#{value}')]")
    end
  end
end

Then /^(?:|I )should see the following list:$/ do |table|
  table.raw.each_with_index do |element, i|
    page.should have_xpath("//li[#{i+1}][contains(., '#{element.first}')] | //li[#{i+1}]/a[contains(., '#{element.first}')]")
  end
end

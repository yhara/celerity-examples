require 'celerity'
require 'spec'
require 'hpricot'
#
# Executed before every scenario
#
Before do
  @browser = Celerity::IE.new
end

#
# Exceucted after every scenario
#
After do
  @browser.close
end


When "I visit the home page" do
  @browser.goto('http://localhost:7000')
end

When "I visit a page with javascript running on page load" do
  @browser.goto('http://localhost:7000/on_page_load')
end

When "I visit a page with javascript run after clicking a button" do
  @browser.goto('http://localhost:7000/buttons_with_javascript')
end

When "I visit a page making an AJAX call returning text" do
  @browser.goto('http://localhost:7000/page_for_ajax_call_returning_text')
end

When "I visit a page making an AJAX call returning javascript, executed automatically" do
  @browser.goto('http://localhost:7000/page_for_ajax_executing_the_response_automatically')
end

When "I visit a page making an AJAX call returning javascript and eval the response" do
  @browser.goto('http://localhost:7000/page_for_ajax_evaling_the_response')
end

When "I press 'Push me'" do
  @browser.buttons.first.click
end

When "I wait for the AJAX call to finish" do
  @browser.page.getEnclosingWindow().getThreadManager().joinAll(10000)
end

Then /^I should see "(.*)"$/ do |text|
  @browser.html.should  =~ /#{text}/m
end

Then /^I should see a secret message "(.*)"$/ do |text|
  doc = Hpricot(@browser.page.as_xml)
  doc.search('#secret_message').text.should =~ /#{text}/m
end

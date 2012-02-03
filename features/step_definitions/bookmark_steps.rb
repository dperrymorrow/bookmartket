Given /^the following bookmarks:$/ do |bookmarks|
  Bookmark.create!(bookmarks.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) bookmark$/ do |pos|
  visit bookmarks_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following bookmarks:$/ do |expected_bookmarks_table|
  expected_bookmarks_table.diff!(tableish('table tr', 'td,th'))
end

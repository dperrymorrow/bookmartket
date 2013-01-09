

class Import

  def self.import_bookmarks(html)

    bookmarks = []
    doc = Nokogiri::HTML(html)
 
    # Ensure we're dealing with the correct format
    unless doc.internal_subset.name == "NETSCAPE-Bookmark-file-1"
      puts "Import failed, not Netscape Bookmark format"
      return
    end
 
    doc.xpath('//dt/a').each do |node|
 
      bookmark_url = node.attr('href')
      bookmark = Bookmark.new(:user => User.get_current_user, :title => node.inner_html, :url => node.attr("href"))
 
      if bookmark.save
 
        # Associate tags (parent folders)
        node.xpath('ancestor::dl').xpath('preceding-sibling::dt/h3').each do |d|
          tag = Tag.find_or_create(:name => d.text, :user => User.get_current_user)
          bookmark.tags << tag
        end
        bookmarks << bookmark
      end
    end
 
    bookmarks


    # doc = Nokogiri::HTML(html)
    # bookmarks = []
    # doc.search('h3').each do |tag|

    #   tag = Tag.find_or_create(:user => User.get_current_user(), :name => tag.inner_html)
    #   doc.search("a").each do |mark|
    #     bookmark = Bookmark.new(:user => User.get_current_user(), :title => mark.inner_html, :url => mark.attr("href"))

    #     if bookmark.save
    #       bookmark.tags << tag
    #       bookmarks << bookmark
    #     end
    #   end
    # end

    # bookmarks
  end
end

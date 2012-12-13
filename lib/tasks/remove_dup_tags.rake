namespace :db do

  desc 'Remove duplicate tags'

  task :remove_dup_tags => :environment do
    User.find(:all).each do |user|

      user.tags.each do |tag|
        set = Tag.where(:name => tag.name)

        set.each_with_index do |set_tag, index|
          set_tag.destroy if index > 0
        end
      end
    end
  end
end

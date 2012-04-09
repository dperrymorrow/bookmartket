class NotesTag < ActiveRecord::Base
  belongs_to :note
  belongs_to :tag
end
class Note < ApplicationRecord
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


    def visible_to=(my_readers)
      self.readers = my_readers.split(',').map do |name|
        User.find_by(name: name.strip)
      end.compact
    end


    def visible_to
      readers.map { |u| u.name }.join(', ')
    end
end

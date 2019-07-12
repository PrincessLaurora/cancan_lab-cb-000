class Note < ApplicationRecord
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

    before_save :ensure_owner_can_read

    def visible_to=(my_readers)
      self.readers = my_readers.split(',').map do |name|
        User.find_by(name: name.strip)
      end.compact
    end


    def visible_to
      readers.map { |u| u.name }.join(', ')
    end

    private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end

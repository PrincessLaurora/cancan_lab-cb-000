# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= user.new

    can :read, Note do |note|
      note.readers.include?(user)
    end
    can :read, Note do |note|
      note.user_id == user.id
    end
    can :update, Note do |note|
       note.user_id == user.id
    end
  end
end


 #or
 #can :read, Note do |note|
   #note.readers.include?(user)
 #end
 #can :manage, Note, {user_id: user.id}
 #end
#end

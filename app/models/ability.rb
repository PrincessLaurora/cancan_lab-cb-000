# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    

    can :manage, Note, {user_id: user.id}

    can :read, Note do |note|
      note.readers.include?(user)
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

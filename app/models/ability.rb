# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.role=='admin'
        can :manage, :all
      else
        can :manage, Group, user_id: user.id
        can :manage, Entity, author_id: user.id
      end
  end
end

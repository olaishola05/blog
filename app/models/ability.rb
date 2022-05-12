# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      can :read, Post
      can :read, Comment
      admin_privilege if user.is? :admin
      user_privilege(user) if user.is? :default
      manager_privilege if user.is? :manager
      moderator_privilege if user.is? :moderator
  end

  private

  def user_privilege(user)
    can :manage, Post, user_id: user.id
    can :create, [Comment, Like]
    can :update, [Post, Comment], user_id: user.id
    can :destroy, [Post, Comment], user_id: user.id
  end

  def manager_privilege
    can :manage, Comment
  end

  def moderator_privilege
    can :delete, [Post, Comment]
  end

  def admin_privilege
    can :manage, all
  end
end

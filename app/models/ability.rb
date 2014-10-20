class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    #if user.has_role? :admin
    #  can :manage, :all
    #  cannot :create, [User]
    #  can [:finish_signup, :update], [:users]
    #end

    if user.get_user_roles_name == 'admin'
      can :manage, :all
    else
      if user.get_user_roles_name == 'moderator'
        can :manage, Block
        can :update, Item
      else
        if user.get_user_roles_name == 'user'
          can :manage, Item, :user_id => user.id

          can [:read, :update], User, :id => user.id

          can [:modal, :modal_contact], User

          can :index, [Age, Region, State, Tag, Type]

          can :manage, Tagging, :item_id => user.item_ids
          can :new, Tagging
          cannot :index, Tagging

          can :manage, Block, :user_id => user.id
          cannot :index, Block

          can :destroy, BatchBlock, :user_ud => user.id

          can :manage, Want, :user_id => user.id
          cannot [:index], Want

          can [:read, :create], Swap, :user1_id => user.id
          cannot [:index], Swap
        else #read-only
          can :index, Region
        end
      end
    end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

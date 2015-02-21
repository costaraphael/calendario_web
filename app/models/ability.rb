class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin
      can :manage, :all
    else
      can :manage, Calendario, campus_id: user.campus.id
      can :manage, Evento
      can :read, Campus, id: user.campus.id
    end
  end
end

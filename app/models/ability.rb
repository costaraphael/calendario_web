class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin
      can :manage, :all
      cannot :manage, Usuario, id: user.id
    else
      can :manage, Calendario, campus_id: user.campus.id
      can :manage, Evento, calendario: {campus_id: user.campus.id}
      can [:new, :create], Evento
    end
  end
end

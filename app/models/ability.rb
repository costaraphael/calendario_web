class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin
      can :manage, :all
    else
      can :all, Calendario, campus_id: user.campus.id
      can :all, Evento, calendario: {campus_id: user.campus.id}
      can :read, Campus, id: user.campus.id
    end
  end
end

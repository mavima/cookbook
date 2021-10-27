class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def search?
    true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def destroy?
    record.user == user || user.admin
  end

  def update?
    if user == nil
      false
    elsif record.user == user || user.admin
      true
    end
  end

end

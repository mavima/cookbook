class CommentPolicy < ApplicationPolicy
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
    record.user == user || user.admin
  end
end

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

  def edit?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user || user.admin
  end

  def update?
    record.user == user || user.admin
  end
end

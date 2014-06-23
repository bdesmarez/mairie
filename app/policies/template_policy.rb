class TemplatePolicy
  attr_reader :user, :record

  def initialize(user, record)
  	raise Pundit::NotAuthorizedError, "Must be signed in." unless user
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def new?
  	@user.admin?
  end

  def create?
  	@user.admin?
  end

  def edit?
  	update?
  end

  def destroy?
    @user.admin?
  end

end

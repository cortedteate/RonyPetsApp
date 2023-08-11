class UsersPolicy
    def initialize(user)
      @user = user
    end
  
    def allowed?
      admin? || editor?
    end
  
    def editor?
      @user.where(editor: true)
    end
  
    def admin?
      @user.where(admin: true)
    end
  end
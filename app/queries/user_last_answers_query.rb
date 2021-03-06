class UserLastAnswersQuery
  ANSWERS_NUMBER = 5

  def initialize(user)
    @user = user
  end

  def call
    Answer.where(user: @user)
      .order(created_at: :desc)
      .limit(ANSWERS_NUMBER)
  end
end

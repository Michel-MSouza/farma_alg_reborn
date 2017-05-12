require 'rails_helper'
require 'utils/similarity_machine/users/users_questions_calculator'

describe SimilarityMachine::Users::UsersQuestionsCalculator do
  before do
    @question = create(:question)
    @team = create(:team)
  end

  describe '#questions_similarity' do
    context "when questions aren't informed" do
      subject {
        stubbed_calculator(*create_pair(:user)).questions_similarity([])
      }

      it { expect { subject }.to raise_error(ArgumentError) }
    end

    context "when questions are informed" do
      context "when none answers of the users have its similarity calculated already" do
        subject {
          stubbed_calculator(
            *users_without_answers_similarity_calculated
          ).questions_similarity([@question])
        }

        it { is_expected.to eq 0 }
      end

      context "when some users answers have its similarity calculated already" do
        context "when they're completely similar" do
          subject {
            stubbed_calculator(
              *users_with_completely_similar_answers
            ).questions_similarity([@question])
          }

          it { is_expected.to eq 100 }
        end

        context "when they're similar in some level" do
          subject {
            stubbed_calculator(
              *users_with_similar_answers
            ).questions_similarity([@question])
          }

          it { is_expected.to eq 75 }
        end

        context "when they're completely different" do
          subject {
            stubbed_calculator(
              *users_with_completely_different_answers
            ).questions_similarity([@question])
          }

          it { is_expected.to eq 0 }
        end
      end
    end
  end

  def stubbed_calculator(user_1, user_2)
    object = Object.new.extend(described_class)
    object.instance_variable_set(:@user_1, user_1)
    object.instance_variable_set(:@user_2, user_2)
    object.instance_variable_set(:@team, @team)
    object
  end

  def users_without_common_questions(team)
    team = create(:team)
    users = create_pair(:user)
    users.each { |user| create(:answer, team: team, user: user) }
    users
  end

  def users_without_answers_similarity_calculated
    users = create_pair(:user)
    users.each { |user|
      create(:answer, team: @team, user: user, question: @question)
    }
    users
  end

  def users_with_completely_similar_answers
    users = create_pair(:user)
    answers = answers_to_create_connections(
      users: users, team: @team, question: @question
    )
    create(
      :answer_connection,
      answer_1: answers[:user_1][0],
      answer_2: answers[:user_2][0],
      similarity: 100
    )

    users
  end

  def users_with_completely_different_answers
    users = create_pair(:user)
    answers = answers_to_create_connections(
      users: users, team: @team, question: @question
    )
    create(
      :answer_connection,
      answer_1: answers[:user_1][0],
      answer_2: answers[:user_2][0],
      similarity: 0
    )

    users
  end

  def users_with_similar_answers
    users = create_pair(:user)
    answers = answers_to_create_connections(
      users: users, team: @team, question: @question
    )
    create(
      :answer_connection,
      answer_1: answers[:user_1][0],
      answer_2: answers[:user_2][0],
      similarity: 50
    )
    create(
      :answer_connection,
      answer_1: answers[:user_1][0],
      answer_2: answers[:user_2][1],
      similarity: 100
    )

    users
  end

  def answers_to_create_connections(users:, team:, question:)
    answers = {}
    answers[:user_1] = create_pair(
      :answer, team: team, user: users[0], question: question
    )
    answers[:user_2] = create_pair(
      :answer, team: team, user: users[1], question: question
    )

    answers
  end
end

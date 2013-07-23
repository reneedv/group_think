class JoinUsersAndQuestions < ActiveRecord::Migration
  def change
    create_table :questions_users, id: false do |t|
      t.references :user
      t.references :question
    end
  end
end

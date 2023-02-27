# frozen_string_literal: true

class CreateCommentPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_posts do |t|
      t.string :body, null: false
      t.references :job_navigation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

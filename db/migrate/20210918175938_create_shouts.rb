# frozen_string_literal: true

class CreateShouts < ActiveRecord::Migration[6.1]
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

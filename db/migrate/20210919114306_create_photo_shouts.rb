# frozen_string_literal: true

class CreatePhotoShouts < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_shouts, &:timestamps
  end
end

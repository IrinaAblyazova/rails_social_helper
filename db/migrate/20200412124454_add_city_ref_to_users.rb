# frozen_string_literal: true

class AddCityRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :city, foreign_key: true
  end
end

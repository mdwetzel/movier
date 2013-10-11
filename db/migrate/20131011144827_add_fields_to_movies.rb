class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :title, :string
    add_column :movies, :year, :integer
    add_column :movies, :url, :string
  end
end

class AddMetascoreToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :metascore, :integer
  end
end

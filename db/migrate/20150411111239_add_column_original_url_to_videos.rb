class AddColumnOriginalUrlToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :original_url, :string
  end
end

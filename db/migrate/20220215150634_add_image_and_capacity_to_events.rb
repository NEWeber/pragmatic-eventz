class AddImageAndCapacityToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :image_file_name, :string, default: "placeholder.png"
    add_column :events, :capacity, :interger, default: 1
  end
end

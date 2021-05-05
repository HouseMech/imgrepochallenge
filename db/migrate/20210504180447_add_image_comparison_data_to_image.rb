class AddImageComparisonDataToImage < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :fingerprint, :text
  end
end

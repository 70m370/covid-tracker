class AddDetailsToResults < ActiveRecord::Migration[8.0]
  def change
    add_column :results, :details, :json
  end
end

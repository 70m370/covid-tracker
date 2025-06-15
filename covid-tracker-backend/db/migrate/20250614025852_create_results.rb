class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :covid_benchmark, null: false, foreign_key: true
      t.string :worse
      t.string :comparison_metric

      t.timestamps
    end
  end
end

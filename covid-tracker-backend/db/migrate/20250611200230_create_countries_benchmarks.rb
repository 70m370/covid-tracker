class CreateCountriesBenchmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :countries_benchmarks do |t|
      t.string :name
      t.string :coutrny_1
      t.string :country_2
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

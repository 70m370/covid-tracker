class CreateCovidBenchmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :covid_benchmarks do |t|
      t.string :name
      t.string :first_state
      t.string :second_state
      t.string :first_city
      t.string :second_city
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end

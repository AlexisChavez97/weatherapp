class CreateWeatherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_reports do |t|
      t.string :iata_code
      t.string :city_name
      t.string :condition
      t.string :time
      t.string :temperature
      t.string :latitude
      t.string :longitude
      t.string :icon
      t.belongs_to :user, index: true, foreign_key: true

      t.index :city_name
      t.timestamps
    end
  end
end

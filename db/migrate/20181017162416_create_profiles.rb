class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :about, default: ''
      t.text :goals, default: ''
      t.text :timeSpent, default: ''
      t.text :values, default: ''
      t.text :education, default: ''
      t.text :pastCities, default: ''
      t.text :children, default: ''
      t.text :pets, default: ''
      t.string :gender, default: ''
      t.text :afterWorkTimeSpend, default: ''
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

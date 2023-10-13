class CreateConsultationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_requests do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :text
      t.date :date

      t.timestamps
    end
  end
end

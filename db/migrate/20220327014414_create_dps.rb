class CreateDps < ActiveRecord::Migration[6.0]
  def change
    create_table :dps do |t|
      t.string     :name          , null: false
      t.string     :product_number, null: false
      t.string     :jan_code
      t.string     :client
      t.string     :confirm_date
      t.integer    :source_id     , null: false
      t.string     :occurrence_date
      t.string     :lotnumber
      t.string     :return_id
      t.integer    :category_id    , null: false
      t.text       :content
      t.text       :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

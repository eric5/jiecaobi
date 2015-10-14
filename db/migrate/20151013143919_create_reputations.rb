class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.references :receiver, class: :user, index: true
      t.references :sender, class: :user
      t.string :reason

      t.timestamps null: false
    end
  end
end

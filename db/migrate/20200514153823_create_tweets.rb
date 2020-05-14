class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :user
      t.text :content

      t.timestamps
    end
  end
end

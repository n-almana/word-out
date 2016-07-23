class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|

    	t.references(:following_user)
      	t.references(:followed_user)

      t.timestamps null: false
    end
  end
end

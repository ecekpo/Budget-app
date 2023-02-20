class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F285655%2Fuser_icon&psig=AOvVaw37joxjOi9Q-l0wVxr1h-Fm&ust=1677000866763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKDu9tTRpP0CFQAAAAAdAAAAABAE'
      t.references :author, null: false, foreign_key: {to_table: users}

      t.timestamps
    end
  end
end

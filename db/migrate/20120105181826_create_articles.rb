class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description

      t.timestamps

      t.references :user
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	#create_table :posts do |t|
      t.string :post_name
      t.string :post_image_id
      t.text :post_opinion
      t.string :category

      t.timestamps
    end
  end
end

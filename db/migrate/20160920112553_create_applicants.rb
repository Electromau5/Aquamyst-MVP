class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
    	t.string :name
    	t.string :email
    	t.string :location
    	t.text 	 :description
    	t.string :category
    	t.string :site
    	t.timestamps
    end
  end
end

class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :github
      t.string :twitter
      t.boolean :local
      t.boolean :willing_to_relocate
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end

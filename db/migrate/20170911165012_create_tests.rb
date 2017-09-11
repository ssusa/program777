class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :gengo_cd
      t.string :gengo_nm
      t.timestamps
    end
  end
end

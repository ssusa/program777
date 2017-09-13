#coding: utf-8
class CreateSamplesTaskKanriTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :samples_task_kanri_tasks do |t|
      t.string :name
      t.string :shosai
      t.datetime :kigen
      t.boolean :kanryo
      t.timestamps
    end
  end
end

class ChangeBooleanColumn < ActiveRecord::Migration[7.0]
  def change
    def change
      change_table :table do |t|
         t.boolean :field, default: false
      end
   end
  end
end

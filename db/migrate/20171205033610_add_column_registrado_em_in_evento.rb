class AddColumnRegistradoEmInEvento < ActiveRecord::Migration[5.1]
  def change
    add_column :eventos, :registrado_em, :datetime

  end
end

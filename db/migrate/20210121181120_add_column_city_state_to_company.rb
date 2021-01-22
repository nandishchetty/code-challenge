class AddColumnCityStateToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :city, :string, default: nil
    add_column :companies, :state, :string, default: nil
    add_column :companies, :color, :string, default: nil
  end
end

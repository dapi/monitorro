class AddStatusToPaymentSystems < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_systems, :status, :integer, null: false, default: 0
  end
end

class BindWeixinToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :telephone, :string
    add_column :users, :weixin_name, :string
    add_column :users, :company_id, :integer
  end

end

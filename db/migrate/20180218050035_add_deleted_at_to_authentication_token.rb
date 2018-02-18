class AddDeletedAtToAuthenticationToken < ActiveRecord::Migration[5.1]
  def change
    add_column :authentication_tokens, :deleted_at, :datetime
  end
end

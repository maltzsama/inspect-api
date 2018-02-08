class CostumerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cnpj, :address, :contact, :fone
end

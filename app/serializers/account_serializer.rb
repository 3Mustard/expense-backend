class AccountSerializer < ActiveModel::Serializer
  has_many :transactions
  attributes :id, :name, :balance
end

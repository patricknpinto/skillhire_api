class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username

  attribute :errors, if: proc { |record| record.errors.any? }
end

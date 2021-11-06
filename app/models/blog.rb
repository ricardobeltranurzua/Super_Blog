class Blog < ApplicationRecord

  validates :name, :description, presence: {message: "Este campo es requerido"}
end

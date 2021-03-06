# == Schema Information
#
# Table name: animals
#
#  id          :bigint           not null, primary key
#  name        :string
#  kind        :string
#  race        :string
#  breed       :string
#  gender      :string
#  birth       :date
#  size        :string
#  neutered    :boolean
#  vaccinated  :boolean
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  city        :string
#
class Animal < ActiveRecord::Base
  has_many_attached :pictures
  belongs_to :user

  extend Enumerize
  enumerize :kind, in: [:dog, :cat, :other], scope: true
  enumerize :gender, in: [:male, :female], scope: true
  enumerize :size, in: [:small, :mid, :big], scope: true
  enumerize :city, in: [:taquara, :igrejinha, :parobé, :rolante, :sapiranga], scope: true

  scope :neutered, -> (neutered) { where neutered: neutered }
  scope :vaccinated, -> (vaccinated) { where vaccinated: vaccinated }
  #TODO age scope
end


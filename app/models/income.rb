#!/bin/env ruby
# encoding: utf-8

class Income < ActiveRecord::Base
  enum origin: [:ordinary, :extraordinary, :reformulation]
  def self.origin_str
  [
    'Presupuesto Ordinario',
    'Presupuesto Extraordinario',
    'Reformulación'
  ]
  end
  
  enum financing: [:transfer_public, :transfer_private, :donation_public, :donation_private, :locti]
  def self.financing_str
  [
    'Transferencias Recibidas del Sector Publico',
    'Transferencias Recibidas del Sector Privado',
    'Donaciones Recibidas del Sector Público',
    'Donaciones Recibidas del Sector Privado',
    'LOCTI'
  ]
  end
  
  belongs_to :lab
  
  validates :lab, presence: true
  validates :sae_code, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: {maximum: 512}
  validates :origin, presence: true
  
  validates_datetime :date, allow_blank: true
  
  validates :organism, length: {maximum: 512}
  validates :document, length: {maximum: 512} #!No se sabe si es obligatorio
  
end

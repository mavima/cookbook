class Dose < ApplicationRecord
  belongs_to :recipe





  # class Unit
  #   KEYS = [
  #     unit = '',
  #     liters = 'liters',
  #     dl = 'dl',
  #     ml = 'ml',
  #     tbsp = 'tbsp',
  #     tsp = 'tsp',
  #     g ='g',
  #     kg = 'kg',
  #     slices = 'slices'
  #   ]

  #   def self.keys
  #     KEYS
  #   end

  #   def self.all
  #     keys.map { |key| new(key) }
  #   end

  #   def initialize(key)
  #     @key = key
  #   end

  #   # simple_form automatically uses `id` for the option value.
  #   def id
  #     @key
  #   end

        # simple_form automatically uses this for the option text.
    # def name
    #   I18n.t(@key, scope: :"models.dose.units")
    # end

  # end

end

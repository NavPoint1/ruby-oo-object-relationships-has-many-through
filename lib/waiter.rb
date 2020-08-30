require 'pry'
class Waiter

    attr_reader :name, :experience

    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal|
            meal.waiter == self
        }
    end

    def best_tipper
        biggest_tip = self.meals.max { |a, b|
            a.tip <=> b.tip
        }
        biggest_tip.customer
    end

    def self.all
        @@all
    end
end
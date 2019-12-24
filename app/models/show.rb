class Show < ActiveRecord::Base
  
    has_many :characters
    has_many :actors, through: :characters 
    belongs_to :network

    def actors_list 

        #enumerable uses actor.full_name from actor method 
        return self.actors.map {|actor| actor.full_name}
    end 
end
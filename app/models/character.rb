class Character < ActiveRecord::Base
  
    belongs_to :actor 
    belongs_to :show 

    def say_that_thing_you_say 

        return "#{self.name} always says: #{self.catchphrase}"
    end 

    def build_show(attributes)

        #returning the character. code executes, but Show.all does not 
        #include the new show 
        show = Show.create(attributes)
        show.characters.push(self)
        return self 
    end 

    def build_network(attributes)

        #need to fix, networks -< shows -< characters
        #fixed: needed build_show to return self to allow for chaining methods
        network = Network.new(attributes)
        network.shows.push(self.show)
        return self 
    end 
end
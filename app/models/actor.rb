class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{first_name} #{last_name}"
    end

    def list_roles
        char_name = self.characters.map do |character|
            character.name 
        end
        show_name = self.shows.map do |show|
            show.name
        end
        "#{char_name[0]} - #{show_name[0]}"
    end

end
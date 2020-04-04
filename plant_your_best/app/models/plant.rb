class Plant < ApplicationRecord
    has_and_belongs_to_many :states

    scope :by_id, -> (id) {where('id = ?', id)}
    
    scope :by_com_name, -> (name, type = "loose") { 
        if type == "strict"
            where('com_name = ?', name)
        else
            where('com_name LIKE ?', "%#{name}%")
        end
    }
    scope :by_sci_name, -> (name, type = "loose") { 
        if type == "strict"
            where('sci_name = ?', name)
        else
            where('sci_name LIKE ?', "%#{name}%")
        end
    }
    scope :by_fam_name, -> (name, type = "loose") { 
        if type == "strict"
            where('fam_name = ?', name)
        else
            where('fam_name LIKE ?', "%#{name}")
        end
    }
end
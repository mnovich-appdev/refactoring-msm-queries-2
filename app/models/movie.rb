# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
#  def director
#    my_director_id = self.director_id
#
#    matching_directors = Director.where({ :id => my_director_id })
#
#    the_director = matching_directors.at(0)
#
#    return the_director
#  end

  belongs_to(:director, {:class_name => "Director", :foreign_key => "director_id"})

  def characters
    my_id = self.id
    matching_characters = Character.where({:movie_id => my_id})
    return matching_characters
  end

  def cast
    join_records = self.characters
    other_record_ids = []
    join_records.each do |a_record|
      other_record_ids.push(a_record.actor_id)
    end
    
    Actor.where({:id => other_record_ids})
  end
end

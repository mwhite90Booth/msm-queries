class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details" })
  end

  def junior

    @youngest_director = Director.where.not({ :dob => nil }).order(:dob).reverse_order.at(0)
    render({ :template => "director_templates/youngest" })
  end

  def senior

    @oldest_director = Director.where.not({ :dob => nil }).order(:dob).at(0)
    render({ :template => "director_templates/eldest" })
  end
end

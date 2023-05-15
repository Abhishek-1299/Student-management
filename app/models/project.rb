class Project < ApplicationRecord
	include Validatable

	has_many :student_projects
	has_many :courses, through: :student_projects
end

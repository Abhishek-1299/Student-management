class Student < ApplicationRecord
	has_one_attached :profile_image
	# validates :profile_image, presence: true, file_content_type: [:gif, :png, :jpg, :jpeg],
    #         size: { less_than: 2.megabytes , message: 'must be less than 2MB in size' }

    #validates :profile_image, presence: true, file_content_type: { allow: ['image/png', 'image/jpeg', 'image/gif'] }, size: { less_than: 2.megabytes, message: 'must be less than 2MB in size' }
    #validates :image_profile, presence: true, file_type: { in: ['image/jpeg', 'image/png'], message: 'must be a JPEG or PNG image' }
    validates :profile_image, file_content_type: { allow: ['image/jpeg', 'image/png'], message: 'must be a JPEG or PNG image' }

	has_many :blogs
	
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
	validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
	validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed' }

	validate :validate_student_age  #custom validation

	has_and_belongs_to_many :courses
	has_many :student_projects
	has_many :projects, through: :student_projects
	before_create :display_greetings

	after_commit :display_student_age

	def display_greetings
		puts "hello, you executed before action callback"
	end

	def display_student_age
		if self.date_of_birth.present?
			age = Date.today.year - self.date_of_birth.year
			puts "======Age of student is #{age}====="
		else
			puts "=======Age cann't calculated without date_of_birth======"
		end
	end

	def validate_student_age
		if self.date_of_birth.present?
			age = Date.today.year - self.date_of_birth.year
			if age < 10
				errors.add(:age, 'please provide valid date_of_birth here. Age must be greater than 15')
			end
		end
	end
end

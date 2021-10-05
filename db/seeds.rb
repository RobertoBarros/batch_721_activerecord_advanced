require 'faker'

Patient.destroy_all
Doctor.destroy_all

20.times do
  Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

6.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

  rand(3..10).times do
    Intern.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, doctor: doctor)
  end

  Patient.all.sample(rand(5..20)).each do |patient|
    Appointment.create!(doctor: doctor, patient: patient)
  end
end


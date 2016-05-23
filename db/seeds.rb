Equipment.delete_all
Doctor.delete_all
Info.delete_all
Admin.delete_all
Patient.delete_all

Admin.create(email: 'admin@admin.com', password: 8888888)
Patient.create(first_name: '1', last_name: '1', personal_number: 1)
Info.create(about: 'Some about')

20.times do |i|
  Doctor.create(email: "doc#{i}@doc.com",
                password: 88888888,
                first_name: "DocFirst#{i}",
                last_name: "DocLast#{i}",
                about: "About#{i}")

  Equipment.create(title: "Eq#{i}", body: "BodyEq#{i}")
end

puts 'Seed done'

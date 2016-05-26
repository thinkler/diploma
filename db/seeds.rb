Equipment.delete_all
Doctor.delete_all
Info.delete_all
Admin.delete_all
Patient.delete_all
Speciality.delete_all

Admin.create(email: 'admin@admin.com', password: 8888888)
Patient.create(first_name: '1', last_name: '1', personal_number: 1)
Info.create(about: 'Some about')

20.times do |i|
  spec = Speciality.create(title: "spec#{i}")
  doc = Doctor.create(email: "doc#{i}@doc.com",
                      password: 88888888,
                      first_name: "DocFirst#{i}",
                      last_name: "DocLast#{i}",
                      about: "About#{i}")
  equip = Equipment.create(title: "Eq#{i}", body: "BodyEq#{i}")
  News.create(title: "News#{i}", body: "BodyN#{i}")
  Note.create(title: "Note#{i}", body: "BodyNote#{i}", doctor_id: Doctor.last.id, equipment_id: Equipment.last.id, patient_id: Patient.first.id)

  doc.specialities << spec
  equip.doctors << doc
end

puts 'Seed done'

Equipment.delete_all
Doctor.delete_all
Info.delete_all
Admin.delete_all
Patient.delete_all
Speciality.delete_all
News.delete_all


lond_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eros nisl, aliquam ut elementum a, volutpat sed ipsum.
Mauris vel consequat justo, at pellentesque justo. Duis finibus, leo eu pharetra viverra,
lorem ex egestas quam, non rhoncus dui tortor ac risus. Fusce blandit luctus diam at venenatis.
Nam tristique volutpat rhoncus. Nulla at erat non justo gravida facilisis. Fusce quis dui nisl.
Ut luctus lacinia urna, vitae imperdiet nisl ultricies ac. Aliquam dolor arcu, lobortis non turpis non, rhoncus imperdiet mi.
Praesent sollicitudin, dolor non auctor bibendum, nunc nunc dictum urna, eu ultrices elit ante eget leo.
Quisque placerat sagittis mauris. Curabitur sed elit a tellus dapibus semper ac quis odio. Ut dictum dolor et cursus tincidunt.
Suspendisse mattis volutpat convallis. Sed leo nisl, consequat condimentum finibus et, pellentesque a leo.
Pellentesque ultrices scelerisque nunc vel consequat. Duis congue quis mauris imperdiet tristique. Morbi ultricies porttitor gravida.
 Nunc finibus blandit nibh eget euismod. Etiam mauris purus, eleifend cursus egestas a, accumsan placerat nibh.
 Praesent ullamcorper magna sit amet molestie tempor. Aenean eu pharetra ipsum, in accumsan nunc
Nunc aliquam nisi et tellus pellentesque, et luctus enim ultrices. Curabitur ac fringilla lectus. Duis vel ullamcorper erat.
Vestibulum arcu nulla, elementum vel diam a, malesuada sodales purus. Morbi dignissim mattis lorem, ut malesuada erat viverra non.
 In eget sem ligula. Quisque eget ornare nulla. Morbi ultricies, libero quis sodales ultrices, neque eros efficitur lectus, eget iaculis
 urna lectus ut risus. Mauris fermentum leo nisl, quis faucibus orci convallis in. Ut pretium diam ultrices libero volutpat rutrum.
 Quisque faucibus risus quis nisl sagittis aliquet."


short_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eros nisl, aliquam ut elementum a, volutpat sed ipsum.
Mauris vel consequat justo, at pellentesque justo. Duis finibus, leo eu pharetra viverra,
lorem ex egestas quam, non rhoncus dui tortor ac risus. Fusce blandit luctus diam at venenatis.
Nam tristique volutpat rhoncus. Nulla at erat non justo gravida facilisis. Fusce quis dui nisl.
Ut luctus lacinia urna, vitae imperdiet nisl ultricies ac. Aliquam dolor arcu, lobortis non turpis non, rhoncus imperdiet mi."

news_pic = File.open(File.join(Rails.root, 'public', 'news.jpg'))
equip_pic = File.open(File.join(Rails.root, 'public', 'equip.jpg'))
doc_pic = File.open(File.join(Rails.root, 'public', 'doc_pic.jpg'))
patient_pic = File.open(File.join(Rails.root, 'public', 'patient_pic.png'))

Admin.create(email: 'admin@admin.com', password: 8888888)
Patient.create(first_name: '1', last_name: '1', personal_number: 1, photo: patient_pic)
Info.create(about: lond_text)

20.times do |i|
  spec = Speciality.create(title: Faker::Hipster.word)
  doc = Doctor.create(email: "doc#{i}@doc.com", password: 888888, first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name, about: short_text, photo: doc_pic)
  equip = Equipment.create(title: Faker::Hipster.word, body: short_text, pic: equip_pic)
  problem = Problem.create(title: Faker::Hipster.word)
  News.create(title: "News#{i}", body: short_text, pic: news_pic)
  Note.create(title: "Note#{i}", body: short_text, doctor_id: Doctor.last.id, equipment_id: Equipment.last.id,
              patient_id: Patient.first.id, speciality_id: spec.id)
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, photo: patient_pic,
                           work_position: Faker::Hipster.word)

  patient.problems << problem
  doc.specialities << spec
  equip.doctors << doc
end

puts 'Seed done'

# Три крапки означають що ваш скрипт має прийняти змінену строку і обробити її якомога краще,
# тобто на вході ви отримуєте дані, а вам треба окрім того що створити відповідну структуру об'єктів,
# ще й написати додаткові методи, які полегшують життя при роботі із цими об'єктами.
#
#     Приклади методів:
#
# adult? - відповідає так чи ні з огляду на вік
# twitter_account? - відповідно залежно від наявності посилання на профайл твіттера
# have_hobbies? - відповідно до того чи є в профайлі хоббі
# Ну і інші ознаки які ви можете придумати для людини також опишіть.
# Посилання на результат постіть тут, мені так легше перевіряти.Дякую.

require 'json'

RESPONSE='{"person":{
"personal_data":{"name": "John Smith", "gender":"male", "age":22},
"social_profiles":["http://facebook.com/john","http://twitter.com/john","http://smith.ru"],
"additional_info":{"hobby":["pubsurfing","drinking","hiking"],
"pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}
}}'

response = JSON.parse(RESPONSE)

p response['person']['additional_info']['hobby']

module PersonInformation

  def adult?(age)
    (age > 21) ? true : false
  end

  def has_twitter?(social)
    social.each do |elem|
      isTrue = (elem == "http://twitter.com/john")
      if isTrue
        return true
      end
    end
  end

  def has_hobbies?(hobbies)
    hobbies.any?
  end

end

if response.key?('person')
  person_object = Struct.new("Person", *response["person"].keys.collect(&:to_sym))
  person = person_object.new(*response["person"].values)
  person.extend(PersonInformation)
  age = person.personal_data['age']
  p age
  p person.adult?(age)
  social = person.social_profiles
  p social
  p person.has_twitter?(social)
  hobbies = person.additional_info['hobby']
  p hobbies
  p hobbies = person.has_hobbies?(hobbies)
end

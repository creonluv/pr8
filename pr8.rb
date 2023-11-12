require 'open-uri'
require 'nokogiri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
html = URI.open(url)
doc = Nokogiri::HTML(html)


CSV.open('hospitals.csv', 'w', col_sep: ', ') do |csv|
  csv << ['Автоінкрементне число', 'Назва лікарні']

  doc.css('div.column1 li').each_with_index do |li, index|
    hospital_name = li.text
    csv << [index + 1, hospital_name]
  end
end

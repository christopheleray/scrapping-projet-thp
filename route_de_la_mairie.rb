# Exercice 1 scrapping mairie du val d'oise

require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

# definition de la méthode get_the_email_of_a_townhal_from_its_webpage(urls) 
#qui prend en URL une liste d'url stocké dans un array via  metode get_all_the_urls_of_val_doise_townhalls
#stockage des données dans un hash liste_ciy_hall
# Possible de mettre a[@class="lientxt"] ou 'a.lientxt'
def get_the_email_of_a_townhal_from_its_webpage(urls)
  liste_city_hall = []
  urls.each do |url|
    hash = {}
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{url[1..-1]}")) 
      hash[:name] = doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').text 
      hash[:email] =  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      liste_city_hall << hash
    end
  return liste_city_hall
end

# Métode permettant d'extraire toutes les urls des mairies du 95 et de récuperer le lien href
def get_all_the_urls_of_val_doise_townhalls
  links = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    doc.xpath('//a[@class ="lientxt"]').each do |node|
    links << node['href']
  end
  return links
end
#binding.pry

def perform
 puts list_final = get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)
  fname = "route_de_la_mairie.txt" #stockage des données dans un fichier text
  somefile = File.open(fname,"w")
  somefile.puts(list_final) # envoie des données du hash list_final
  somefile.close
end

perform




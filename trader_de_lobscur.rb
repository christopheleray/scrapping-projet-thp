# Exercice THP qui récupére liste des cryptomonnaies 
# gem whenever pour updater toutes les heures
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'whenever'

# Methode permettant de récupérer tout les prix des cryptomonnaies
# et de stocker dans un array 'price'
def cryptomonnaies_price 
  price = []
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    doc.xpath('//td/a[@class ="price"]').each do |node|
    price << node.text  
    end  
  return price
end

# Methode permettant de récupérer tout les noms des cryptomonnaies
# et de stocker dans un array 'crypto_name'
def cryptomonnaies_name
  crypto_name = []
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    doc.xpath('//td/a[@class ="currency-name-container link-secondary"]').each do |node|
    crypto_name << node.text
  end
  return crypto_name
end

#binding.pry

def perform
  loop do 
  liste_crypto = {}
  puts liste_crypto = cryptomonnaies_name.zip(cryptomonnaies_price)
  fname = "liste_crypto.txt" #stockage des données dans le fichier liste_crpyto.txt
  somefile = File.open(fname,"w")
  somefile.puts liste_crypto
  somefile.close
  sleep (3660)
  end
end

perform




# Exercice THP qui récupére liste des cryptomonnaies 
# gem whenever pour updater toutes les heures
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'whenever'


def cryptomonnaies_price 
  crypto_name = []
  price = []
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    doc.xpath('//td/a[@class ="price"]').each do |node|
    price << node.text  
    end  
  return price
end


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
 liste_crypto = {}
 liste_crypto = cryptomonnaies_name.zip(cryptomonnaies_price)
 fname = "liste_crypto.txt"
  somefile = File.open(fname,"w")
  somefile.puts liste_crypto
  somefile.close
end

perform





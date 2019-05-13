require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path= File.join(Dir.pwd,"chromedriver.exe")
@driver = Selenium::WebDriver.for :chrome
@driver.manage.timeouts.implicit_wait = 5

def visitorHome
    print "Navegação para a pagina Home " 
    begin
        @driver.get "http://localhost:3000/"
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def visitorContato
    print "Navegação para a pagina Contato " 
    begin
        @driver.get "http://localhost:3000/contatos"
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def visitorSobre
    print "Navegação para a pagina Sobre " 
    begin
        @driver.get "http://localhost:3000/sobre"
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def visitorRelatorio
    print "Navegação para a pagina Relatorio " 
    begin
        @driver.get "http://localhost:3000/relatorio"
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def navStartOfHome
    print "Navegação com ação de click a partir da pagina Home " 
    begin
        @driver.get "http://localhost:3000/"
        @driver.find_element(:id, 'contato').click()
        @driver.find_element(:id, 'sobre').click()
        @driver.find_element(:id, 'relatorio').click()
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def navStartOfContato
    print "Navegação com ação de click a partir da pagina Contatos " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'home').click()
        @driver.find_element(:id, 'sobre').click()
        @driver.find_element(:id, 'relatorio').click()
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def navStartOfSobre
    print "Navegação com ação de click a partir da pagina Sobre " 
    begin
        @driver.get "http://localhost:3000/sobre"
        @driver.find_element(:id, 'contato').click()
        @driver.find_element(:id, 'home').click()
        @driver.find_element(:id, 'relatorio').click()
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def navStartOfRelatorio
    print "Navegação com ação de click a partir da pagina Relatorio " 
    begin
        @driver.get "http://localhost:3000/relatorio"
        @driver.find_element(:id, 'contato').click()
        @driver.find_element(:id, 'home').click()
        @driver.find_element(:id, 'sobre').click()
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[Error]\n"
    end
end

def blankInAllFields
    print "Salvar campos vazios " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'salvar').submit
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[error]\n"
    end
end

def fullAllFields
    print "Salvar campos devidamente preenchidos " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'nome').send_keys("jose mouro")
        @driver.find_element(:id, 'email').send_keys("jose@hotmail.com")
        @driver.find_element(:id, 'salvar').submit
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[error]\n"
    end
end

def emailBlankField
    print "Salvar campos apenas com Nome preenchido " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'nome').send_keys("jose mouro")
        @driver.find_element(:id, 'email').send_keys("")
        @driver.find_element(:id, 'salvar').submit
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[error]\n"
    end
end

def nomeBlankField
    print "Salvar campos apenas com Email preenchido " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'nome').send_keys("")
        @driver.find_element(:id, 'email').send_keys("rogerguedes@gmaikl.com")
        @driver.find_element(:id, 'salvar').submit
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[error]\n"
    end
end

def emailInvalidField
    print "Salvar campos apenas com Email invalido preenchido " 
    begin
        @driver.get "http://localhost:3000/contatos"
        @driver.find_element(:id, 'nome').send_keys("Carlos Augusto")
        @driver.find_element(:id, 'email').send_keys("rogerguedesgmail.com")
        @driver.find_element(:id, 'salvar').submit
        sleep 1
        print "[OK]\n"
    rescue => ex
        print "[error]\n"
    end
end



def main
    visitorHome
    visitorContato       
    visitorSobre
    visitorRelatorio
    navStartOfHome
    navStartOfContato
    navStartOfSobre
    navStartOfRelatorio
    blankInAllFields
    fullAllFields
    emailBlankField
    nomeBlankField
    emailInvalidField

end


main



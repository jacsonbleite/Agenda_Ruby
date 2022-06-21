#lista de contatos "Mockada"
# @ => cria uma insância de variável
@schedule = [
    {name: "Jacson", phone:"84880075"},
    {name: "Leite", phone: "999760503"}
]

#lista todos contatos
def all_contacts
    puts "---------------------"
    @schedule.each do |contact|
        puts "#{contact[:name]} - #{contact[:phone]}"        
    end
    puts "---------------------"
end

#ver contato
def view_contact
    print "Nome do contato: "
    name = gets.chomp

    @schedule.each do |contact|
        puts "---------------------"
        if contact[:name].downcase.include?(name.downcase)
            puts "#{contact[:name]} - #{contact[:phone]}"            
        end   
        puts "---------------------"
    end
end

# adicionar contato
# gets.chomp => captura carteres do teclado
def add_contact
    print "Nome: "
    name = gets.chomp
    print "Telefone: "
    phone = gets.chomp

    @schedule << {name: name, phone: phone}
end

# editar contato
def edit_contact
    print "Qual contato deseja editar: "
    name = gets.chomp

    @schedule.each do |contact|
        if contact[:name].downcase == (name.downcase)
           # ínico editando nome 
            print "Edite o nome e aprete enter (ou aperte enter para manter o mesmo nome): "
            saved_name = contact[:name]

            contact[:name] = gets.chomp
            contact[:name] = contact[:name].empty? ? saved_name : contact[:name]
            # fim editando nome 

            # ínico editando telefone 
            print "Edite o telefone e aprete enter (ou aperte enter para manter o mesmo telefone): "
            saved_phone = contact[:phone]

            contact[:phone] = gets.chomp
            contact[:phone] = contact[:phone].empty? ? saved_phone : contact[:phone]
            # fim editando telefone 

        end
    end
end

# remover contato
def remove_contact
    print "Qual contato deseja remover? "
    name = gets.chomp

    @schedule.each do |contact|
        if contact[:name].downcase == (name.downcase)
            indexx = @schedule.index(contact)
            @schedule.delete_at(indexx)
            break
        end
    end
end

loop do

    puts "1. Contatos\n2. Adcionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    option = gets.chomp.to_i

    case
    when option == 0
        puts "Até mais"
        break
    when option == 1
        all_contacts
    when option == 2
        add_contact
    when option == 3
        view_contact
    when option == 4
        edit_contact
    when option == 5
        remove_contact
    else
        puts "Escolha Inválida!"
    end

end

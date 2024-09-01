class Port
  # Definindo a constante IDENTIFIER para o porto de Palermo
  IDENTIFIER = :PALE

  # Cache para armazenar os identificadores de portas já calculados
  @identifiers_cache = {}

  class << self
    attr_reader :identifiers_cache

    # Método para obter o identificador de uma porta
    def get_identifier(port_name)
      # Usar o cache para evitar cálculos repetidos
      identifiers_cache[port_name] ||= port_name[0, 4].upcase.to_sym
    end

    # Método para determinar em qual terminal o navio deve atracar
    def get_terminal(ship_identifier)
      # Extrai as três primeiras letras do identificador do navio diretamente como string
      cargo_type = ship_identifier.to_s[0, 3]

      # Usar case para melhorar a performance das comparações
      case cargo_type
      when "OIL", "GAS"
        :A
      else
        :B
      end
    end
  end
end

# Testando as funcionalidades
puts Port::IDENTIFIER # => :PALE
puts Port.get_identifier("Hamburg") # => :HAMB
puts Port.get_terminal(:OIL123) # => :A
puts Port.get_terminal(:GAS456) # => :A
puts Port.get_terminal(:FOO789) # => :B

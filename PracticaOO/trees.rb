$LOAD_PATH << '.' 
require 'mod_dfs'

class BT
    attr_accessor   :n # Objeto que guarda el nodo
    attr_reader     :l, # Hijo izquierdo (BT)
                    :r # Hijo derecho (BT)

    def initialize(n, l=nil, r=nil)
        @n = n;
        @l = l;
        @r = r;
    end
    
    def each
        yield l;    # Primero se itera sobre el hijo izq
        yield r;    # Y luego por el derecho
    end

end

class RT
    attr_accessor   :n # Objeto que guarda el nodo
    attr_reader     :ss # Arreglo de hijos

    def initialize(n, *sons)
        @n = n;
        @ss = [];
        sons.each do |x|    # Se itera sobre los elementos de la lista sons
            @ss << x;       # Y se agregan a la lista de hijos ss
        end
    end

    def each
        @ss.each do |x|     # Se itera en el mismo orden de la lista de hijos.
            yield x         
        end
    end

end

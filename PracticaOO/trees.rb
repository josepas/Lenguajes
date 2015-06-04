$LOAD_PATH << '.' 
require 'mod_dfs'

class BT
    attr_accessor   :n # Objeto que guarda el nodo
    attr_reader     :l, # Hijo izquierdo (BT)
                    :r # Hijo derecho (BT)
    include DFS
    include BFS

    def initialize(n, l=nil, r=nil)
        @n = n;
        @l = l;
        @r = r;
    end
    
    def each
        yield l;
        yield r;    
    end

end

class RT
    attr_accessor   :n # Objeto que guarda el nodo
    attr_reader     :ss # Arreglo de hijos

    include DFS

    def initialize(n, *sons)
        @n = n;
        @ss = [];
        sons.each do |x| 
            @ss << x;
        end
    end

    def each
        @ss.each do |x| 
            yield x
        end
    end

end

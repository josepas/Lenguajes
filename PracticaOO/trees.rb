class BT
    attr_accessor :n # Objeto que guarda el nodo
    attr_reader :l, # Hijo izquierdo (BT)
                :r # Hijo derecho (BT)
    
    def initialize(n, l=nil, r=nil)
        @n = n;
        @l = l;
        @r = r;
    end
    
    def each &block
        yield l;
        yield r;    
    end

end

class RT
    attr_accessor :n # Objeto que guarda el nodo
    attr_reader :ss # Arreglo de hijos

    def initialize(n, *sons)
        @n = n;
        @ss = [];
        sons.each {|x| @ss << x};
    end

    def each &block
        @ss.each {|x| yield x}
    end

end
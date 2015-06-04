$LOAD_PATH << '.' 
require 'mod_dfs'

class BT
    attr_accessor   :n, # Objeto que guarda el nodo
                    :l, # Hijo izquierdo (BT)
                    :r # Hijo derecho (BT)
    include Traverse

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
    attr_accessor   :n # Objeto que guarda el nodo
    attr_reader     :ss # Arreglo de hijos

    include Traverse

    def initialize(n, *sons)
        @n = n;
        @ss = [];
        sons.each do |x| 
            @ss << x;
        end
    end

    def each &block
        @ss.each do |x| 
            yield x
        end
    end

end

root = BT.new 1
child_1 = BT.new 2
child_2 = BT.new 3
grand_child_1 = BT.new 4
grand_grand_child_1 = BT.new 5
grand_child_1.l = grand_grand_child_1
child_1.l = grand_child_1
root.l = child_1
root.r = child_2

puts "arbol original!"
root.dfs {|x| puts x.n}

root.dfs! {|x| x.n * 2}

puts "~~~ arbol * 2 ~~~"
root.dfs {|x| puts x.n}


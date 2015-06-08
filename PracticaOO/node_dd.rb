#####################
# Visitantes:
# 
# Para cada visitante se definen tres metodos:
# -visitarNode: metodo para visitar elementos de clase Node.
# -visitarFixnum: metodo para visitar un fixnum.
# -visitarSymbol: metodo para visitar un simbolo.
#
# Cada objeto a ser visitado llamara al metodo correspondiente 
# con su clase.
#
#####################

class Visitante; end

class Mirror < Visitante
    def visitarNode n
        return Node.new(-n.x,-n.y)
    end
    
    def visitarFixnum n
        return -n
    end

    def visitarSymbol s
        return (s.to_s + s.to_s.reverse).to_sym
    end
end

class Next < Visitante
    def visitarNode n
        return Node.new(n.x.succ,n.y.succ)
    end
    
    def visitarFixnum n
        return n.succ
    end

    def visitarSymbol s
        str = s.to_s
        r = ""
        str.each_char do |c|
            r << c.succ[0]
        end
        return r.to_sym
    end
end

class Strong < Visitante
    def visitarNode n
        return Node.new(n.x * 100,n.y * 100)
    end
    
    def visitarFixnum n
        return n * 100
    end

    def visitarSymbol s
        return s.upcase
    end
end

#####################
# Clase Node:
# 
# Se define el inicializador y el to_s.
# Ademas se define visitado_por llamando al metodo
# visitarNode del visitante recibido.
# 
#####################

class Node
    attr_reader :x, :y

    def initialize x, y
        @x = x
        @y = y
    end

    def visitado_por v
        v.visitarNode(self)
    end

    def to_s
        return "#{x} - #{y}"
    end

end

#####################
# Clases Fixnum y Symbol:
# 
# A ambas clases se les agrega el metodo visitado_por
# para que las instancias de Fixnum y Symbol puedan ser
# visitadas.
# 
#####################

class Fixnum
    def visitado_por v
        v.visitarFixnum(self)
    end
end

class Symbol
    def visitado_por v
        v.visitarSymbol(self)
    end
end

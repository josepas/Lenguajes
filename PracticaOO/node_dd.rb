class Visitante; end

class Mirror < Visitante
    #
end

class Next < Visitante
#
end

class Strong < Visitante
#
end

class Node
    attr_reader :x, :y

    def initialize x, y
        #
    end

    def visitado_por v
        #
    end

    def to_s
        #
    end

end
#####################
# mod_fold.rb
# 
# Autores:
#   Gustavo Gutierrez   11-10428
#   Jose Pascarella     11-10743
# 
# Ultima modificacion 07/06/2015
# 
#####################

module Foldable

    #####################
    # fold
    # 
    # El bloque recibido opera sobre dos parametros.
    # Como primer parametro se pasa el acumulador de la funcion.
    # El segundo es el elemento sobre el cual se esta iterando.
    # Se recorre el arbol en BFS con la ayuda de una cola.
    # 
    # El resultado del yield se vuelve a guardar en el acumulador
    # para proximas iteraciones.
    # 
    #####################


    def fold(b, &block)
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            b = yield b, node.n 
            node.each do |child|
                cola << child unless child == nil
            end
        end
        return b
    end

    #####################
    # map
    # 
    # Se recorre el arbol en BFS al igual que en fold.
    # El resultado del yield no se almacena.
    # 
    #####################

    def map &block
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            yield node 
            node.each do |child|
                cola << child unless child == nil
            end
        end

    end

    #####################
    # map!
    # 
    # Se recorre el arbol en BFS al igual que en fold.
    # El resultado del yield se almacena en el nodo actual
    # para modificar el arbol.
    # 
    #####################

    def map! &block
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            node.n = yield node 
            node.each do |child|
                cola << child unless child == nil
            end
        end
    end

end

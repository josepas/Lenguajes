#####################
# mod_dfs.rb
# 
# Autores:
#   Gustavo Gutierrez   11-10428
#   Jose Pascarella     11-10743
# 
# Ultima modificacion 07/06/2015
# 
#####################

module DFS
    
    #####################
    # Dfs
    # Primero se devuelve el nodo actual y luego se llama recursivamente a sus hijos
    # El resultado del yield no se guarda
    #####################

    def dfs &block
        node = self
        yield node
        node.each do |child|
            child.dfs &block unless child == nil 
        end
    end

    #####################
    # Dfs!
    # Al igual que en DFS se procesa el nodo y luego sus hijos
    # El resultado del yield se almacena en el nodo para modificar el arbol
    #####################

    def dfs! &block
        node = self
        node.n = yield node
        node.each do |child|
            child.dfs! &block unless child == nil 
        end
    end
end


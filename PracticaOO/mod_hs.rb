#####################
# mod_hs.rb
# 
# Autores:
#   Gustavo Gutierrez   11-10428
#   Jose Pascarella     11-10743
# 
# Ultima modificacion 07/06/2015
# 
#####################

#####################
# Modulo Monoid
# 
# Para extender Monoid se debera implementar dos funciones:
# mempty: elemento neutro de la clase.
# mappend: operación asociada al Monoide.
# 
#####################

module Monoid
    #Minimal implementation
        # mempty  :: a
        # mappend :: a -> a -> a
    
    # mconcat :: [a] -> a
    
    #####################
    # mconcat
    # 
    # Se define un acumulador cuyo valor inicial es el mempty de cada clase.
    # Se realiza mappend con el acumulador y cada uno de los elementos pasados
    # en la lista as.
    # 
    #####################

    def mconcat(as)
        acc = mempty
        for i in as.each
            acc = mappend(acc, i)
        end
        acc
    end
end

#####################
# Modulo Functor
# 
# Para extender Functor se debera implementar fmap,
# la cual mapea una funcion sobre todos los elementos del functor.
# 
#####################

module Functor
    #Minimal implementation
        # fmap :: (a -> b) -> f a -> f b

    # (<$) :: a -> f b -> f a

    #####################
    # inj
    # 
    # Sobre los elementos del functor correspondiente
    # se mapea una funcion que simplemente devuelve el elemento a.
    # 
    #####################

    def inj a, fb
        fmap(fb) {a}
    end
    
end

# Monoid Instances

# All
class TrueClass
    extend Monoid
    def TrueClass.mempty
        true
    end
    
    def TrueClass.mappend(a,b)
        a and b
    end
end

# Any
class FalseClass
    extend Monoid
    def FalseClass.mempty
        false
    end

    def FalseClass.mappend(a,b)
        a or b
    end

end

class String
    extend Monoid
    def String.mempty
        ""
    end

    def String.mappend(a,b)
        a + b
    end
end

class Fixnum
    extend Monoid
    def Fixnum.mempty
        0
    end

    def Fixnum.mappend(a,b)
        a + b
    end

end

# Functor Instances

class String
    extend Functor
    def String.fmap(fa, &block)
        r = ""
        fa.split("").each do
           r << yield
        end
        r
    end

end

class Fixnum
    extend Functor
    def Fixnum.fmap(fa, &block)
        r = []
        fa.each do
            r << yield
        end
        r
    end
end
require 'minitest/autorun'

class Polinomio

	 def initialize()
	 	  @i=0
	      @var=5
	      @num=0
	      @j=0
	      @numeros=[]
	      @Pol=""
	      
	 end

	
	 def poli(numeros)
		@numeros=numeros
			@i =@numeros.length-1

	   		 while @j < @numeros.length do
		   		if @numeros[@j].to_i < 0 then # es negativo		
		   		 	if @numeros[@j].to_i==-1 then #solo se pone X
		   		 		if @i==0 then
		   		 			@Pol= @Pol+@numeros[@j].to_s
		   		 		else
		   		 			@Pol= @Pol+"-X^"+@i.to_s
		   		 		end
					else
						if @i==0 then
							@Pol= @Pol+@numeros[@j].to_s
						else
							@Pol= @Pol+@numeros[@j].to_s+"X^"+@i.to_s
						end				
					end
				elsif @numeros[@j].to_i!=0 then  #positivo					
					if @numeros[@j].to_i==1 then #solo se pone X
						if @j==0 then
							@Pol= @Pol+"X^"+@i.to_s	
						else
							@Pol= @Pol+"+X^"+@i.to_s	
						end
					else
						if @i==0 then
							@Pol= @Pol+"+"+@numeros[@j].to_s
						else
							@Pol= @Pol+"+"+@numeros[@j].to_s+"X^"+@i.to_s
						end	
					end
	   		 	end 

	   		 	@j +=1
	   		 	@i -=1

	   		 end
	   		 return @Pol

     end
     

end #fin de clase polinomio

#P= Polinomio.new()
#puts P.poli() 

class Mytest_polinomio < MiniTest::Unit::TestCase
	def setup
		@valores= Polinomio.new
	end
	
	def test_cadena
		assert_instance_of String, @valores.poli([3,0,2])
	end

	def test_valor_conocido
    	assert_equal "-3X^4-4X^3+X^2+6", @valores.poli([-3,-4,1,0,6])
  	end 

  	def test_dosvalores
  		assert_equal "X^2+2", @valores.poli([1,0,2])
  	end
  	def test_vacio
  		assert_equal "",  @valores.poli([0,0,0])
  	end
  	def test_valornegativo
  		assert_equal "-X^2+2",  @valores.poli([-1,0,2])
  	end

  	def test_valor_final_negativo
  		assert_equal "-X^2-1",  @valores.poli([-1,0,-1])
  	end

end




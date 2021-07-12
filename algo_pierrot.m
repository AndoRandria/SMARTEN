
	
	  if i == 1
		if SC(i,j) <= LR(j)  
	
			if SP(i,j) ==0   
				RES(i,j) = SC(i,j);
				STO(i,j) = STOin(j);
				EXC(i,j) = 0;
		
			elseif SP(i,j)>0 & STOin(j) + SP(i,j) <=LH(j)    
				RES(i,j) = SC(i,j);
				STO(i,j) = STOin(j) + SP(i,j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & STOin(j) + SP(i,j) > LH(j) & SC(i,j) >= SP(i,j) -(LH(j)-STOin(j)) 
				RES(i,j) = SC(i,j)-(SP(i,j)-(LH(j)-STOin(j)));
				STO(i,j) = LH(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & STOin(j) + SP(i,j) > LH(j) & SC(i,j) < SP(i,j) -(LH(j)-STOin(j))  
				RES(i,j) = 0;
				STO(i,j) = LH(j);
				EXC(i,j) = SP(i,j)-(LH(j)-STOin(j))-SC(i,j);
			
			end
		
		elseif SC(i,j) > LR(j)  
	
			if SP(i,j) ==0 & SC(i,j)-LR(j) < STOin(j)-LB(j)      
				RES(i,j) = LR(j);
				STO(i,j) = STOin(j)-(SC(i,j)-LR(j));
				EXC(i,j) = 0;
			
			elseif  SP(i,j)==0 & SC(i,j)-LR(j) >= STOin(j)-LB(j)    
				RES(i,j) = SC(i,j)-(STOin(j)-LB(j));
				STO(i,j) = LB(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) == SP(i,j)     
				RES(i,j) = LR(j);
				STO(i,j) = STOin(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) > SP(i,j) & STOin(j)-LB(j) < SC(i,j)-LR(j)-SP(i,j)  
				RES(i,j) = SC(i,j)-SP(i,j)-(STOin(j)-LB(j));
				STO(i,j) = LB(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) > SP(i,j) & STOin(j)-LB(j) >= SC(i,j)-LR(j)-SP(i,j)   
				RES(i,j) = LR(j);
				STO(i,j) = STOin(j)-(SC(i,j)-LR(j)-SP(i,j));
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j))<=LH(j)-STOin(j)  
				RES(i,j) = LR(j);
				STO(i,j) = STOin(j)+SP(i,j)-(SC(i,j)-LR(j));
				EXC(i,j) = 0;
		
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j)) > LH(j)-STOin(j) & LR(j) >= SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STOin(j))   % 2-7
				RES(i,j) = LR(j)-(SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STOin(j)));
				STO(i,j) = LH(j);
				EXC(i,j) = 0;
		
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j)) > LH(j)-STOin(j) & LR(j) < SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STOin(j))   % 2-8
				RES(i,j) = 0;
				STO(i,j) = LH(j);
				EXC(i,j) = SP(i,j)-((SC(i,j)-LR(j)-(LH(j)-STOin(j))-LR(j)));

			end
		end
		
		else
		

		if SC(i,j) <= LR(j)  
	
			if SP(i,j) ==0   
				RES(i,j) = SC(i,j);
				STO(i,j) = STO(i-1,j);
				EXC(i,j) = 0;
		
			elseif SP(i,j)>0 & STO(i-1,j) + SP(i,j) <=LH(j)     
				RES(i,j) = SC(i,j);
				STO(i,j) = STO(i-1,j) + SP(i,j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & STO(i-1,j) + SP(i,j) > LH(j) & SC(i,j) >= SP(i,j) -(LH(j)-STO(i-1,j))  
				RES(i,j) = SC(i,j)-(SP(i,j)-(LH(j)-STO(i-1,j)));
				STO(i,j) = LH(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & STO(i-1,j) + SP(i,j) > LH(j) & SC(i,j) < SP(i,j) -(LH(j)-STO(i-1,j)) 
				RES(i,j) = 0;
				STO(i,j) = LH(j);
				EXC(i,j) = SP(i,j)-(LH(j)-STO(i-1,j))-SC(i,j);
			
			end
		
		elseif SC(i,j) > LR(j)  
	
			if SP(i,j) ==0 & SC(i,j)-LR(j) < STO(i-1,j)-LB(j)        
				RES(i,j) = LR(j);
				STO(i,j) = STO(i-1,j)-(SC(i,j)-LR(j));
				EXC(i,j) = 0;
			
			elseif  SP(i,j)==0 & SC(i,j)-LR(j) >= STO(i-1,j)-LB(j)    
				RES(i,j) = SC(i,j)-(STO(i-1,j)-LB(j));
				STO(i,j) = LB(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) == SP(i,j)     
				RES(i,j) = LR(j);
				STO(i,j) = STO(i-1,j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) > SP(i,j) & STO(i-1,j)-LB(j) < SC(i,j)-LR(j)-SP(i,j)   
				RES(i,j) = SC(i,j)-SP(i,j)-(STO(i-1,j)-LB(j));
				STO(i,j) = LB(j);
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) > SP(i,j) & STO(i-1,j)-LB(j) >= SC(i,j)-LR(j)-SP(i,j)    
				RES(i,j) = LR(j);
				STO(i,j) = STO(i-1,j)-(SC(i,j)-LR(j)-SP(i,j));
				EXC(i,j) = 0;
			
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j))<=LH(j)-STO(i-1,j)   
				RES(i,j) = LR(j);
				STO(i,j) = STO(i-1,j)+SP(i,j)-(SC(i,j)-LR(j));
				EXC(i,j) = 0;
		
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j)) > LH(j)-STO(i-1,j) & LR(j) >= SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STO(i-1,j))   
				RES(i,j) = LR(j)-(SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STO(i-1,j)));
				STO(i,j) = LH(j);
				EXC(i,j) = 0;
		
			elseif  SP(i,j)>0 & SC(i,j)-LR(j) < SP(i,j) & SP(i,j)-(SC(i,j)-LR(j)) > LH(j)-STO(i-1,j) & LR(j) < SP(i,j)-(SC(i,j)-LR(j))-(LH(j)-STO(i-1,j))   
				RES(i,j) = 0;
				STO(i,j) = LH(j);
				EXC(i,j) = SP(i,j)-((SC(i,j)-LR(j)-(LH(j)-STO(i-1,j))-LR(j)));

			end
		end
		end

	


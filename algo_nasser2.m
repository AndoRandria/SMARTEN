
if SP(i,j) == 0
    
	if SC(i,j) <= LR(j)
		RES(i,j) = SC(i,j);
		STO(i,j) = STO(i-1,j);
        CAS(i,j) = 1;
        
    elseif SC(i,j) >LR(j) & (SC(i,j) - LR(j))/rend_ond(j) < ond_in_max(j)
		if (STO(i-1,j) - LB(j))*rend_bat(j) > (SC(i,j) - LR(j))/rend_ond(j) & (SC(i,j) - LR(j))/(rend_ond(j)*rend_bat(j)) < P_max_decharge(i,j)
        RES(i,j) = LR(j)	;
        STO(i,j) = STO(i-1,j) - (SC(i,j) - LR(j))/(rend_ond(j)*rend_bat(j));
        CAS(i,j) = 2;
        
        elseif (STO(i-1,j) - LB(j))*rend_bat(j) > (SC(i,j) - LR(j))/rend_ond(j) & (SC(i,j) - LR(j))/(rend_ond(j)*rend_bat(j)) >= P_max_decharge(i,j)
        RES(i,j) = LR(j)	;
        STO(i,j) = STO(i-1,j) - (SC(i,j) - LR(j))/(rend_ond(j)*rend_bat(j));
        CAS(i,j) = 3;
        ;
		elseif (STO(i-1,j) - LB(j))*rend_bat(j) <= (SC(i,j) - LR(j))/rend_ond(j)
		RES(i,j) = LR(j)	;
        STO(i,j) = LB(j);
        CAS(i,j) = 311;
        end
    elseif SC(i,j) >LR(j) & (SC(i,j) - LR(j))/rend_ond(j) >= ond_in_max(j)
        RES(i,j) = LR(j);
        STO(i,j) = STO(i-1,j) - ond_in_max(j)/rend_bat(j);
        CAS(i,j) = 3333;
        
	end
    

elseif SP(i,j) >0
    
    
	if SP(i,j) >=(SC(i,j)/rend_ond(j)) & (SC(i,j)/rend_ond(j))>= ond_in_max(j) & SP(i,j) - (SC(i,j)/rend_ond(j)) >= P_max_charge(i,j) % on charge au maxi que peut prendre la batt곩e (2775)
        RES(i,j) = SC(i,j) - ond_out_max(j);
        if STO(i-1,j) + (P_max_charge(i,j)*rend_bat(j)) >= LH(j)
            STO(i,j) = LH(j);
			EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
            CAS(i,j) = 4;
        else
            STO(i,j) = STO(i-1,j) + (P_max_charge(i,j)*rend_bat(j));
			EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
            CAS(i,j) = 5;
        end
        
    elseif SP(i,j) >=(SC(i,j)/rend_ond(j)) & (SC(i,j)/rend_ond(j))>= ond_in_max(j) & SP(i,j) - (SC(i,j)/rend_ond(j)) < P_max_charge(i,j) % on charge avec la diff곥nce ent Pv et ce qui est envoy顶ers l'onduleur (2704)
        RES(i,j) = SC(i,j) - ond_out_max(j);
        if STO(i-1,j) + (SP(i,j) - (SC(i,j)/rend_ond(j)))/rend_bat(j)  >= LH(j) %% pas du rend_bat(j) 
            STO(i,j) = LH(j);
            CAS(i,j) = 6;
        else
            if SP(i,j) - ond_in_max(j) >= P_max_charge(i,j)
                STO(i,j) = STO(i-1,j) + (P_max_charge(i,j)*rend_bat(j)) ;
				EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
                CAS(i,j) = 7;
            else
                STO(i,j) = STO(i-1,j) + ((SP(i,j) - ond_in_max(j))*rend_bat(j));
                CAS(i,j) = 8;
            end
        end
       
        
    elseif SP(i,j) >=(SC(i,j)/rend_ond(j)) & (SC(i,j)/rend_ond(j))< ond_in_max(j) & SP(i,j) - (SC(i,j)/rend_ond(j)) >= P_max_charge(i,j) % on charge au maxi que peut prendre la batt곩e (2705)
        RES(i,j) = 0;
        if STO(i-1,j) + P_max_charge(i,j) >= LH(j)
            STO(i,j) = LH(j);
			EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
			if (SP(i,j)-P_max_charge(i,j))*rend_ond(j) >= ond_out_max(j)
				EXC2(i,j) = ond_out_max(j) - SC(i,j);
			else
				EXC2(i,j) = (SP(i,j)-P_max_charge(i,j))*rend_ond(j) - SC(i,j);
			end
            CAS(i,j) = 9;
        else
            STO(i,j) = STO(i-1,j) + (P_max_charge(i,j)*rend_bat(j));
            CAS(i,j) = 10;
			EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
			if (SP(i,j)-P_max_charge(i,j))*rend_ond(j) >= ond_out_max(j)
				EXC2(i,j) = ond_out_max(j) - SC(i,j);
			else
				EXC2(i,j) = (SP(i,j)-P_max_charge(i,j))*rend_ond(j) - SC(i,j);
			end
        end
       
    elseif SP(i,j) >=(SC(i,j)/rend_ond(j)) & (SC(i,j)/rend_ond(j))< ond_in_max(j) & SP(i,j) - (SC(i,j)/rend_ond(j)) < P_max_charge(i,j) % on charge avec la diff곥nce ent Pv et ce qui est envoy顶ers l'onduleur (2723)
        RES(i,j) = 0;
        if STO(i-1,j) + (SP(i,j) - (SC(i,j)/rend_ond(j)))  >= LH(j)
            STO(i,j) = LH(j);
            CAS(i,j) = 11;
        else
           STO(i,j) = STO(i-1,j) + (SP(i,j) - (SC(i,j)/rend_ond(j)))*rend_bat(j) ;
           CAS(i,j) = 12;
        end

    elseif SP(i,j) < (SC(i,j)/rend_ond(j)) & SP(i,j) >= ond_in_max(j) & SC(i,j) - ond_out_max(j) <= LR(j) 
            if SP(i,j) - ond_in_max(j) < P_max_charge(i,j) 
                RES(i,j) =  (SC(i,j) - ond_out_max(j));
                if STO(i-1,j) + (SP(i,j) - ond_in_max(j))/rend_bat(j)  >= LH(j)
                     STO(i,j) = LH(j);
                     CAS(i,j) = 13;
                else
                     STO(i,j) = STO(i-1,j) + (SP(i,j) - ond_in_max(j))*rend_bat(j) ;
                     CAS(i,j) = 14;
                end
                
            else  
                RES(i,j) = SC(i,j) - ond_out_max(j);
                if STO(i-1,j) + P_max_charge(i,j)/rend_bat(j)  >= LH(j)
                     STO(i,j) = LH(j);
					 EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
                     CAS(i,j) = 15;
                else
                     STO(i,j) = STO(i-1,j) + P_max_charge(i,j)*rend_bat(j) ;
					 EXC1(i,j) = SP(i,j)-(ond_in_max(j)+P_max_charge(i,j));
                     CAS(i,j) = 16;
                end
              
            end
        
       elseif SP(i,j) < (SC(i,j)/rend_ond(j)) & SP(i,j) < ond_in_max(j) 
			if SC(i,j) <= (SP(i,j)*rend_ond(j)) + LR(j)
			RES(i,j) = SC(i,j) - (SP(i,j)*rend_ond(j));
			STO(i,j) = STO(i-1,j);
            CAS(i,j) = 17;
            else
				if ((SC(i,j)-LR(j))/rend_ond(j) - SP(i,j))/rend_bat(j) < STO(i-1,j) - LB(j) & STO(i-1,j) - LB(j) >=  P_max_decharge(i,j)
				RES(i,j) = LR(j);
                STO(i,j) = STO(i-1,j) -(((SC(i,j)-LR(j))/rend_ond(j) - SP(i,j))/rend_bat(j));
                CAS(i,j) = 18;
				elseif ((SC(i,j)-LR(j))/rend_ond(j) - SP(i,j))/rend_bat(j) < STO(i-1,j) - LB(j) & STO(i-1,j) - LB(j)  < P_max_decharge(i,j)
				RES(i,j) = LR(j);
                STO(i,j) = STO(i-1,j) - (P_max_decharge(i,j)/rend_bat(j));
                CAS(i,j) = 19;
				elseif ((SC(i,j)-LR(j))/rend_ond(j) - SP(i,j))/rend_bat(j) > STO(i-1,j) - LB(j)
				RES(i,j) = LR(j);
                STO(i,j) = LB(j);
                CAS(i,j) = 20;
				end
			end
	           
    end
    end
   




	
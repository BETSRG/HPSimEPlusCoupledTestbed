	  h  S   k820309    q          13.1        Q�7[                                                                                                           
       C:\Users\lab303user\Desktop\HPSimProject\HPSimRepo\src\OilMixtureCalculation.f90 OILMIXTUREMOD          LOCALOILMASSFRACTION OILMIXTURESPECIFICHEAT OILMIXTUREDENSITY OILMIXTUREVISCOSITY OILMIXTURESURFACETENSION OILMIXTURETHERMALCONDUCTIVITY OILMIXTUREREYNOLDSNUMBER OILMIXTURETSAT OILMIXTUREHTCEVAP OILMIXTUREXTT OILMIXTUREOUTLETENTHALPY                                                 
       REFNAME %     @                                                   	   #ASOLUTEOILMASSFRACTION    #MIXTUREQUALITY          
                                       	        
D                                      	   %     @                                                  	   #OILMIXTURESPECIFICHEAT%SQRT    #COMPMANUFACTURER    #WLOCAL    #CPF 	   #TREF 
             @                                 SQRT       
  @                                            
                                       	        
                                  	     	        
  @                               
     	  %     @                                                    	   #COMPMANUFACTURER    #WLOCAL    #RHOF    #TREF          
  @                                            
                                       	        
                                       	        
  @                                    	  %     @                                                   	   #OILMIXTUREVISCOSITY%EXP    #OILMIXTUREVISCOSITY%TRIM    #OILMIXTUREVISCOSITY%LOG    #COMPMANUFACTURER    #WLOCAL    #MUF    #MOLEMASSREF    #TREF              @                                 EXP           @                                 TRIM           @                                 LOG       
  @                                            
                                       	        
  @                                    	        
                                       	        
  @                                    	  %     @                                                   	   #OILMIXTURESURFACETENSION%TRIM    #OILMIXTURESURFACETENSION%SQRT    #COMPMANUFACTURER    #WLOCAL    #SIGMALIQ              @                                 TRIM           @                                 SQRT       
                                               
  @                                    	        
                                       	  %     @                                                   	   #OILMIXTURETHERMALCONDUCTIVITY%TRIM     #COMPMANUFACTURER !   #WLOCAL "   #KLIQ #             @                                  TRIM       
                                  !             
                                  "     	        
                                  #     	  #     @                                  $                    #GTOT %   #XMIX &   #ID '   #MUMIX (   #MUVAP )   #RELIQ *   #REVAP +         
                                  %     	        
                                  &     	        
                                  '     	        
                                  (     	        
                                  )     	        D                                 *     	         D                                 +     	   %     @                               ,                   	   #OILMIXTURETSAT%LOG -   #WLOCAL .   #PSAT /             @                            -     LOG       
                                  .     	        
  @                               /     	  %     @                                0                 
   	   #GTOT 1   #XMIX 2   #ID 3   #MUMIX 4   #MUVAP 5   #RHOMIX 6   #RHOG 7   #KLIQ 8   #CPF 9   #OMF :         
  @                               1     	        
  @                               2     	        
  @                               3     	        
  @                               4     	        
  @                               5     	        
  @                               6     	        
  @                               7     	        
                                  8     	        
                                  9     	        
                                  :     	  %     @                               ;                    	   #GTOT <   #XMIX =   #ID >   #MUMIX ?   #MUVAP @   #RHOMIX A   #RHOG B         
  @                               <     	        
  @                               =     	        
  @                               >     	        
  @                               ?     	        
  @                               @     	        
                                  A     	        
                                  B     	  #     @                                   C                   #OILMIXTUREOUTLETENTHALPY%ABS D   #COMPMANUFACTURER E   #COILTYPE F   #PSAT G   #MDOT H   #QMOD I   #XIN J   #HFG K   #CPF L   #CPG M   #WABSOLUTE N   #HIN O   #HOUT P   #XOUT Q             @                            D     ABS       
  @                               E             
                                  F             
  @                               G     	        
                                  H     	        
  @                               I     	        
D @                               J     	         
                                  K     	        
  @                               L     	        
                                  M     	        
  @                               N     	        
                                  O     	        D                                 P     	         D @                               Q     	      �   g      fn#fn #     �   b   uapp(OILMIXTUREMOD    �  D   J  DATAGLOBALS %   A  x       LOCALOILMASSFRACTION <   �  8   a   LOCALOILMASSFRACTION%ASOLUTEOILMASSFRACTION 4   �  8   a   LOCALOILMASSFRACTION%MIXTUREQUALITY '   )  �       OILMIXTURESPECIFICHEAT ,   �  9      OILMIXTURESPECIFICHEAT%SQRT 8      8   a   OILMIXTURESPECIFICHEAT%COMPMANUFACTURER .   8  8   a   OILMIXTURESPECIFICHEAT%WLOCAL +   p  8   a   OILMIXTURESPECIFICHEAT%CPF ,   �  8   a   OILMIXTURESPECIFICHEAT%TREF "   �  ~       OILMIXTUREDENSITY 3   ^  8   a   OILMIXTUREDENSITY%COMPMANUFACTURER )   �  8   a   OILMIXTUREDENSITY%WLOCAL '   �  8   a   OILMIXTUREDENSITY%RHOF '     8   a   OILMIXTUREDENSITY%TREF $   >  �       OILMIXTUREVISCOSITY (   $  8      OILMIXTUREVISCOSITY%EXP )   \  9      OILMIXTUREVISCOSITY%TRIM (   �  8      OILMIXTUREVISCOSITY%LOG 5   �  8   a   OILMIXTUREVISCOSITY%COMPMANUFACTURER +     8   a   OILMIXTUREVISCOSITY%WLOCAL (   =  8   a   OILMIXTUREVISCOSITY%MUF 0   u  8   a   OILMIXTUREVISCOSITY%MOLEMASSREF )   �  8   a   OILMIXTUREVISCOSITY%TREF )   �  �       OILMIXTURESURFACETENSION .   �	  9      OILMIXTURESURFACETENSION%TRIM .   �	  9      OILMIXTURESURFACETENSION%SQRT :   
  8   a   OILMIXTURESURFACETENSION%COMPMANUFACTURER 0   M
  8   a   OILMIXTURESURFACETENSION%WLOCAL 2   �
  8   a   OILMIXTURESURFACETENSION%SIGMALIQ .   �
  �       OILMIXTURETHERMALCONDUCTIVITY 3   Y  9      OILMIXTURETHERMALCONDUCTIVITY%TRIM ?   �  8   a   OILMIXTURETHERMALCONDUCTIVITY%COMPMANUFACTURER 5   �  8   a   OILMIXTURETHERMALCONDUCTIVITY%WLOCAL 3     8   a   OILMIXTURETHERMALCONDUCTIVITY%KLIQ )   :  �       OILMIXTUREREYNOLDSNUMBER .   �  8   a   OILMIXTUREREYNOLDSNUMBER%GTOT .   �  8   a   OILMIXTUREREYNOLDSNUMBER%XMIX ,   6  8   a   OILMIXTUREREYNOLDSNUMBER%ID /   n  8   a   OILMIXTUREREYNOLDSNUMBER%MUMIX /   �  8   a   OILMIXTUREREYNOLDSNUMBER%MUVAP /   �  8   a   OILMIXTUREREYNOLDSNUMBER%RELIQ /     8   a   OILMIXTUREREYNOLDSNUMBER%REVAP    N  v       OILMIXTURETSAT #   �  8      OILMIXTURETSAT%LOG &   �  8   a   OILMIXTURETSAT%WLOCAL $   4  8   a   OILMIXTURETSAT%PSAT "   l  �       OILMIXTUREHTCEVAP '     8   a   OILMIXTUREHTCEVAP%GTOT '   P  8   a   OILMIXTUREHTCEVAP%XMIX %   �  8   a   OILMIXTUREHTCEVAP%ID (   �  8   a   OILMIXTUREHTCEVAP%MUMIX (   �  8   a   OILMIXTUREHTCEVAP%MUVAP )   0  8   a   OILMIXTUREHTCEVAP%RHOMIX '   h  8   a   OILMIXTUREHTCEVAP%RHOG '   �  8   a   OILMIXTUREHTCEVAP%KLIQ &   �  8   a   OILMIXTUREHTCEVAP%CPF &     8   a   OILMIXTUREHTCEVAP%OMF    H  �       OILMIXTUREXTT #   �  8   a   OILMIXTUREXTT%GTOT #     8   a   OILMIXTUREXTT%XMIX !   H  8   a   OILMIXTUREXTT%ID $   �  8   a   OILMIXTUREXTT%MUMIX $   �  8   a   OILMIXTUREXTT%MUVAP %   �  8   a   OILMIXTUREXTT%RHOMIX #   (  8   a   OILMIXTUREXTT%RHOG )   `  �       OILMIXTUREOUTLETENTHALPY -   X  8      OILMIXTUREOUTLETENTHALPY%ABS :   �  8   a   OILMIXTUREOUTLETENTHALPY%COMPMANUFACTURER 2   �  8   a   OILMIXTUREOUTLETENTHALPY%COILTYPE .      8   a   OILMIXTUREOUTLETENTHALPY%PSAT .   8  8   a   OILMIXTUREOUTLETENTHALPY%MDOT .   p  8   a   OILMIXTUREOUTLETENTHALPY%QMOD -   �  8   a   OILMIXTUREOUTLETENTHALPY%XIN -   �  8   a   OILMIXTUREOUTLETENTHALPY%HFG -     8   a   OILMIXTUREOUTLETENTHALPY%CPF -   P  8   a   OILMIXTUREOUTLETENTHALPY%CPG 3   �  8   a   OILMIXTUREOUTLETENTHALPY%WABSOLUTE -   �  8   a   OILMIXTUREOUTLETENTHALPY%HIN .   �  8   a   OILMIXTUREOUTLETENTHALPY%HOUT .   0  8   a   OILMIXTUREOUTLETENTHALPY%XOUT 
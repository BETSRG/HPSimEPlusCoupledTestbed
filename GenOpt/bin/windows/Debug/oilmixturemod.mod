	  Ė  T   k820309    q          13.1        ÜÁĒT                                                                                                           
       C:\Users\lab303user\Documents\betsrg_dual\GenOpt\Shared Code\OilMixtureCalculation_Shared.f90 OILMIXTUREMOD          LOCALOILMASSFRACTION OILMIXTURESPECIFICHEAT OILMIXTUREDENSITY OILMIXTUREVISCOSITY OILMIXTURESURFACETENSION OILMIXTURETHERMALCONDUCTIVITY OILMIXTUREREYNOLDSNUMBER OILMIXTURETSAT OILMIXTUREHTCEVAP OILMIXTUREXTT OILMIXTUREOUTLETENTHALPY                                                 
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
                                  O     	        D                                 P     	         D @                               Q     	   *          n              
                 CIFWIN.LIB   n                             CADVAPI32.LIB   n                              CCOMDLG32.LIB   n             
                 CGDI32.LIB   n                             CKERNEL32.LIB   n             	                 CLZ32.LIB   n                              CMPR.LIB   n                               CSHELL32.LIB   n                               CUSER32.LIB   n                            CVERSION.LIB   n              
                 CWINMM.LIB   n                             CWINSPOOL.LIB   n                              CWSOCK32.LIB   n                               CCOMCTL32.LIB   n             
                  Cole32.lib   n               Ą              Coleaut32.lib   n             
   Ē              Cpsapi.lib   n               Ģ              CWS2_32.LIB                                                                                                                                                                                                                                                                                                                             t      fn#fn #     ö   b   uapp(OILMIXTUREMOD ,   
  D   J  DATAGLOBALS_HPSIMINTEGRATED %   N  x       LOCALOILMASSFRACTION <   Æ  8   a   LOCALOILMASSFRACTION%ASOLUTEOILMASSFRACTION 4   þ  8   a   LOCALOILMASSFRACTION%MIXTUREQUALITY '   6         OILMIXTURESPECIFICHEAT ,   Ô  9      OILMIXTURESPECIFICHEAT%SQRT 8     8   a   OILMIXTURESPECIFICHEAT%COMPMANUFACTURER .   E  8   a   OILMIXTURESPECIFICHEAT%WLOCAL +   }  8   a   OILMIXTURESPECIFICHEAT%CPF ,   ĩ  8   a   OILMIXTURESPECIFICHEAT%TREF "   í  ~       OILMIXTUREDENSITY 3   k  8   a   OILMIXTUREDENSITY%COMPMANUFACTURER )   Ģ  8   a   OILMIXTUREDENSITY%WLOCAL '   Û  8   a   OILMIXTUREDENSITY%RHOF '     8   a   OILMIXTUREDENSITY%TREF $   K  æ       OILMIXTUREVISCOSITY (   1  8      OILMIXTUREVISCOSITY%EXP )   i  9      OILMIXTUREVISCOSITY%TRIM (   Ē  8      OILMIXTUREVISCOSITY%LOG 5   Ú  8   a   OILMIXTUREVISCOSITY%COMPMANUFACTURER +     8   a   OILMIXTUREVISCOSITY%WLOCAL (   J  8   a   OILMIXTUREVISCOSITY%MUF 0     8   a   OILMIXTUREVISCOSITY%MOLEMASSREF )   š  8   a   OILMIXTUREVISCOSITY%TREF )   ō  ū       OILMIXTURESURFACETENSION .   °	  9      OILMIXTURESURFACETENSION%TRIM .   é	  9      OILMIXTURESURFACETENSION%SQRT :   "
  8   a   OILMIXTURESURFACETENSION%COMPMANUFACTURER 0   Z
  8   a   OILMIXTURESURFACETENSION%WLOCAL 2   
  8   a   OILMIXTURESURFACETENSION%SIGMALIQ .   Ę
         OILMIXTURETHERMALCONDUCTIVITY 3   f  9      OILMIXTURETHERMALCONDUCTIVITY%TRIM ?     8   a   OILMIXTURETHERMALCONDUCTIVITY%COMPMANUFACTURER 5   Ũ  8   a   OILMIXTURETHERMALCONDUCTIVITY%WLOCAL 3     8   a   OILMIXTURETHERMALCONDUCTIVITY%KLIQ )   G         OILMIXTUREREYNOLDSNUMBER .   Ó  8   a   OILMIXTUREREYNOLDSNUMBER%GTOT .     8   a   OILMIXTUREREYNOLDSNUMBER%XMIX ,   C  8   a   OILMIXTUREREYNOLDSNUMBER%ID /   {  8   a   OILMIXTUREREYNOLDSNUMBER%MUMIX /   ģ  8   a   OILMIXTUREREYNOLDSNUMBER%MUVAP /   ë  8   a   OILMIXTUREREYNOLDSNUMBER%RELIQ /   #  8   a   OILMIXTUREREYNOLDSNUMBER%REVAP    [  v       OILMIXTURETSAT #   Ņ  8      OILMIXTURETSAT%LOG &   	  8   a   OILMIXTURETSAT%WLOCAL $   A  8   a   OILMIXTURETSAT%PSAT "   y  Ž       OILMIXTUREHTCEVAP '   %  8   a   OILMIXTUREHTCEVAP%GTOT '   ]  8   a   OILMIXTUREHTCEVAP%XMIX %     8   a   OILMIXTUREHTCEVAP%ID (   Í  8   a   OILMIXTUREHTCEVAP%MUMIX (     8   a   OILMIXTUREHTCEVAP%MUVAP )   =  8   a   OILMIXTUREHTCEVAP%RHOMIX '   u  8   a   OILMIXTUREHTCEVAP%RHOG '   ­  8   a   OILMIXTUREHTCEVAP%KLIQ &   å  8   a   OILMIXTUREHTCEVAP%CPF &     8   a   OILMIXTUREHTCEVAP%OMF    U         OILMIXTUREXTT #   å  8   a   OILMIXTUREXTT%GTOT #     8   a   OILMIXTUREXTT%XMIX !   U  8   a   OILMIXTUREXTT%ID $     8   a   OILMIXTUREXTT%MUMIX $   Å  8   a   OILMIXTUREXTT%MUVAP %   ý  8   a   OILMIXTUREXTT%RHOMIX #   5  8   a   OILMIXTUREXTT%RHOG )   m  ø       OILMIXTUREOUTLETENTHALPY -   e  8      OILMIXTUREOUTLETENTHALPY%ABS :     8   a   OILMIXTUREOUTLETENTHALPY%COMPMANUFACTURER 2   Õ  8   a   OILMIXTUREOUTLETENTHALPY%COILTYPE .     8   a   OILMIXTUREOUTLETENTHALPY%PSAT .   E  8   a   OILMIXTUREOUTLETENTHALPY%MDOT .   }  8   a   OILMIXTUREOUTLETENTHALPY%QMOD -   ĩ  8   a   OILMIXTUREOUTLETENTHALPY%XIN -   í  8   a   OILMIXTUREOUTLETENTHALPY%HFG -   %  8   a   OILMIXTUREOUTLETENTHALPY%CPF -   ]  8   a   OILMIXTUREOUTLETENTHALPY%CPG 3     8   a   OILMIXTUREOUTLETENTHALPY%WABSOLUTE -   Í  8   a   OILMIXTUREOUTLETENTHALPY%HIN .     8   a   OILMIXTUREOUTLETENTHALPY%HOUT .   =  8   a   OILMIXTUREOUTLETENTHALPY%XOUT    u  W     MsObjComment 
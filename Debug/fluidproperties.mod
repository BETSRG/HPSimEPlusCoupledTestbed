	  �#  o   k820309    q          13.1        ,�<[                                                                                                           
       C:\Users\lab303user\Desktop\HPSimProject\HPSimRepo\src\FluidProperties.f90 FLUIDPROPERTIES          GETSATPRESSUREREFRIG GETSATTEMPERATUREREFRIG GETSATENTHALPYREFRIG GETSATDENSITYREFRIG GETSATSPECIFICHEATREFRIG GETSUPHEATENTHALPYREFRIG GETSUPHEATPRESSUREREFRIG GETSUPHEATDENSITYREFRIG GETSPECIFICHEATGLYCOL GETCONDUCTIVITYGLYCOL GETDENSITYGLYCOL GETVISCOSITYGLYCOL GETQUALITYREFRIG CHECKFLUIDPROPERTYNAME REPORTORPHANFLUIDS FINDREFRIGERANT FINDGLYCOL GETGLYCOLNAMEBYINDEX FINDARRAYINDEX FLUIDINDEX_WATER FLUIDINDEX_ETHYLENEGLYCOL FLUIDINDEX_PROPOLENEGLYCOL                                                
                                                       
       MAXNAMELENGTH WARMUPFLAG OUTPUTFILEDEBUG                                                 
       SHOWRECURRINGWARNINGERRORATEND SHOWRECURRINGSEVEREERRORATEND SHOWCONTINUEERRORTIMESTAMP                                                                                                                                              %     @                                                   
   #GETSATPRESSUREREFRIG%TRIM    #REFRIGERANT 	   #TEMPERATURE 
   #REFRIGINDEX    #CALLEDFROM              @                                 TRIM       
@ @                              	            1       
@ @                              
     
        
D                                               
@ @                                          1 %     @                                                    
   #GETSATTEMPERATUREREFRIG%TRIM    #REFRIGERANT    #PRESSURE    #REFRIGINDEX    #CALLEDFROM              @                                 TRIM       
@ @                                          1       
@ @                                   
        
D                                               
@ @                                          1 %     @                                                   
   #GETSATENTHALPYREFRIG%TRIM    #REFRIGERANT    #TEMPERATURE    #QUALITY    #REFRIGINDEX    #CALLEDFROM              @                                 TRIM       
@ @                                          1       
  @                                   
        
@ @                                   
        
D                                               
@ @                                          1 %     @                                                   
   #GETSATDENSITYREFRIG%TRIM    #REFRIGERANT    #TEMPERATURE    #QUALITY    #REFRIGINDEX    #CALLEDFROM               @                                 TRIM       
@ @                                          1       
@ @                                   
        
@ @                                   
        
D                                               
@ @                                           1 %     @                                !                   
   #GETSATSPECIFICHEATREFRIG%TRIM "   #REFRIGERANT #   #TEMPERATURE $   #QUALITY %   #REFRIGINDEX &   #CALLEDFROM '             @                            "     TRIM       
@ @                              #            1       
  @                              $     
        
@ @                              %     
        
D                                 &              
@ @                              '            1 %     @                                 (                   
   #GETSUPHEATENTHALPYREFRIG%TRIM )   #REFRIGERANT *   #TEMPERATURE +   #PRESSURE ,   #REFRIGINDEX -   #CALLEDFROM .             @                            )     TRIM       
@ @                              *            1       
@ @                              +     
        
@ @                              ,     
        
D                                 -              
@ @                              .            1 %     @                                 /                   
   #GETSUPHEATPRESSUREREFRIG%MIN 0   #GETSUPHEATPRESSUREREFRIG%TRIM 1   #GETSUPHEATPRESSUREREFRIG%MAX 2   #REFRIGERANT 3   #TEMPERATURE 4   #ENTHALPY 5   #REFRIGINDEX 6   #CALLEDFROM 7             @                            0     MIN           @                            1     TRIM           @                            2     MAX       
@ @                              3            1       
  @                              4     
        
                                 5     
        
D                                 6              
@ @                              7            1 %     @                                 8                   
   #GETSUPHEATDENSITYREFRIG%TRIM 9   #REFRIGERANT :   #TEMPERATURE ;   #PRESSURE <   #REFRIGINDEX =   #CALLEDFROM >             @                            9     TRIM       
@ @                              :            1       
@ @                              ;     
        
@ @                              <     
        
D                                 =              
@ @                              >            1 %     @                                ?                   
   #GETSPECIFICHEATGLYCOL%TRIM @   #GLYCOL A   #TEMPERATURE B   #GLYCOLINDEX C   #CALLEDFROM D             @                            @     TRIM       
@ @                              A            1       
@ @                              B     
        
D                                 C              
@ @                              D            1 %     @                                E                   
   #GETCONDUCTIVITYGLYCOL%TRIM F   #GLYCOL G   #TEMPERATURE H   #GLYCOLINDEX I   #CALLEDFROM J             @                            F     TRIM       
@ @                              G            1       
@ @                              H     
        
D                                 I              
@ @                              J            1 %     @                                K                   
   #GETDENSITYGLYCOL%TRIM L   #GLYCOL M   #TEMPERATURE N   #GLYCOLINDEX O   #CALLEDFROM P             @                            L     TRIM       
@ @                              M            1       
@ @                              N     
        
D                                 O              
@ @                              P            1 %     @                                Q                   
   #GETVISCOSITYGLYCOL%TRIM R   #GLYCOL S   #TEMPERATURE T   #GLYCOLINDEX U   #CALLEDFROM V             @                            R     TRIM       
@ @                              S            1       
@ @                              T     
        
D                                 U              
@ @                              V            1 %     @                                 W                    
   #REFRIGERANT X   #TEMPERATURE Y   #ENTHALPY Z   #REFRIGINDEX [   #CALLEDFROM \         
@ @                              X            1       
  @                              Y     
        
                                 Z     
        
D                                 [              
@ @                              \            1 %     @                                ]                       #NAMETOCHECK ^         
  @                              ^            1 #     @                                   _                    #REPORTORPHANFLUIDS%TRIM `             @                            `     TRIM %     @                               a                       #REFRIGERANT b         
  @                              b            1 %     @                               c                       #GLYCOL d         
  @                              d            1 $     @                                 e     �                  #INDEX f             
                                  f       %     @                               g                      #FINDARRAYINDEX%SIZE h   #FINDARRAYINDEX%PRESENT i   #VALUE j   #ARRAY k   #LOWBOUND l   #UPPERBOUND m             @                            h     SIZE           @                            i     PRESENT       
                                 j     
        
 @                              k           
 S         &                             
 @                               l             
 @                               m          �   c      fn#fn %     �  b   uapp(FLUIDPROPERTIES %   �  <   J  DATAPRECISIONGLOBALS      e   J  DATAGLOBALS    y  �   J  DATAINTERFACES !     8       FLUIDINDEX_WATER *   E  8       FLUIDINDEX_ETHYLENEGLYCOL +   }  8       FLUIDINDEX_PROPOLENEGLYCOL %   �  �       GETSATPRESSUREREFRIG *   _  9      GETSATPRESSUREREFRIG%TRIM 1   �  @   a   GETSATPRESSUREREFRIG%REFRIGERANT 1   �  8   a   GETSATPRESSUREREFRIG%TEMPERATURE 1     8   a   GETSATPRESSUREREFRIG%REFRIGINDEX 0   H  @   a   GETSATPRESSUREREFRIG%CALLEDFROM (   �  �       GETSATTEMPERATUREREFRIG -   2  9      GETSATTEMPERATUREREFRIG%TRIM 4   k  @   a   GETSATTEMPERATUREREFRIG%REFRIGERANT 1   �  8   a   GETSATTEMPERATUREREFRIG%PRESSURE 4   �  8   a   GETSATTEMPERATUREREFRIG%REFRIGINDEX 3     @   a   GETSATTEMPERATUREREFRIG%CALLEDFROM %   [  �       GETSATENTHALPYREFRIG *   	  9      GETSATENTHALPYREFRIG%TRIM 1   K	  @   a   GETSATENTHALPYREFRIG%REFRIGERANT 1   �	  8   a   GETSATENTHALPYREFRIG%TEMPERATURE -   �	  8   a   GETSATENTHALPYREFRIG%QUALITY 1   �	  8   a   GETSATENTHALPYREFRIG%REFRIGINDEX 0   3
  @   a   GETSATENTHALPYREFRIG%CALLEDFROM $   s
  �       GETSATDENSITYREFRIG )   )  9      GETSATDENSITYREFRIG%TRIM 0   b  @   a   GETSATDENSITYREFRIG%REFRIGERANT 0   �  8   a   GETSATDENSITYREFRIG%TEMPERATURE ,   �  8   a   GETSATDENSITYREFRIG%QUALITY 0     8   a   GETSATDENSITYREFRIG%REFRIGINDEX /   J  @   a   GETSATDENSITYREFRIG%CALLEDFROM )   �  �       GETSATSPECIFICHEATREFRIG .   E  9      GETSATSPECIFICHEATREFRIG%TRIM 5   ~  @   a   GETSATSPECIFICHEATREFRIG%REFRIGERANT 5   �  8   a   GETSATSPECIFICHEATREFRIG%TEMPERATURE 1   �  8   a   GETSATSPECIFICHEATREFRIG%QUALITY 5   .  8   a   GETSATSPECIFICHEATREFRIG%REFRIGINDEX 4   f  @   a   GETSATSPECIFICHEATREFRIG%CALLEDFROM )   �  �       GETSUPHEATENTHALPYREFRIG .   b  9      GETSUPHEATENTHALPYREFRIG%TRIM 5   �  @   a   GETSUPHEATENTHALPYREFRIG%REFRIGERANT 5   �  8   a   GETSUPHEATENTHALPYREFRIG%TEMPERATURE 2     8   a   GETSUPHEATENTHALPYREFRIG%PRESSURE 5   K  8   a   GETSUPHEATENTHALPYREFRIG%REFRIGINDEX 4   �  @   a   GETSUPHEATENTHALPYREFRIG%CALLEDFROM )   �         GETSUPHEATPRESSUREREFRIG -   �  8      GETSUPHEATPRESSUREREFRIG%MIN .   �  9      GETSUPHEATPRESSUREREFRIG%TRIM -   4  8      GETSUPHEATPRESSUREREFRIG%MAX 5   l  @   a   GETSUPHEATPRESSUREREFRIG%REFRIGERANT 5   �  8   a   GETSUPHEATPRESSUREREFRIG%TEMPERATURE 2   �  8   a   GETSUPHEATPRESSUREREFRIG%ENTHALPY 5     8   a   GETSUPHEATPRESSUREREFRIG%REFRIGINDEX 4   T  @   a   GETSUPHEATPRESSUREREFRIG%CALLEDFROM (   �  �       GETSUPHEATDENSITYREFRIG -   O  9      GETSUPHEATDENSITYREFRIG%TRIM 4   �  @   a   GETSUPHEATDENSITYREFRIG%REFRIGERANT 4   �  8   a   GETSUPHEATDENSITYREFRIG%TEMPERATURE 1      8   a   GETSUPHEATDENSITYREFRIG%PRESSURE 4   8  8   a   GETSUPHEATDENSITYREFRIG%REFRIGINDEX 3   p  @   a   GETSUPHEATDENSITYREFRIG%CALLEDFROM &   �  �       GETSPECIFICHEATGLYCOL +   V  9      GETSPECIFICHEATGLYCOL%TRIM -   �  @   a   GETSPECIFICHEATGLYCOL%GLYCOL 2   �  8   a   GETSPECIFICHEATGLYCOL%TEMPERATURE 2     8   a   GETSPECIFICHEATGLYCOL%GLYCOLINDEX 1   ?  @   a   GETSPECIFICHEATGLYCOL%CALLEDFROM &     �       GETCONDUCTIVITYGLYCOL +   %  9      GETCONDUCTIVITYGLYCOL%TRIM -   ^  @   a   GETCONDUCTIVITYGLYCOL%GLYCOL 2   �  8   a   GETCONDUCTIVITYGLYCOL%TEMPERATURE 2   �  8   a   GETCONDUCTIVITYGLYCOL%GLYCOLINDEX 1     @   a   GETCONDUCTIVITYGLYCOL%CALLEDFROM !   N  �       GETDENSITYGLYCOL &   �  9      GETDENSITYGLYCOL%TRIM (   (  @   a   GETDENSITYGLYCOL%GLYCOL -   h  8   a   GETDENSITYGLYCOL%TEMPERATURE -   �  8   a   GETDENSITYGLYCOL%GLYCOLINDEX ,   �  @   a   GETDENSITYGLYCOL%CALLEDFROM #     �       GETVISCOSITYGLYCOL (   �  9      GETVISCOSITYGLYCOL%TRIM *   �  @   a   GETVISCOSITYGLYCOL%GLYCOL /   4  8   a   GETVISCOSITYGLYCOL%TEMPERATURE /   l  8   a   GETVISCOSITYGLYCOL%GLYCOLINDEX .   �  @   a   GETVISCOSITYGLYCOL%CALLEDFROM !   �  �       GETQUALITYREFRIG -   }  @   a   GETQUALITYREFRIG%REFRIGERANT -   �  8   a   GETQUALITYREFRIG%TEMPERATURE *   �  8   a   GETQUALITYREFRIG%ENTHALPY -   -  8   a   GETQUALITYREFRIG%REFRIGINDEX ,   e  @   a   GETQUALITYREFRIG%CALLEDFROM '   �  Y       CHECKFLUIDPROPERTYNAME 3   �  @   a   CHECKFLUIDPROPERTYNAME%NAMETOCHECK #   >  a       REPORTORPHANFLUIDS (   �  9      REPORTORPHANFLUIDS%TRIM     �  Y       FINDREFRIGERANT ,   1   @   a   FINDREFRIGERANT%REFRIGERANT    q   T       FINDGLYCOL "   �   @   a   FINDGLYCOL%GLYCOL %   !  W       GETGLYCOLNAMEBYINDEX +   \!  8   a   GETGLYCOLNAMEBYINDEX%INDEX    �!  �       FINDARRAYINDEX $   E"  9      FINDARRAYINDEX%SIZE '   ~"  <      FINDARRAYINDEX%PRESENT %   �"  8   a   FINDARRAYINDEX%VALUE %   �"  h   a   FINDARRAYINDEX%ARRAY (   Z#  8   a   FINDARRAYINDEX%LOWBOUND *   �#  8   a   FINDARRAYINDEX%UPPERBOUND 
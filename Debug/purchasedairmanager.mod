	  �  D   k820309    q          13.1        T�3]                                                                                                           
       C:\Users\lab303user\Desktop\HPSimProject\HPSimRepo\src\Purchasedairmanager.f90 PURCHASEDAIRMANAGER          SIMPURCHASEDAIR GETPURCHASEDAIROUTAIRMASSFLOW                                                
                                                      
                                                      
                                                       
       ZONEAIRHUMRAT ZONETHERMOSTATSETPOINTHI ZONETHERMOSTATSETPOINTLO                                                 
       STDBAROPRESS OUTBAROPRESS OUTHUMRAT OUTENTHALPY STDRHOAIR                                                
                        @                              
                        @                              
       PSYRHOAIRFNPBTDBW PSYHFNTDBW PSYTDBFNHW PSYCPAIRFNWTDB PSYTSATFNHPB PSYWFNTDBH PSYWFNTDBRHPB %     @      !                           	                   
   #PSYRHOAIRFNPBTDBW%MAX 
   #PB    #TDB    #DW    #CALLEDFROM              @                            
     MAX       
                                      
        
                                      
        
                                      
        
                                            1 %     @      !                                             
   #PSYHFNTDBW%MAX    #TDB    #DW    #CALLEDFROM              @                                 MAX       
                                      
        
                                      
        
                                            1 %     @      !                                             
   #PSYTDBFNHW%MAX    #H    #DW    #CALLEDFROM              @                                 MAX       
                                      
        
                                      
        
                                            1 %     @      !                                             
   #PSYCPAIRFNWTDB%MAX    #DW    #T    #CALLEDFROM              @                                 MAX       
                                      
        
                                      
        
                                            1 %     @      !                                             
   #PSYTSATFNHPB%MAX    #PSYTSATFNHPB%PRESENT     #PSYTSATFNHPB%TRIM !   #PSYTSATFNHPB%ABS "   #PSYTSATFNHPB%MIN #   #H $   #PB %   #CALLEDFROM &             @                                 MAX           @                                  PRESENT           @                            !     TRIM           @                            "     ABS           @                            #     MIN       
                                 $     
        
                                 %     
        
                                &            1 %     @      !                          '                   
   #PSYWFNTDBH%PRESENT (   #PSYWFNTDBH%TRIM )   #TDB *   #H +   #CALLEDFROM ,             @                            (     PRESENT           @                            )     TRIM       
                                 *     
        
                                 +     
        
                                ,            1 %     @      !                          -                   
   #PSYWFNTDBRHPB%PRESENT .   #PSYWFNTDBRHPB%TRIM /   #TDB 0   #RH 1   #PB 2   #CALLEDFROM 3             @                            .     PRESENT           @                            /     TRIM       
                                 0     
        
                                 1     
        
                                 2     
        
                                3            1 %     @                               4                       #SCHEDULENAME 5                                          5             1 %     @                               6                    
   #SCHEDULEINDEX 7                                          7        #     @                                   8                   #SIMPURCHASEDAIR%TRIM 9   #PURCHAIRNAME :   #SYSOUTPUTPROVIDED ;   #MOISTOUTPUTPROVIDED <   #FIRSTHVACITERATION =   #CONTROLLEDZONENUM >   #ACTUALZONENUM ?   #COMPINDEX @                                                @                            9     TRIM       
  @                              :            1       
D @                              ;     
         D @                              <     
         
  @                               =             
  @                               >             
  @                               ?             
D                                 @        %     @                                 A                    
   #PURCHAIRNUM B         
                                  B          �   k      fn#fn )     :   b   uapp(PURCHASEDAIRMANAGER %   E  <   J  DATAPRECISIONGLOBALS    �  <   J  DATAGLOBALS     �  <   J  DATAHVACGLOBALS "   �  |   J  DATAHEATBALFANSYS     u  v   J  DATAENVIRONMENT    �  <   J  DATAINTERFACES     '  <   J  SCHEDULEMANAGER    c  �   J  PSYCHROMETRICS 1   �  �       PSYRHOAIRFNPBTDBW+PSYCHROMETRICS 9   �  8      PSYRHOAIRFNPBTDBW%MAX+PSYCHROMETRICS=MAX 4   �  8   a   PSYRHOAIRFNPBTDBW%PB+PSYCHROMETRICS 5   �  8   a   PSYRHOAIRFNPBTDBW%TDB+PSYCHROMETRICS 4   0  8   a   PSYRHOAIRFNPBTDBW%DW+PSYCHROMETRICS <   h  @   a   PSYRHOAIRFNPBTDBW%CALLEDFROM+PSYCHROMETRICS *   �  }       PSYHFNTDBW+PSYCHROMETRICS 2   %  8      PSYHFNTDBW%MAX+PSYCHROMETRICS=MAX .   ]  8   a   PSYHFNTDBW%TDB+PSYCHROMETRICS -   �  8   a   PSYHFNTDBW%DW+PSYCHROMETRICS 5   �  @   a   PSYHFNTDBW%CALLEDFROM+PSYCHROMETRICS *     {       PSYTDBFNHW+PSYCHROMETRICS 2   �  8      PSYTDBFNHW%MAX+PSYCHROMETRICS=MAX ,   �  8   a   PSYTDBFNHW%H+PSYCHROMETRICS -   �  8   a   PSYTDBFNHW%DW+PSYCHROMETRICS 5   0  @   a   PSYTDBFNHW%CALLEDFROM+PSYCHROMETRICS .   p         PSYCPAIRFNWTDB+PSYCHROMETRICS 6   �  8      PSYCPAIRFNWTDB%MAX+PSYCHROMETRICS=MAX 1   '	  8   a   PSYCPAIRFNWTDB%DW+PSYCHROMETRICS 0   _	  8   a   PSYCPAIRFNWTDB%T+PSYCHROMETRICS 9   �	  @   a   PSYCPAIRFNWTDB%CALLEDFROM+PSYCHROMETRICS ,   �	  �       PSYTSATFNHPB+PSYCHROMETRICS 4   �
  8      PSYTSATFNHPB%MAX+PSYCHROMETRICS=MAX <   �
  <      PSYTSATFNHPB%PRESENT+PSYCHROMETRICS=PRESENT 6   %  9      PSYTSATFNHPB%TRIM+PSYCHROMETRICS=TRIM 4   ^  8      PSYTSATFNHPB%ABS+PSYCHROMETRICS=ABS 4   �  8      PSYTSATFNHPB%MIN+PSYCHROMETRICS=MIN .   �  8   a   PSYTSATFNHPB%H+PSYCHROMETRICS /     8   a   PSYTSATFNHPB%PB+PSYCHROMETRICS 7   >  @   a   PSYTSATFNHPB%CALLEDFROM+PSYCHROMETRICS *   ~  �       PSYWFNTDBH+PSYCHROMETRICS :     <      PSYWFNTDBH%PRESENT+PSYCHROMETRICS=PRESENT 4   O  9      PSYWFNTDBH%TRIM+PSYCHROMETRICS=TRIM .   �  8   a   PSYWFNTDBH%TDB+PSYCHROMETRICS ,   �  8   a   PSYWFNTDBH%H+PSYCHROMETRICS 5   �  @   a   PSYWFNTDBH%CALLEDFROM+PSYCHROMETRICS -   8  �       PSYWFNTDBRHPB+PSYCHROMETRICS =   �  <      PSYWFNTDBRHPB%PRESENT+PSYCHROMETRICS=PRESENT 7     9      PSYWFNTDBRHPB%TRIM+PSYCHROMETRICS=TRIM 1   Q  8   a   PSYWFNTDBRHPB%TDB+PSYCHROMETRICS 0   �  8   a   PSYWFNTDBRHPB%RH+PSYCHROMETRICS 0   �  8   a   PSYWFNTDBRHPB%PB+PSYCHROMETRICS 8   �  @   a   PSYWFNTDBRHPB%CALLEDFROM+PSYCHROMETRICS 1   9  Z       GETSCHEDULEINDEX+SCHEDULEMANAGER >   �  @   a   GETSCHEDULEINDEX%SCHEDULENAME+SCHEDULEMANAGER 8   �  [       GETCURRENTSCHEDULEVALUE+SCHEDULEMANAGER F   .  8   a   GETCURRENTSCHEDULEVALUE%SCHEDULEINDEX+SCHEDULEMANAGER     f        SIMPURCHASEDAIR %   z  9      SIMPURCHASEDAIR%TRIM -   �  @   a   SIMPURCHASEDAIR%PURCHAIRNAME 2   �  8   a   SIMPURCHASEDAIR%SYSOUTPUTPROVIDED 4   +  8   a   SIMPURCHASEDAIR%MOISTOUTPUTPROVIDED 3   c  8   a   SIMPURCHASEDAIR%FIRSTHVACITERATION 2   �  8   a   SIMPURCHASEDAIR%CONTROLLEDZONENUM .   �  8   a   SIMPURCHASEDAIR%ACTUALZONENUM *     8   a   SIMPURCHASEDAIR%COMPINDEX .   C  Y       GETPURCHASEDAIROUTAIRMASSFLOW :   �  8   a   GETPURCHASEDAIROUTAIRMASSFLOW%PURCHAIRNUM 
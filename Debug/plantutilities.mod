	  wP  �   k820309    q          13.1        |�3]                                                                                                           
       C:\Users\lab303user\Desktop\HPSimProject\HPSimRepo\src\PlantUtilities.f90 PLANTUTILITIES                                                
                                                      
                                                                                         #     @                                        	               #MESSAGE    #UNIT1    #UNIT2                                                       1                                                                                             #     @                                       	               #MESSAGE 	   #UNIT1 
   #UNIT2                                          	             1                                       
                                                      #     @                                       	               #MESSAGE    #INDEX    #REPORTMAXOF    #REPORTMINOF    #REPORTSUMOF    #REPORTMAXUNITS    #REPORTMINUNITS    #REPORTSUMUNITS                                                      1       
                                              
                                    
        
                                    
        
                                    
        
                                           1       
                                           1       
                                           1 #     @                                        	               #MESSAGE    #INDEX    #REPORTMAXOF    #REPORTMINOF    #REPORTSUMOF    #REPORTMAXUNITS    #REPORTMINUNITS    #REPORTSUMUNITS                                                      1       
                                              
                                    
        
                                    
        
                                    
        
                                           1       
                                           1       
                                           1 #     @                                                       #MINCOMPMDOT    #MAXCOMPMDOT     #INLETNODE !   #OUTLETNODE "   #LOOPNUM #   #LOOPSIDENUM $   #BRANCHINDEX %   #COMPINDEX &                                                    
                                      
        
                                       
        
                                  !             
                                  "             
                                  #             
                                  $             
                                  %             
                                  &       #     @                                   '                   #SETCOMPONENTFLOWRATE%ABS (   #SETCOMPONENTFLOWRATE%MIN )   #SETCOMPONENTFLOWRATE%MAX *   #SETCOMPONENTFLOWRATE%TRIM +   #COMPFLOW ,   #INLETNODE -   #OUTLETNODE .   #LOOPNUM /   #LOOPSIDENUM 0   #BRANCHINDEX 1   #COMPINDEX 2                                                                                                                                                                                                                                                                                                     (     ABS                                        )     MIN                                        *     MAX                                        +     TRIM       
D @                              ,     
         
                                  -             
                                  .             
                                  /             
                                  0             
                                  1             
                                  2       #     @                                   3                   #SETACTUATEDBRANCHFLOWRATE%ABS 4   #SETACTUATEDBRANCHFLOWRATE%MIN 5   #SETACTUATEDBRANCHFLOWRATE%MAX 6   #SETACTUATEDBRANCHFLOWRATE%TRIM 7   #COMPFLOW 8   #ACTUATEDNODE 9   #LOOPNUM :   #LOOPSIDENUM ;   #BRANCHNUM <   #RESETMODE =                                                                                                                                                                                                                         4     ABS                                        5     MIN                                        6     MAX                                        7     TRIM       
D @                              8     
         
                                  9             
                                  :             
                                  ;             
                                  <             
                                  =       %     @                               >                   
   #REGULATECONDENSERCOMPFLOWREQOP%ABS ?   #LOOPNUM @   #LOOPSIDENUM A   #BRANCHNUM B   #COMPNUM C   #TENTATIVEFLOWREQUEST D                                                                                                                                                                                                                           ?     ABS                                        @                                               A                                               B                                               C                                              D     
   #     @                                   E                   #UPDATEPLANTMIXER%MIN F   #UPDATEPLANTMIXER%MAX G   #LOOPNUM H   #LOOPSIDENUM I   #MIXNUM J                                                                                                            F     MIN                                        G     MAX       
                                  H             
                                  I             
                                  J       %     @                                 K                       #ANYPLANTSPLITTERMIXERLACKSCONTINUITY%ABS L                                                                                                                                                                                                                         L     ABS #     @                                   M                   #CHECKPLANTMIXERSPLITTERCONSISTENCY%ABS N   #CHECKPLANTMIXERSPLITTERCONSISTENCY%TRIM O   #LOOPNUM P   #LOOPSIDENUM Q   #SPLITNUM R   #MIXNUM S   #FIRSTHVACITERATION T                                                                                                                                                                                                                                                                             N     ABS                                        O     TRIM       
                                  P             
                                  Q             
                                  R             
                                  S             
                                  T       #     @                                   U                   #CHECKFORRUNAWAYPLANTTEMPS%ABS V   #CHECKFORRUNAWAYPLANTTEMPS%TRIM W   #LOOPNUM X   #LOOPSIDENUM Y                                                                                                                              V     ABS                                        W     TRIM       
  @                               X             
                                  Y       #     @                                   Z                   #UPDATEPLANTSPLITTER%MIN [   #LOOPNUM \   #LOOPSIDENUM ]   #SPLITNUM ^                                                                                                                  [     MIN       
                                  \             
                                  ]             
                                  ^       #     @                                   _                   #SETALLFLOWLOCKS%SIZE `   #SETALLFLOWLOCKS%ALLOCATED a   #VALUE b                                          `     SIZE                                        a     ALLOCATED       
                                  b       #     @                                   c                     #     @                                   d               	   #CRITERIADATA e   #PULLCOMPINTERCONNECTTRIGGER%SIZE k   #PULLCOMPINTERCONNECTTRIGGER%ALLOCATED l   #PULLCOMPINTERCONNECTTRIGGER%ABS m   #LOOPNUM n   #LOOPSIDE o   #BRANCHNUM p   #COMPNUM q   #UNIQUECRITERIACHECKINDEX r   #CONNECTEDLOOPNUM s   #CONNECTEDLOOPSIDE t   #CRITERIATYPE u   #CRITERIAVALUE v                                                                                                                                                                                                                                                                                                                                                                                            @                          e     '            #CALLINGCOMPLOOPNUM f   #CALLINGCOMPLOOPSIDENUM g   #CALLINGCOMPBRANCHNUM h   #CALLINGCOMPCOMPNUM i   #THISCRITERIACHECKVALUE j           �                               f                                                                 0        �                               g                                                                0        �                               h                                                                0        �                               i                                                                0        �                              j          
                             
                         0.0D0                                       k     SIZE                                        l     ALLOCATED                                        m     ABS       
                                  n             
                                  o             
                                  p             
                                  q             
D                                 r              
                                  s             
                                  t             
                                  u             
                                 v     
  #     @                                   w                 
   #LOOPNUM x   #LOOPSIDE y   #TYPEOFNUM z   #INLETNODENUM {   #OUTLETNODENUM |   #MODELCONDENSERHEATRATE }   #MODELINLETTEMP ~   #MODELOUTLETTEMP    #MODELMASSFLOWRATE �   #FIRSTHVACITERATION �                                                                    
                                  x             
                                  y             
                                  z             
                                  {             
                                  |             
                                 }     
        
  @                              ~     
        
                                      
        
                                 �     
        
                                  �       #     @                                   �                 
   #LOOPNUM �   #LOOPSIDE �   #TYPEOFNUM �   #INLETNODENUM �   #OUTLETNODENUM �   #MODELRECOVERYHEATRATE �   #MODELINLETTEMP �   #MODELOUTLETTEMP �   #MODELMASSFLOWRATE �   #FIRSTHVACITERATION �                                                                
                                  �             
                                  �             
                                  �             
                                  �             
                                  �             
                                 �     
        
  @                              �     
        
                                 �     
        
                                 �     
        
                                  �       #     @                                   �                 	   #LOOPNUM �   #LOOPSIDE �   #TYPEOFNUM �   #INLETNODENUM �   #OUTLETNODENUM �   #HEATSOURCETYPE �   #MODELGENERATORHEATRATE �   #MODELMASSFLOWRATE �   #FIRSTHVACITERATION �                                                                                                                                         
                                  �             
                                  �             
                                  �             
                                  �             
                                  �             
                                  �             
                                 �     
        
                                 �     
        
                                  �       #     @                                   �                   #INTERCONNECTTWOPLANTLOOPSIDES%ALLOCATED �   #LOOP1NUM �   #LOOP1LOOPSIDENUM �   #LOOP2NUM �   #LOOP2LOOPSIDENUM �   #PLANTCOMPONENTTYPEOFNUM �   #LOOP1DEMANDSONLOOP2 �                                          �     ALLOCATED       
                                  �             
                                  �             
                                  �             
                                  �             
                                  �             
                                  �       #     @                                   �                   #SHIFTPLANTLOOPSIDECALLINGORDER%ALLOCATED �   #OLDINDEX �   #NEWINDEX �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 �     ALLOCATED       
                                  �             
                                  �       #     @                                   �                    #COMPONENTINLETNODENUM �   #DESPLANTFLOW �                                                   
                                  �             
                                 �     
  #     @                                   �                   #SAFECOPYPLANTNODE%PRESENT �   #SAFECOPYPLANTNODE%MIN �   #SAFECOPYPLANTNODE%MAX �   #INLETNODENUM �   #OUTLETNODENUM �   #LOOPNUM �   #OUTLETTEMP �                                          �     PRESENT                                        �     MIN                                        �     MAX       
                                  �             
                                  �             
 @                               �             
                                �     
  %     @                               �                   
   #BOUNDVALUETONODEMINMAXAVAIL%MIN �   #BOUNDVALUETONODEMINMAXAVAIL%MAX �   #VALUETOBOUND �   #NODENUMTOBOUNDWITH �                                          �     MIN                                        �     MAX       
                                 �     
        
                                  �       #     @                                   �                    #NODENUM �   #NEWMINAVAIL �   #NEWMAXAVAIL �         
                                  �             
                                 �     
        
                                 �     
  %     @                               �                   
   #BOUNDVALUETOWITHINTWOVALUES%MIN �   #BOUNDVALUETOWITHINTWOVALUES%MAX �   #VALUETOBOUND �   #LOWERBOUND �   #UPPERBOUND �                                          �     MIN                                        �     MAX       
                                 �     
        
  @                              �     
        
  @                              �     
  %     @                                �                       #VALUETOCHECK �   #LOWERBOUND �   #UPPERBOUND �         
                                  �             
                                  �             
                                  �       #     @                                   �                   #LOGPLANTCONVERGENCEPOINTS%EOSHIFT �   #LOGPLANTCONVERGENCEPOINTS%SIZE �   #FIRSTHVACITERATION �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  �     EOSHIFT                                        �     SIZE       
                                  �       %     @                                �                      #CHECKPLANTCONVERGENCE%ANY �   #CHECKPLANTCONVERGENCE%SUM �   #CHECKPLANTCONVERGENCE%SIZE �   #THISLOOPNUM �   #THISLOOPSIDE �   #FIRSTHVACITERATION �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �     ANY                                        �     SUM                                        �     SIZE       
                                  �             
                                  �             
                                  �          �   a      fn#fn %     <   J   DATAPRECISIONGLOBALS    =  <   J   DATAINTERFACES )   y  \       R64+DATAPRECISIONGLOBALS :   �  g       SHOWCONTINUEERRORTIMESTAMP+DATAINTERFACES B   <  @   a   SHOWCONTINUEERRORTIMESTAMP%MESSAGE+DATAINTERFACES @   |  8   a   SHOWCONTINUEERRORTIMESTAMP%UNIT1+DATAINTERFACES @   �  8   a   SHOWCONTINUEERRORTIMESTAMP%UNIT2+DATAINTERFACES 1   �  g       SHOWSEVEREMESSAGE+DATAINTERFACES 9   S  @   a   SHOWSEVEREMESSAGE%MESSAGE+DATAINTERFACES 7   �  8   a   SHOWSEVEREMESSAGE%UNIT1+DATAINTERFACES 7   �  8   a   SHOWSEVEREMESSAGE%UNIT2+DATAINTERFACES =     �       SHOWRECURRINGSEVEREERRORATEND+DATAINTERFACES E   �  @   a   SHOWRECURRINGSEVEREERRORATEND%MESSAGE+DATAINTERFACES C     8   a   SHOWRECURRINGSEVEREERRORATEND%INDEX+DATAINTERFACES I   F  8   a   SHOWRECURRINGSEVEREERRORATEND%REPORTMAXOF+DATAINTERFACES I   ~  8   a   SHOWRECURRINGSEVEREERRORATEND%REPORTMINOF+DATAINTERFACES I   �  8   a   SHOWRECURRINGSEVEREERRORATEND%REPORTSUMOF+DATAINTERFACES L   �  @   a   SHOWRECURRINGSEVEREERRORATEND%REPORTMAXUNITS+DATAINTERFACES L   .  @   a   SHOWRECURRINGSEVEREERRORATEND%REPORTMINUNITS+DATAINTERFACES L   n  @   a   SHOWRECURRINGSEVEREERRORATEND%REPORTSUMUNITS+DATAINTERFACES >   �  �       SHOWRECURRINGWARNINGERRORATEND+DATAINTERFACES F   y  @   a   SHOWRECURRINGWARNINGERRORATEND%MESSAGE+DATAINTERFACES D   �  8   a   SHOWRECURRINGWARNINGERRORATEND%INDEX+DATAINTERFACES J   �  8   a   SHOWRECURRINGWARNINGERRORATEND%REPORTMAXOF+DATAINTERFACES J   )  8   a   SHOWRECURRINGWARNINGERRORATEND%REPORTMINOF+DATAINTERFACES J   a  8   a   SHOWRECURRINGWARNINGERRORATEND%REPORTSUMOF+DATAINTERFACES M   �  @   a   SHOWRECURRINGWARNINGERRORATEND%REPORTMAXUNITS+DATAINTERFACES M   �  @   a   SHOWRECURRINGWARNINGERRORATEND%REPORTMINUNITS+DATAINTERFACES M   	  @   a   SHOWRECURRINGWARNINGERRORATEND%REPORTSUMUNITS+DATAINTERFACES #   Y	  �       INITCOMPONENTNODES /   G
  8   a   INITCOMPONENTNODES%MINCOMPMDOT /   
  8   a   INITCOMPONENTNODES%MAXCOMPMDOT -   �
  8   a   INITCOMPONENTNODES%INLETNODE .   �
  8   a   INITCOMPONENTNODES%OUTLETNODE +   '  8   a   INITCOMPONENTNODES%LOOPNUM /   _  8   a   INITCOMPONENTNODES%LOOPSIDENUM /   �  8   a   INITCOMPONENTNODES%BRANCHINDEX -   �  8   a   INITCOMPONENTNODES%COMPINDEX %     #      SETCOMPONENTFLOWRATE )   *  8      SETCOMPONENTFLOWRATE%ABS )   b  8      SETCOMPONENTFLOWRATE%MIN )   �  8      SETCOMPONENTFLOWRATE%MAX *   �  9      SETCOMPONENTFLOWRATE%TRIM .     8   a   SETCOMPONENTFLOWRATE%COMPFLOW /   C  8   a   SETCOMPONENTFLOWRATE%INLETNODE 0   {  8   a   SETCOMPONENTFLOWRATE%OUTLETNODE -   �  8   a   SETCOMPONENTFLOWRATE%LOOPNUM 1   �  8   a   SETCOMPONENTFLOWRATE%LOOPSIDENUM 1   #  8   a   SETCOMPONENTFLOWRATE%BRANCHINDEX /   [  8   a   SETCOMPONENTFLOWRATE%COMPINDEX *   �  �      SETACTUATEDBRANCHFLOWRATE .   o  8      SETACTUATEDBRANCHFLOWRATE%ABS .   �  8      SETACTUATEDBRANCHFLOWRATE%MIN .   �  8      SETACTUATEDBRANCHFLOWRATE%MAX /     9      SETACTUATEDBRANCHFLOWRATE%TRIM 3   P  8   a   SETACTUATEDBRANCHFLOWRATE%COMPFLOW 7   �  8   a   SETACTUATEDBRANCHFLOWRATE%ACTUATEDNODE 2   �  8   a   SETACTUATEDBRANCHFLOWRATE%LOOPNUM 6   �  8   a   SETACTUATEDBRANCHFLOWRATE%LOOPSIDENUM 4   0  8   a   SETACTUATEDBRANCHFLOWRATE%BRANCHNUM 4   h  8   a   SETACTUATEDBRANCHFLOWRATE%RESETMODE /   �  u      REGULATECONDENSERCOMPFLOWREQOP 3     8      REGULATECONDENSERCOMPFLOWREQOP%ABS 7   M  8   a   REGULATECONDENSERCOMPFLOWREQOP%LOOPNUM ;   �  8   a   REGULATECONDENSERCOMPFLOWREQOP%LOOPSIDENUM 9   �  8   a   REGULATECONDENSERCOMPFLOWREQOP%BRANCHNUM 7   �  8   a   REGULATECONDENSERCOMPFLOWREQOP%COMPNUM D   -  8   a   REGULATECONDENSERCOMPFLOWREQOP%TENTATIVEFLOWREQUEST !   e  �       UPDATEPLANTMIXER %   I  8      UPDATEPLANTMIXER%MIN %   �  8      UPDATEPLANTMIXER%MAX )   �  8   a   UPDATEPLANTMIXER%LOOPNUM -   �  8   a   UPDATEPLANTMIXER%LOOPSIDENUM (   )  8   a   UPDATEPLANTMIXER%MIXNUM 5   a  %      ANYPLANTSPLITTERMIXERLACKSCONTINUITY 9   �  8      ANYPLANTSPLITTERMIXERLACKSCONTINUITY%ABS 3   �  �      CHECKPLANTMIXERSPLITTERCONSISTENCY 7   �  8      CHECKPLANTMIXERSPLITTERCONSISTENCY%ABS 8   �  9      CHECKPLANTMIXERSPLITTERCONSISTENCY%TRIM ;   �  8   a   CHECKPLANTMIXERSPLITTERCONSISTENCY%LOOPNUM ?   7  8   a   CHECKPLANTMIXERSPLITTERCONSISTENCY%LOOPSIDENUM <   o  8   a   CHECKPLANTMIXERSPLITTERCONSISTENCY%SPLITNUM :   �  8   a   CHECKPLANTMIXERSPLITTERCONSISTENCY%MIXNUM F   �  8   a   CHECKPLANTMIXERSPLITTERCONSISTENCY%FIRSTHVACITERATION *     �       CHECKFORRUNAWAYPLANTTEMPS .     8      CHECKFORRUNAWAYPLANTTEMPS%ABS /   L  9      CHECKFORRUNAWAYPLANTTEMPS%TRIM 2   �  8   a   CHECKFORRUNAWAYPLANTTEMPS%LOOPNUM 6   �  8   a   CHECKFORRUNAWAYPLANTTEMPS%LOOPSIDENUM $   �  �       UPDATEPLANTSPLITTER (   �   8      UPDATEPLANTSPLITTER%MIN ,   !  8   a   UPDATEPLANTSPLITTER%LOOPNUM 0   :!  8   a   UPDATEPLANTSPLITTER%LOOPSIDENUM -   r!  8   a   UPDATEPLANTSPLITTER%SPLITNUM     �!  �       SETALLFLOWLOCKS %   2"  9      SETALLFLOWLOCKS%SIZE *   k"  >      SETALLFLOWLOCKS%ALLOCATED &   �"  8   a   SETALLFLOWLOCKS%VALUE /   �"  D       RESETALLPLANTINTERCONNECTFLAGS ,   %#  �      PULLCOMPINTERCONNECTTRIGGER    &  �      CRITERIADATA L   �&  }   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIADATA%CALLINGCOMPLOOPNUM P   F'  }   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIADATA%CALLINGCOMPLOOPSIDENUM N   �'  }   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIADATA%CALLINGCOMPBRANCHNUM L   @(  }   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIADATA%CALLINGCOMPCOMPNUM P   �(  �   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIADATA%THISCRITERIACHECKVALUE 1   >)  9      PULLCOMPINTERCONNECTTRIGGER%SIZE 6   w)  >      PULLCOMPINTERCONNECTTRIGGER%ALLOCATED 0   �)  8      PULLCOMPINTERCONNECTTRIGGER%ABS 4   �)  8   a   PULLCOMPINTERCONNECTTRIGGER%LOOPNUM 5   %*  8   a   PULLCOMPINTERCONNECTTRIGGER%LOOPSIDE 6   ]*  8   a   PULLCOMPINTERCONNECTTRIGGER%BRANCHNUM 4   �*  8   a   PULLCOMPINTERCONNECTTRIGGER%COMPNUM E   �*  8   a   PULLCOMPINTERCONNECTTRIGGER%UNIQUECRITERIACHECKINDEX =   +  8   a   PULLCOMPINTERCONNECTTRIGGER%CONNECTEDLOOPNUM >   =+  8   a   PULLCOMPINTERCONNECTTRIGGER%CONNECTEDLOOPSIDE 9   u+  8   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIATYPE :   �+  8   a   PULLCOMPINTERCONNECTTRIGGER%CRITERIAVALUE 4   �+  B      UPDATECHILLERCOMPONENTCONDENSERSIDE <   '-  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%LOOPNUM =   _-  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%LOOPSIDE >   �-  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%TYPEOFNUM A   �-  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%INLETNODENUM B   .  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%OUTLETNODENUM K   ?.  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%MODELCONDENSERHEATRATE C   w.  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%MODELINLETTEMP D   �.  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%MODELOUTLETTEMP F   �.  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%MODELMASSFLOWRATE G   /  8   a   UPDATECHILLERCOMPONENTCONDENSERSIDE%FIRSTHVACITERATION 0   W/  =      UPDATECOMPONENTHEATRECOVERYSIDE 8   �0  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%LOOPNUM 9   �0  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%LOOPSIDE :   1  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%TYPEOFNUM =   <1  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%INLETNODENUM >   t1  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%OUTLETNODENUM F   �1  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%MODELRECOVERYHEATRATE ?   �1  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%MODELINLETTEMP @   2  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%MODELOUTLETTEMP B   T2  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%MODELMASSFLOWRATE C   �2  8   a   UPDATECOMPONENTHEATRECOVERYSIDE%FIRSTHVACITERATION <   �2  r      UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE D   64  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%LOOPNUM E   n4  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%LOOPSIDE F   �4  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%TYPEOFNUM I   �4  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%INLETNODENUM J   5  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%OUTLETNODENUM K   N5  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%HEATSOURCETYPE S   �5  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%MODELGENERATORHEATRATE N   �5  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%MODELMASSFLOWRATE O   �5  8   a   UPDATEABSORBERCHILLERCOMPONENTGENERATORSIDE%FIRSTHVACITERATION .   .6  �       INTERCONNECTTWOPLANTLOOPSIDES 8   7  >      INTERCONNECTTWOPLANTLOOPSIDES%ALLOCATED 7   [7  8   a   INTERCONNECTTWOPLANTLOOPSIDES%LOOP1NUM ?   �7  8   a   INTERCONNECTTWOPLANTLOOPSIDES%LOOP1LOOPSIDENUM 7   �7  8   a   INTERCONNECTTWOPLANTLOOPSIDES%LOOP2NUM ?   8  8   a   INTERCONNECTTWOPLANTLOOPSIDES%LOOP2LOOPSIDENUM F   ;8  8   a   INTERCONNECTTWOPLANTLOOPSIDES%PLANTCOMPONENTTYPEOFNUM B   s8  8   a   INTERCONNECTTWOPLANTLOOPSIDES%LOOP1DEMANDSONLOOP2 /   �8  �      SHIFTPLANTLOOPSIDECALLINGORDER 9   �<  >      SHIFTPLANTLOOPSIDECALLINGORDER%ALLOCATED 8   �<  8   a   SHIFTPLANTLOOPSIDECALLINGORDER%OLDINDEX 8   =  8   a   SHIFTPLANTLOOPSIDECALLINGORDER%NEWINDEX ,   >=  �       REGISTERPLANTCOMPDESIGNFLOW B   �=  8   a   REGISTERPLANTCOMPDESIGNFLOW%COMPONENTINLETNODENUM 9   >  8   a   REGISTERPLANTCOMPDESIGNFLOW%DESPLANTFLOW "   I>  �       SAFECOPYPLANTNODE *   $?  <      SAFECOPYPLANTNODE%PRESENT &   `?  8      SAFECOPYPLANTNODE%MIN &   �?  8      SAFECOPYPLANTNODE%MAX /   �?  8   a   SAFECOPYPLANTNODE%INLETNODENUM 0   @  8   a   SAFECOPYPLANTNODE%OUTLETNODENUM *   @@  8   a   SAFECOPYPLANTNODE%LOOPNUM -   x@  8   a   SAFECOPYPLANTNODE%OUTLETTEMP ,   �@  �       BOUNDVALUETONODEMINMAXAVAIL 0   lA  8      BOUNDVALUETONODEMINMAXAVAIL%MIN 0   �A  8      BOUNDVALUETONODEMINMAXAVAIL%MAX 9   �A  8   a   BOUNDVALUETONODEMINMAXAVAIL%VALUETOBOUND ?   B  8   a   BOUNDVALUETONODEMINMAXAVAIL%NODENUMTOBOUNDWITH (   LB  s       TIGHTENNODEMINMAXAVAILS 0   �B  8   a   TIGHTENNODEMINMAXAVAILS%NODENUM 4   �B  8   a   TIGHTENNODEMINMAXAVAILS%NEWMINAVAIL 4   /C  8   a   TIGHTENNODEMINMAXAVAILS%NEWMAXAVAIL ,   gC  �       BOUNDVALUETOWITHINTWOVALUES 0   +D  8      BOUNDVALUETOWITHINTWOVALUES%MIN 0   cD  8      BOUNDVALUETOWITHINTWOVALUES%MAX 9   �D  8   a   BOUNDVALUETOWITHINTWOVALUES%VALUETOBOUND 7   �D  8   a   BOUNDVALUETOWITHINTWOVALUES%LOWERBOUND 7   E  8   a   BOUNDVALUETOWITHINTWOVALUES%UPPERBOUND )   CE  z       INTEGERISWITHINTWOVALUES 6   �E  8   a   INTEGERISWITHINTWOVALUES%VALUETOCHECK 4   �E  8   a   INTEGERISWITHINTWOVALUES%LOWERBOUND 4   -F  8   a   INTEGERISWITHINTWOVALUES%UPPERBOUND *   eF        LOGPLANTCONVERGENCEPOINTS 2   tJ  <      LOGPLANTCONVERGENCEPOINTS%EOSHIFT /   �J  9      LOGPLANTCONVERGENCEPOINTS%SIZE =   �J  8   a   LOGPLANTCONVERGENCEPOINTS%FIRSTHVACITERATION &   !K        CHECKPLANTCONVERGENCE *   &O  8      CHECKPLANTCONVERGENCE%ANY *   ^O  8      CHECKPLANTCONVERGENCE%SUM +   �O  9      CHECKPLANTCONVERGENCE%SIZE 2   �O  8   a   CHECKPLANTCONVERGENCE%THISLOOPNUM 3   P  8   a   CHECKPLANTCONVERGENCE%THISLOOPSIDE 9   ?P  8   a   CHECKPLANTCONVERGENCE%FIRSTHVACITERATION 
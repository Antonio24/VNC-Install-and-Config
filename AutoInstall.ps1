�� #   D e s a b i l i t a r   o   F i r e w a l l  
 #   n e t s h   a d v f i r e w a l l   s e t   a l l p r o f i l e s   s t a t e   o f f  
  
 #   R e m o v e r   o   s e r v i � o   e x i s t e n t e   d o   V N C  
 $ s e r v i c e = G e t - W m i O b j e c t   - C l a s s   W i n 3 2 _ S e r v i c e   - F i l t e r   " N a m e   L I K E   ' % v n c % ' "  
 S t o p - S e r v i c e   $ s e r v i c e . N a m e  
 $ s e r v i c e . d e l e t e ( )  
  
 #   D e s i n s t a l a r   V N C   e x i s t e n t e  
 $ a p p   =   G e t - W m i O b j e c t   - C l a s s   W i n 3 2 _ P r o d u c t   - F i l t e r   " N a m e   L I K E   ' % v n c % ' "  
 i f ( $ a p p   - n e   $ n u l l ) {  
         $ a p p . U n i n s t a l l ( )  
 }  
  
 #   R e m o v e r   d i r e t � r i o s   d o   V N C   e x i s t e n t e s  
 $ d i r e c t o r i e s   =   G e t - C h i l d I t e m   - P a t h   ' C : \ P r o g r a m   F i l e s '  
 f o r e a c h   ( $ d i r e c t o r y   i n   $ d i r e c t o r i e s )   {    
         i f   ( $ d i r e c t o r y . N a m e   |   S e l e c t - S t r i n g   - P a t t e r n   " v n c " )   {  
                 $ v n c d i r   =   ' C : \ P r o g r a m   F i l e s '   +   ' \ '   +   $ d i r e c t o r y . N a m e  
                 R e m o v e I t e m   $ v n c d i r     } 
 }  
  
 $ d i r e c t o r i e s   =   G e t - C h i l d I t e m   - P a t h   ' C : \ P r o g r a m   F i l e s   ( x 8 6 ) '  
 f o r e a c h   ( $ d i r e c t o r y   i n   $ d i r e c t o r i e s )   {    
         i f   ( $ d i r e c t o r y . N a m e   |   S e l e c t - S t r i n g   - P a t t e r n   " v n c " )   {  
                 $ v n c d i r   =   ' C : \ P r o g r a m   F i l e s   ( x 8 6 ) '   +   ' \ '   +   $ d i r e c t o r y . N a m e  
                 R e m o v e I t e m   $ v n c d i r     } 
 }  
  
 #   I n s t a l a   o   V N C  
 . \ U l t r a V N C _ 1 _ 2 _ 1 1 _ X 6 4 _ S e t u p . e x e   / l o a d i n f = " . \ I n s t a l l C o n f i g "  
  
 #   C o n f i g u r a   o   V N C  
 C o p y - I t e m   - f o r c e   . \ u l t r a v n c . i n i   ' C : \ P r o g r a m   F i l e s \ U l t r a V N C '  

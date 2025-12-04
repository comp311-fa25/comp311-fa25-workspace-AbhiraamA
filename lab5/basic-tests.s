    # addi 
    addi x4, x0, -20        
    addi x5, x4, 0x7F0      
    addi x6, x5, 0x701      
    addi x7, x6, 0x531      

    # andi  
    andi x14, x6, 0x123     
    andi x15, x14, 0x71C    
    andi x17, x15, 0x541    

    # slti (
    slti x18, x4, 311       # set x18 = (x4 < 311) ? 1 : 0
    slti x19, x18, 2        # set x19 = (x18 < 2) ? 1 : 0
    slti x20, x19, 0        # set x20 = (x19 < 0) ? 1 : 0
    slti x21, x20, -3       # set x21 = (x20 < -3) ? 1 : 0
    slti x22, x21, 5        # set x22 = (x21 < 5) ? 1 : 0
    addi x0,  x22, 0        # write to x0 is ignored (still 0)
    slti x23, x4,  -20      
    addi x0,  x23, 0
    slti x24, x11, -90     
    addi x0,  x24, 0
    slti x25, x4,  0        
    addi x0,  x25, 0
    slti x26, x11, 600      
    addi x0,  x26, 0
    slti x27, x4,  -1       
    addi x0,  x27, 0

    # add 
    add x8, x4, x5          # x8 = x4 + x5 = -20 + 2012 = 1992
    add x9, x6, x7          # x9 = x6 + x7 = 3805 + 5141 = 8946
    add x10, x8, x9         # x10 = x8 + x9 = 1992 + 8946 = 10938

    # sub
    sub x11, x6, x4         # x11 = x6 - x4 = 3805 - (-20) = 3825
    sub x12, x7, x5         # x12 = x7 - x5 = 5141 - 2012 = 3129
    sub x13, x10, x8        # x13 = x10 - x8 = 10938 - 1992 = 8946

    # or
    or x28, x4, x5          # x28 = x4 | x5 = -20 | 2012
    or x29, x6, x14         # x29 = x6 | x14 = 3805 | 1
    or x30, x11, x12        # x30 = x11 | x12 = 3825 | 3129

    # and
    and x1, x6, x7          # x1 = x6 & x7 = 3805 & 5141
    and x2, x10, x11        # x2 = x10 & x11 = 10938 & 3825
    and x3, x28, x29        # x3 = x28 & x29

    # slt
    slt x31, x4, x5         # x31 = (x4 < x5) ? 1 : 0 = (-20 < 2012) = 1
    slt x16, x7, x6         # x16 = (x7 < x6) ? 1 : 0 = (5141 < 3805) = 0
    slt x21, x10, x11       # x21 = (x10 < x11) ? 1 : 0 = (10938 < 3825) = 0



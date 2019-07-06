    
symbol_table = {
        'R0': 0,
        'R1': 1,
        'R2': 2,
        'R3': 3,
        'R4': 4,
        'R5': 5,
        'R6': 6,
        'R7': 7,
        'R8': 8,
        'R9': 9,
        'R1O': 10,
        'R11': 11,
        'R12': 12,
        'R13': 13,
        'R14': 14,
        'R15': 15,
        'SCREEN': 16384,
        'KBD': 24576,
        'SP': 0,
        'LCL': 1,
        'ARG': 2,
        'THIS': 3,
        'THAT': 4
        }
 
def int_to_binary(instruction, bit_size=16):
    """
    Convert Decimal string into binary int 
    """
    num = int(instruction)
    bin_num = bin(num)[2:]
    return (bit_size - len(bin_num)) * '0' + bin_num

   
def bin_symbol(symbol):
    """
    Returns the symbol translate in binary.
    Should be called only when command_type() is
    A_COMMAND or L_COMMAND.
    """
    next_address = 16
    if symbol not in symbol_table:         
        symbol_table[symbol] = next_address
        next_address +=1
    
    return symbol_table[symbol]

a = bin_symbol('@hello')
print(a)


def mnemonic_dest(dest):
    """
    Returns the binary code of the dest mnemonic.
    (8 possibilities)
    """
    
    mapping = {
        "M"     : "001",
        "D"     : "010",
        "MD"    : "011",
        "A"     : "100",
        "AM"    : "101",
        "AD"    : "110",
        "AMD"   : "111",
    }
            
    return mapping[dest]

def bin_dest(instruction):
    """
    Returns the dest mnemonic in the current C-command.
    Should be called only when commandType() is C_COMMAND.
    """
    if "=" in instruction:
        dest = instruction.split("=")[0]
        return mnemonic_dest(dest)
    else:
        if '' in instruction:
            return '000'

def mnemonic_comp(comp):
    """
    Returns the binary code of the comp mnemonic.
    (28 possibilities)
    """
    
    mapping = {
        "0"         : "101010",
        "1"         : "111111",
        "-1"        : "111010",
        "D"         : "001100",
        "M"         : "110000",
        "!D"        : "001101",
        "!M"        : "110001",
        "-D"        : "001111",
        "-M"        : "110011",
        "D+1"       : "011111",
        "M+1"       : "110111",
        "D-1"       : "001110",
        "M-1"       : "110010",
        "D+M"       : "000010",
        "D-M"       : "010011",
        "M-D"       : "000111",
        "D&M"       : "000000",
        "D|M"       : "010101",
    }   
    return mapping[comp]

def a_mnemonic_comp(comp):
    if 'M' in comp:
        return '1' + mnemonic_comp(comp)
    else:
        comp_A = comp.replace('A', 'M')
        return '0' + mnemonic_comp(comp_A)

def bin_comp(instruction):
    """
    Returns the comp mnemonic in the current C-command.
    Should be called only when commandType() is C_COMMAND.
    """
    if "=" in instruction:
        comp = instruction.split("=")[1]
        return a_mnemonic_comp(comp)
    else:
        comp = instruction.split(";")[0]
        return a_mnemonic_comp(comp)
        
def mnemonic_jump(jump):
    """
    Returns the binary code of the jump mnemonic.
    (8 possibilities)
    """
    mapping = {
        "JGT"   :   "001",
        "JEQ"   :   "010",
        "JGE"   :   "011",
        "JLT"   :   "100",
        "JNE"   :   "101",
        "JLE"   :   "110",
        "JMP"   :   "111",
    }

    return mapping[jump]

def bin_jump(instruction):
        
    """
    Returns the jump mnemonic in the current C-command.
    Should be called only when commandType() is C_COMMAND.
    """
    if ";" in instruction:
        jump = instruction.split(";")[1]
        return mnemonic_jump(jump)
    else:
        if '' in instruction:
            return '000'

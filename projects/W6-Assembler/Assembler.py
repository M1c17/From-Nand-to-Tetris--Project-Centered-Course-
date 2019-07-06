from Code import bin_comp, bin_dest, bin_jump, int_to_binary, bin_symbol
              
def remove_comment_white_space(line):
    '''
    checking for empty lines and comments. Ignore them.
    '''
    remove_comment = ''.join(line).split('//')[0]
    remove_white_space = remove_comment.replace(' ', '')
    return remove_white_space.strip('\n')
   
    
def get_instructions(asm_file):
    """
    get the next assembly language command
    """
    instructions = []
    with open(asm_file, 'r') as f:
        
        for line in f:
            instruction = line.split('\n')
            instruction = remove_comment_white_space(instruction)
            instructions.append(instruction)
            
        return instructions
    
def parse_A_instruction(instruction):
    instruction = instruction[1:]
    try: 
        return int_to_binary(instruction, bit_size=16)
    except ValueError:
        return int_to_binary(bin_symbol(instruction), bit_size=16) 

def parse_L_instruction(instruction):
    instruction = instruction[1:-1]
    return instruction

def get_output_fileName(asm_file):
    if '.asm' in asm_file:
        termination = asm_file.replace('.asm', '.hack')
        return termination

counter = 0    
def translate_to_bin(asm_file):
    '''
    for A-command: @address
    for C-command: get code for each part and put them together
    Output the resulting machine language command
    '''
    output_file = get_output_fileName(asm_file)
    
    with open(output_file, 'w') as f:
        instructions = get_instructions(asm_file)
        for instruction in instructions:
            if not instruction:
                continue        
            else:
                if instruction.startswith("("):
                    parse_L_instruction(instruction)
                    continue
                elif instruction.startswith("@"):
                    binary_instruction = parse_A_instruction(instruction)
                else:
                    binary_instruction = '111' + str(bin_comp(instruction)) + str(bin_dest(instruction)) + str(bin_jump(instruction))
                
                f.write(binary_instruction + '\r\n')
            global counter
            counter += 1
                     
a = translate_to_bin('RectL.asm')
print(a)
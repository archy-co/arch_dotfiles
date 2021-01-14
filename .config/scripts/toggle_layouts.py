def read_and_change(path:str):
    lines = []
    with open(path, 'r') as config:
        for line in config:
            
            if '-layout' in line and 'grp:ctrl_alt_toggle' in line:
                print(line, end='')
                if line[0] == '#':
                    line = line[1:]
                    print('****', line, end='')
                else:
                    line = '#'+line
                    print('####', line, end='')
                print(line, end='')
            lines.append(line)
    return lines

def write_new_config(path:str, lines:list):
    with open(path, 'w') as new_config:
        for line in lines:
            #print(line, end='')
            new_config.write(line)

def toggle_layouts(path):
    alt_lines = read_and_change(path)
    write_new_config(path, alt_lines)


toggle_layouts('/home/archy/.config/i3/config')

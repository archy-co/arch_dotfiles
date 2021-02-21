def read_and_change(path: str):
    with open(path, 'r') as config:
        return [line if not ('-layout' in line and 'grp:ctrl_alt_toggle' in line) else line[1:] if line[0]=='#' else '#'+line for line in config]

def write_new_config(path: str, lines: list):
    with open(path, 'w') as new_config:
        [new_config.write(line) for line in lines]

def toggle_layouts(path: str):
    write_new_config(path, read_and_change(path))

toggle_layouts('/home/archy/.config/i3/config')

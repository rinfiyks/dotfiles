#!/usr/bin/env python

import argparse
import os
import re
import yaml


def main():
    args = parse_args()
    custom_config_file_name = args['config']

    default_config = load_yaml('templates/config/default.yml')
    custom_config = None if not custom_config_file_name else load_yaml('templates/config/{0}.yml'.format(custom_config_file_name))

    # Merges the custom config with the default config, custom config takes precedence
    config = default_config if not custom_config else merge_dicts(custom_config, default_config)

    generate_files(config)


def load_yaml(path):
    try: return yaml.safe_load(open(path, 'r'))
    except: return None


def merge_dicts(source, destination):
    for key, value in source.items():
        if isinstance(value, dict):
            node = destination.setdefault(key, {})
            merge_dicts(value, node)
        else:
            destination[key] = value
    return destination


def generate_files(config):
    for root, dirs, files in os.walk('templates/files'):
        path = root.split(os.sep)
        for file in files:
            print(f'Generating config for {file}')
            filled = fill_in_template(os.path.join(root, file), config)
            file_path = os.path.join('files', *path[2:], file)
            try: os.makedirs(os.path.dirname(file_path))
            except: pass
            with open(file_path, 'w') as f:
                f.write('\n'.join(filled))


def fill_in_template(file, config):
    with open(file, 'r') as f:
        lines = [line.rstrip('\n') for line in f.readlines()]
        return list(map(lambda l: parse_line(l, config), lines))


def parse_line(line, config):
    p = re.compile(r'(\{@ ?(.*?) ?@\})')
    return p.sub(lambda x: replace_match(x.group(), config), line)


def replace_match(match, config):
    key = match.strip('{@} ')
    value = nested_get(config, key.split('.'))
    if value: return str(value)
    else: return ''


def nested_get(input_dict, nested_key):
    internal_dict_value = input_dict
    for k in nested_key:
        internal_dict_value = internal_dict_value.get(k, None)
        if internal_dict_value is None:
            return None
    return internal_dict_value


def parse_args():
    parser = argparse.ArgumentParser(description='Generate templated dotfiles from config')
    parser.add_argument('-c','--config', help='Custom config used when parsing the templates', required=False)
    return vars(parser.parse_args())


if __name__ == '__main__':
    main()

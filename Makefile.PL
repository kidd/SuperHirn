use inc::Module::Install;

name     'SuperHirn';
all_from 'lib/SuperHirn.pm';
author   'Raimon Grau <raimonster@gmail.com>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;


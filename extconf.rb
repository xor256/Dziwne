require 'mkmf'

extension_name = 'Dziwne'

dir_config(extension_name)

have_library( 'stdc++' );

$LIBS     << ' -lm '
$CPPFLAGS << ' -W -Wall -pedantic -O0 '

create_makefile(extension_name)

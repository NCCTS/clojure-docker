#!/bin/bash

mkdir bin
wget -O bin/lein https://raw.githubusercontent.com/technomancy/leiningen/2.5.0/bin/lein
chmod +x bin/lein
bin/lein version
echo "(exit)" | bin/lein repl

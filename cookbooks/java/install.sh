#/bin/bash
for bin in /usr/lib/jvm/jdk-11.0.1/bin/*; do
    sudo update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100
done

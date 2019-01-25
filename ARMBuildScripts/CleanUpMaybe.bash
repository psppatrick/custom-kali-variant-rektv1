#!/bin/bash

cat << EOF > kali-$architecture/cleanup
#!/bin/bash
rm -rf /root/.bash_history
apt update
apt clean
rm -f cleanup
EOF
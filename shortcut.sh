echo -e '#!/bin/bash\ncd ~/oscom && git pull && bash oscom.sh && cd ~' | sudo tee /usr/local/bin/oscom > /dev/null
sudo chmod +x /usr/local/bin/oscom

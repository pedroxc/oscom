# 1. Instalar dependências
sudo apt update
sudo apt install libsdl2-2.0-0 libsdl2-image-2.0-0 libsdl2-ttf-2.0-0

# 2. Crie uma pasta para o BBC BASIC
cd ~
mkdir BBCBASIC
cd BBCBASIC

# 3. Baixar o zip da versão Raspberry Pi
# (você precisa achar o link mais recente; pode ser no site oficial ou no GitHub)
wget https://www.bbcbasic.co.uk/Downloads/bbcrpi.zip  # exemplo fictício, ajuste o nome

# 4. Extrair
unzip bbcrpi.zip

# 5. Tornar executável e rodar
cd extracted_folder  # a pasta resultante da extração
chmod +x bbcsdl
./bbcsdl

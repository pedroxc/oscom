sudo apt install -y git build-essential libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev

# 2. Clone o repositório BBCSDL
cd ~
git clone https://github.com/rtrussell/BBCSDL.git

# 3. Vá para o diretório e compile
cd BBCSDL
make

# 4. Depois de compilar, deve gerar executável (ex: bbcsdl)
# Verifique com:
ls -l bin

# 5. Rodar
cd bin
./bbcsdl

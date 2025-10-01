sudo apt install default-jre -y

wget https://github.com/AppleCommander/AppleCommander/releases/download/1.9.0/AppleCommander-ac-1.9.0.jar -O AppleCommander.jar
//APPLE 2
java -jar AppleCommander.jar -prodos empty.dsk
// DOS 3.3
java -jar AppleCommander.jar -p empty.dsk JOGO.BAS B JOGO.BAS


java -jar AppleCommander.jar -p empty.dsk JOGO.BAS B JOGO.BAS


mkdir -p ~/mame/roms
mv ~/Downloads/apple2e.zip ~/mame/roms/

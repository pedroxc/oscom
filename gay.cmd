@echo off
echo === Copiando arquivos .BAS para .dsk ===

REM Configurações
set SRC_DIR=C:\Users\Pedro\Documents\oscom
set DSK_FILE=C:\Users\Pedro\Documents\oscom\WORK.dsk
set DSK_SIZE=720
set DSK_LABEL=MSXDISK

REM Ir para o diretório
cd /d "%SRC_DIR%"

REM Verificar se existem arquivos .BAS
if not exist "*.BAS" (
    echo ERRO: Nenhum arquivo .BAS encontrado em %SRC_DIR%
    pause
    exit /b 1
)

REM Criar novo DSK (assumindo que você tem mtools instalado)
echo Criando novo arquivo .dsk...
mkfs.fat -C -F 12 -n %DSK_LABEL% "%DSK_FILE%" %DSK_SIZE%

REM Copiar todos os arquivos .BAS
echo Copiando arquivos .BAS...
for %%f in (*.BAS) do (
    echo  - Copiando: %%f
    mcopy -i "%DSK_FILE%" "%%f" ::
)

REM Listar conteúdo do .dsk
echo.
echo === Conteudo do .dsk ===
mdir -i "%DSK_FILE%" ::

echo.
echo ✓ Pronto! Arquivo .dsk criado em: %DSK_FILE%
echo.
echo Para usar no emulador:
echo 1^) Carregue o WORK.dsk
echo 2^) No BASIC digite: FILES^("A:"^)
echo 3^) Para carregar: LOAD "A:SUNRAY.BAS",R
echo 4^) Para executar: RUN

pause
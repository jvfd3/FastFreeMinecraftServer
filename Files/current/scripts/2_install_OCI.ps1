# install-oci-cli.ps1
# Instalação do OCI CLI no Windows via PowerShell

# 1. Instalar Python 3 (se não estiver presente)
echo "Verificando instalação do Python 3..."
winget install -e --id Python.Python.3

# 2. Atualizar pip
echo "Atualizando pip..."
python -m pip install --upgrade pip

# 3. Instalar OCI CLI
echo "Instalando OCI CLI..."
pip install oci-cli

# 4. Validar instalação
echo "Validando instalação do OCI CLI..."
oci --version

# Cria um par de chaves SSH para acessar a instância Oracle Cloud

echo "Criando par de chaves SSH para Oracle Cloud..."
$oracleKeyPath="$Env:USERPROFILE/.ssh/MyOracleKey"
ssh-keygen `
  -t ed25519 `
  -f $oracleKeyPath `
  -N "" `
  -C "Chave de acesso para instância Oracle Cloud do Server Minecraft" &&
  # -t ed25519 `: Tipo de chave
  # -f $oracleKeyPath `: Caminho para salvar a chave
  # -N "" `: Sem frase secreta
  # -C "Chave de acesso para instância Oracle Cloud do Server Minecraft": Comentário da chave

# Configura as permissões da chave privada para maior segurança

echo "Configurando permissões da chave privada..."
icacls $oracleKeyPath /inheritance:r /grant:r "$($Env:USERNAME):R"
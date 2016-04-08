#!/bin/bash
echo "#### Cymru  Whois tool for TeamCyru #### by r0m 0.2"
echo " Digite 1 Para busca por apenas um endereço IP ou 2 para busca de bloco txt"
read menu_opcao

if [ "$menu_opcao" = "1" ]; then
  echo "### Opcao 1 ###"
  echo "Qual o endereco ip?"
  read endereco_ip
  echo "#### Iniciando whois para $endereco_ip"
  whois -h whois.cymru.com "-v $endereco_ip"
else
  if [ "$menu_opcao" = "2" ]; then
  echo " ### Opcao 2 ###"
  echo "Digite o nome do arquivo de entrada:"
  read nome_arquivo
  echo "### whois em lote para o arquivo $nome_arquivo"
  data_atual=$(date +"%F")
  arquivo_saida="saida_whois-$data_atual.txt"
  netcat whois.cymru.com 43 < $nome_arquivo | sort -n > $arquivo_saida
  echo " ### gerado arquivo de saida $arquivo_saida com sucesso ###" 
else
 echo "Error"
fi
fi

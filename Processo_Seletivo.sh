#!/bin/bash

##INPUT DOS DADOS PESSOAIS

read -p " Digite seu nome : " nome
read -p " Digite seu CPF : " cpf
read -p " Digite seu Endereço : " ender
read -p " Digite um número de telefone : " tel
read -p " Digite um número de celular : " cel
read -p " Digite sua renda : " renda

echo " "

###CRIAR BD
touch massa_bd.txt

###GRAVA OS DADOS DE ENTRADA
echo "$nome;$cpf;$ender;$tel;$cel;$renda" >> massa_bd.txt

###USA O CAMPO CPF COMO CHAVE PRIMARIA
comp=($(sort massa_bd.txt|uniq -d|awk -F ";" '{print $2}'))

###IMPRIME SAIDA

echo "Validando registros na Base de Dados......"

echo ""
echo ""

###PAUSA DE PROCESSAMENTO
sleep 2


###VERIFICA SE EXISTE EM CADASTRO
if [ "$cpf" == "$comp" ] ;
then

echo "
Cadastro existente
"

else

echo "
Novo cliente cadastrado
"

fi

echo ""
echo ""

echo "Verificando renda....."

###PAUSA DE PROCESSAMENTO
sleep 3

echo ""
echo""

###VALIDA RENDA DIGITADA
if (( $renda <= 900 )) || (( $renda <= 7000 ));
then

echo "Você não possui renda suficiente para adiquirir um novo limite "

echo ""
echo ""

else

echo "Você possui renda compativel "

echo ""
echo ""

read -p "Escolha um novo limite que esteja entre os valores indicados :
4000 - 20000

 " limite

echo ""
echo ""

###LOOP DE VALIDAÇÃO DO VALOR DIGITADO
while (( $limite < 4000 )) || (( $limite > 20000 ))

do

read -p "Você não digitou o valor correto, digite um valor entre 4000 e 20000
" limite


done

echo ""
echo ""

echo "Aguarade um pouco, estamos processando a informação....."

sleep 3

echo ""
echo ""

###IMPRIME MENSAGEM DE CRÉDITO CONCEDIDO
echo "Limite Concedido. Abaixo seguem seus dados atualizados"

echo ""
echo ""

### SALVA DADOS ATUALIZADOS EM NOVO ARQUIVO
echo "$nome;$cpf;$ender;$tel;$cel;$renda;$limite" >> novos_clientes.txt

###IMPRIME DADOS ATUALIZADOS NA TELA
echo "$nome;$cpf;$ender;$tel;$cel;$renda;$limite"

fi

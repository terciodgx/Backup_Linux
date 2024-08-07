#!/bin/bash

#origem do backup
varorigem="/opt"

#destino do backup
vardestino="/home/tercio/backup_opt"

#formato do arquivo em Dia e Hora
vardatahora=$(date "+%d-%m-%Y_%H-%M-%S")
varnome_arquivo="backup_projeto-$vardatahora.tar.gz"

#logs do backup
vararquivo_log="/var/log/log-backup-full.log "

#comando para criar a pasta de destino, caso esta pasta esteja inexistente
mkdir -p "/home/tercio/backup_opt"

#mensagem para apresentar ao usuario o inicio do processo
echo "iniciando processo de backup..."

#condicional processo executando, compactando e zipando backup,  e gravando em log
if tar -czpf "$vardestino/$varnome_arquivo" "$varorigem"; then
        echo "$vardatahora Backup Concluido com Sucesso" >> $vararquivo_log
        #imprime a informaçao na tela para o usuario visualizar
        printf "Backup Conluido com Sucesso. \n"
else
        echo "$vardatahora Falha na realizaçao do backup" >> $vardatahora_log
        #imprime na tela para o usuario visualizar
        printf "Falha na realizaçao do backup, favor verificar.\n"
fi



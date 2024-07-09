# Projeto Estudos Linux

```Tarefa:``` Criar um backup diário do diretório /opt para o ddiretório /bakup_opt. Este backup precisa ser realizado às 04 horas da manhã de forma automatizada.

## Tecnologias aplicadas no Projeto

- [VirtualBox](https://www.virtualbox.org/)
- [Ubuntu Server](https://ubuntu.com/download/server/) 
- [GitHub](https://github.com/)
- [Bloco de Notas](https://pt.wikihow.com/Abrir-o-Bloco-de-Notas/)
- [GutHub Desktop](https://desktop.github.com/download/)
- [Crontab Guru](https://crontab.guru/)

## Código do Script

1. Para criar o código, utilizei o editor de texto ```nano``` do próprio linux e coloquei o nome do script backup-full.sh, sendo ```sh``` a extensão do arquivo de comandos de linguagem de script a ser executado pelo shell Unix.
2. Movi o script para ```/usr/local/bin```
3. A seguir o código aplicado no script.
4. O script está comentado para melhor compreensão.

```
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


```
4. Após criar o script usei ```ctrl + o```para salvar, e ```ctrl + x``` para sair.
5. Usei comando ```chmod +x /usr/local/bin/backup-full.sh``` para tornar o script executável
6. É importante veirificar a data e hora do servidor, para isso use ```timedatectl```
7. Para automatizar o scritp utilizei o recurso CRON, usando o comando ```sudo crontab -e```, use o [Crontab Guru](https://crontab.guru/), abaixo, segue o código utilizado:

```
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

0 4 * * * /usr/local/bin/backup-full.sh
```


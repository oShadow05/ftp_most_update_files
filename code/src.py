import subprocess
import ftplib
import os
import time
from hide_data import *
from datetime import datetime

# Creazione delle cartelle nominate per giorno, mese, anno, ora, minuti, secondi
def create_path_folder(init_path):
    day = time.strftime("%d", time.localtime())
    month = time.strftime("%m", time.localtime())
    year = time.strftime("%y", time.localtime())
    ora = time.strftime("%H", time.localtime())
    minuti = time.strftime("%M", time.localtime())
    secondi = time.strftime("%S", time.localtime())
# Creazione delle cartella a seconda dell'orario
    if ora == "21" and minuti == "30" and secondi == "00":
        path_for_G = init_path + day + "-" + month + "-" + year + "-Ora" + ora + "-minuti" + minuti + "-secondi" + secondi + " Backup completo"
    else:
        path_for_G = init_path + day + "-" + month + "-" + year + "-Ora" + ora + "-minuti" + minuti + "-secondi" + secondi
    return path_for_G

def check_if_connection_exist(net_path, password):
    try:
        os.chdir("G:\ICT")
    except:
# Il primo richiamo a NET USE serve per creare una connessione al server
        call_to_server2003_with_CMD = " NET USE " + net_path + " " + password
        subprocess.Popen(call_to_server2003_with_CMD, stdout=subprocess.PIPE, shell=True)

# Il secondo richiamo a NET USE crea un'unità virtuale dove andar a scrivere i dati o elaborare dati
        call_to_server2003_with_CMD = " NET USE G: " + net_path + " " + password
        subprocess.Popen(call_to_server2003_with_CMD, stdout=subprocess.PIPE, shell=True)


# --> FINE DELLA CREAZIONE DELLA COMUNICAZIONE TRA SERVER E DATI
# Cache date e Cache files per download files solo se i files vengono modificati
date = [
    # DATA DI CREAZIONE DEI FILES
]


files = [
    # NOMI DEI FILES
]

#--> Fine Cache

def download_files(ip, user, password, path_files, path_for_G):
    ftp = ftplib.FTP(ip)
    ftp.login(user, password)
    ftp.cwd(path_files)

    filenames = ftp.nlst()

    for filename in filenames:
        file_time = ftp.sendcmd("MDTM " + filename)
        file_convert_time = datetime.strptime(file_time[4:], "%Y%m%d%H%M%S").strftime("%Y-%m-%d %H.%M")
        for e in range(len(date)):
            if files[e] == filename:
                print(filename, "\n")
                print(date[e], "\n")
                if file_convert_time > date[e]:
                    local_filename = os.path.join(path_for_G, filename)
                    file = open(local_filename, 'wb')
                    ftp.retrbinary('RETR ' + filename, file.write)
                    file.close()
                    date[e] = file_convert_time

                    print("agg", "\n", date[e], "\n")
                else:
                    print("il file è nella versione più recente")

    try:
        time.sleep(3)
        os.rmdir(path_for_G)
    except:
        print("file in folder")


    ftp.quit()






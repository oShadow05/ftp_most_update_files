from src import *

def Main():
    try:
        while True:
            time.sleep(7200)
            check_if_connection_exist(network_path_server, password_for_network_path_server)
            time.sleep(5)
            path_for_G = create_path_folder(initial_path_for_G)
            os.mkdir(path_for_G)
            time.sleep(5)
            download_files(IP, ftp_login_username, ftp_login_password, ftp_initial_store_file, path_for_G)
            if time.strftime("%H", time.localtime()) == "22" and time.strftime("%M", time.localtime()) == "00":
                time.sleep(32400)
                print("repeat")
            if time.strftime("%d", time.localtime()) == "30" and time.strftime("%H", time.localtime()) == "17" and time.strftime("%M", time.localtime()) == "30":
                time.sleep(63)
    except:
        print("A CAUSA DI UN ERRORE STO ASPETTANDO IL RIAVVIO")


Main()
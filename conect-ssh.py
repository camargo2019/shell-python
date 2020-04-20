#!/usr/bin/python3
import pymysql
import sys
import os
import getpass
import paramiko

con = pymysql.connect(
    host = '51.79.71.129',
    user = 'vendas',
    password = '123',
    db = 'vendas',
    charset = 'utf8mb4'
)

def cls():
    os.system('cls' if os.name=='nt' else 'clear')

while True:
    login = str(input('['+'\033[32m'+'SUCESSO'+'\033[0;0m'+'] Olá, Seja bem vindo \n ['+'\033[32m'+'SUCESSO'+'\033[0;0m'+'] Você possui cadastro ? (Y/N): '))

    if(login == 'Y'):
        cls()
        print('['+'\033[32m'+'INFO'+'\033[0;0m'+'] Bem Vindo Novamente, Por favor coloque E-mail/Senha')
        while True:
            login = str(input('E-mail: '))
            senha = getpass.getpass('Senha: ')
            while True:
                with con.cursor() as cursor:
                    cursor.execute("SELECT * FROM tpl_user WHERE email=%s AND senha=%s", (login, senha))
                    infoClient = cursor.fetchone()
                con.commit()
                if(infoClient == None):
                    print('['+'\033[31m'+'ATENÇÃO'+'\033[0;0m'+'] Login/Senha incorretos!')
                    break
                else:
                    cls()
                    print('['+'\033[32m'+'ATENÇÃO'+'\033[0;0m'+'] Seja Bem vindo, ao nosso sistema de Cliente [CamargoHost - Shell]')
                    print('['+'\033[32m'+'ATENÇÃO'+'\033[0;0m'+'] CamargoHost Shell funciona como gerenciamento de Hosting para os Administradores')
                    print('\n \n')
                    print('Escolha uma opção: \n 1 - VPS 51.79.71.129 \n 2 - VPS 185.177.59.55')
                    opcao = str(input('Qual e a opção ?? '))

                    if(opcao):
                        with con.cursor() as cursor:
                            cursor.execute("SELECT * FROM tpl_vps WHERE id=%s", opcao)
                            infosrv = cursor.fetchone()
                        con.commit()
                        if(infosrv == None):
                            print('['+'\033[31m'+'ERROR'+'\033[0;0m'+'] Opss... Opção invalída')
                        else:
                            print('['+'\033[32m'+'SUCESSO'+'\033[0;0m'+'] CamargoHost - Shell Iniciado com sucesso!')
                            ssh = paramiko.SSHClient()
                            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                            ip = infosrv[1]
                            ssh.connect(ip, port=infosrv[4], username=infosrv[2], password=infosrv[3])
                            while True:
                                comando = input('['+'\033[31m'+'COMANDO'+'\033[0;0m'+'] : ')
                                if(comando == "exit"):
                                    print('['+'\033[31m'+'Sucesso'+'\033[0;0m'+'] Saiu com sucesso!')
                                    exit()
                                stdin, stdout, stderr = ssh.exec_command(comando)
                                print(stdout.readlines())
                    else:
                        print('['+'\033[31m'+'ERROR'+'\033[0;0m'+'] Opss... Opção invalída')

    else:
        cls()
        print('['+'\033[31m'+'INFO'+'\033[0;0m'+'] Entre em contato com o administrador, pós você não tem acesso ao servidor')
        
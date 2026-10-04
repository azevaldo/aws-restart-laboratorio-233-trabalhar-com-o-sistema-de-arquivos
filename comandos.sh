```bash
#!/bin/bash

# AWS re/Start - Laboratório 233
# Trabalhar com o Sistema de Arquivos
#
# Este arquivo documenta os principais comandos utilizados no laboratório.
# Os comandos não precisam ser executados todos de uma vez, pois alguns
# dependem do diretório atual e da estrutura criada anteriormente.
#
# A conexão real com a instância foi feita no Windows utilizando PuTTY,
# a chave labsuser.ppk e o usuário ec2-user.

# ==========================================================
# VERIFICAR E ACESSAR O DIRETÓRIO HOME
# ==========================================================

# Mostrar o diretório atual
pwd

# Acessar o diretório home do usuário ec2-user
cd /home/ec2-user


# ==========================================================
# CRIAR A ESTRUTURA INICIAL
# ==========================================================

# Criar o diretório principal
mkdir CompanyA

# Entrar no diretório CompanyA
cd CompanyA

# Criar os diretórios da empresa
mkdir Finance HR Management

# Listar os diretórios criados
ls


# ==========================================================
# CRIAR ARQUIVOS NO DIRETÓRIO HR
# ==========================================================

# Entrar no diretório HR
cd HR

# Criar os arquivos
touch Assessments.csv TrialPeriod.csv

# Verificar os arquivos
ls


# ==========================================================
# CRIAR ARQUIVOS NO DIRETÓRIO FINANCE
# ==========================================================

# Voltar para CompanyA e entrar em Finance
cd ../Finance

# Criar os arquivos
touch Salary.csv ProfitAndLossStatements.csv

# Verificar os arquivos
ls


# ==========================================================
# CRIAR ARQUIVOS NO DIRETÓRIO MANAGEMENT
# ==========================================================

# Voltar para CompanyA
cd ..

# Criar os arquivos diretamente utilizando o caminho relativo
touch Management/Managers.csv Management/Schedule.csv

# Verificar o conteúdo de Management
ls Management


# ==========================================================
# VALIDAR TODA A ESTRUTURA
# ==========================================================

# Listar recursivamente arquivos e diretórios
ls -laR


# ==========================================================
# COPIAR O DIRETÓRIO FINANCE
# ==========================================================

# Copiar Finance e todo o seu conteúdo para HR
cp -r Finance HR

# Verificar o conteúdo copiado
ls HR/Finance


# ==========================================================
# REMOVER O FINANCE ORIGINAL
# ==========================================================

# Este comando falha enquanto Finance possuir arquivos.
# rmdir remove somente diretórios vazios.
rmdir Finance

# Remover os arquivos do Finance original
rm Finance/ProfitAndLossStatements.csv Finance/Salary.csv

# Verificar se o diretório está vazio
ls Finance

# Remover o diretório vazio
rmdir Finance

# Verificar a estrutura atual
ls


# ==========================================================
# MOVER MANAGEMENT PARA HR
# ==========================================================

# Mover o diretório Management para dentro de HR
mv Management HR

# Verificar se o diretório foi movido
ls . HR/Management


# ==========================================================
# CRIAR EMPLOYEES
# ==========================================================

# Entrar no diretório HR
cd HR

# Criar o diretório Employees
mkdir Employees

# Mover os arquivos para Employees
mv Assessments.csv TrialPeriod.csv Employees

# Verificar a estrutura final
ls . Employees


# ==========================================================
# ESTRUTURA FINAL
# ==========================================================

# A partir de CompanyA, este comando permite verificar
# toda a estrutura final de forma recursiva:
#
# ls -laR
#
# Estrutura esperada:
#
# CompanyA/
# └── HR/
#     ├── Employees/
#     │   ├── Assessments.csv
#     │   └── TrialPeriod.csv
#     ├── Finance/
#     │   ├── ProfitAndLossStatements.csv
#     │   └── Salary.csv
#     └── Management/
#         ├── Managers.csv
#         └── Schedule.csv
```

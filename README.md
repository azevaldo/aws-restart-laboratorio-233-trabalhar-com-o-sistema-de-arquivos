# AWS re/Start — Laboratório 233: Trabalhar com o Sistema de Arquivos

Laboratório prático do programa **AWS re/Start** sobre gerenciamento do sistema de arquivos no Linux.

Neste laboratório foram praticados comandos para criar diretórios e arquivos, copiar e mover estruturas, excluir arquivos e diretórios e reorganizar uma estrutura de pastas existente.

## Objetivos

* Criar uma estrutura de diretórios no Linux.
* Criar arquivos vazios.
* Copiar arquivos e diretórios.
* Mover arquivos e diretórios.
* Excluir arquivos e diretórios.
* Reorganizar uma estrutura de diretórios.
* Utilizar comandos como `mkdir`, `touch`, `cp`, `mv`, `rm`, `rmdir`, `ls` e `pwd`.

O laboratório tem duração aproximada de 30 minutos.

## Ambiente

* **Programa:** AWS re/Start
* **Laboratório:** 233 — Trabalhar com o Sistema de Arquivos
* **Ambiente:** AWS Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Cliente SSH utilizado:** PuTTY
* **Sistema local:** Windows
* **Usuário:** `ec2-user`
* **Chave utilizada:** `labsuser.ppk`
* **Porta SSH:** `22`

## 1. Conexão com a instância EC2

Após iniciar o laboratório, foi necessário obter as credenciais de acesso e o endereço IP público da instância.

No ambiente Windows, o laboratório fornece o arquivo:

```text
labsuser.ppk
```

No PuTTY, a conexão foi configurada utilizando:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave `labsuser.ppk` foi configurada em:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
```

Depois da conexão, o acesso foi realizado com o usuário:

```text
ec2-user
```

> A conexão utilizada neste laboratório foi feita pelo Windows através do PuTTY e da chave `.ppk`.

## 2. Criando a estrutura inicial

A primeira estrutura criada foi:

```text
/home/ec2-user/CompanyA/
├── Finance/
│   ├── ProfitAndLossStatements.csv
│   └── Salary.csv
├── HR/
│   ├── Assessments.csv
│   └── TrialPeriod.csv
└── Management/
    ├── Managers.csv
    └── Schedule.csv
```

O laboratório orienta verificar o diretório atual com `pwd` e utilizar `ls` para validar os arquivos e pastas criados.

### Criar a pasta principal

```bash
pwd
cd /home/ec2-user
mkdir CompanyA
cd CompanyA
```

### Criar os subdiretórios

```bash
mkdir Finance HR Management
ls
```

Resultado esperado:

```text
Finance
HR
Management
```

### Criar arquivos no diretório HR

```bash
cd HR
touch Assessments.csv TrialPeriod.csv
ls
```

### Criar arquivos no diretório Finance

```bash
cd ../Finance
touch Salary.csv ProfitAndLossStatements.csv
ls
```

### Criar arquivos no diretório Management

```bash
cd ..
touch Management/Managers.csv Management/Schedule.csv
ls Management
```

O laboratório também demonstra a diferença entre trabalhar diretamente no diretório atual e utilizar caminhos relativos, como `Management/arquivo.csv`.

## 3. Validando toda a estrutura

Para verificar recursivamente os diretórios e arquivos criados:

```bash
ls -laR
```

A estrutura inicial esperada é:

```text
CompanyA/
├── Finance/
│   ├── ProfitAndLossStatements.csv
│   └── Salary.csv
├── HR/
│   ├── Assessments.csv
│   └── TrialPeriod.csv
└── Management/
    ├── Managers.csv
    └── Schedule.csv
```

O comando `ls -laR` permite visualizar a estrutura completa dos diretórios e seus conteúdos.

## 4. Reorganizando a estrutura

Posteriormente, a estrutura da empresa precisava ser reorganizada.

A nova estrutura deveria ficar:

```text
CompanyA/
└── HR/
    ├── Employees/
    │   ├── Assessments.csv
    │   └── TrialPeriod.csv
    ├── Finance/
    │   ├── ProfitAndLossStatements.csv
    │   └── Salary.csv
    └── Management/
        ├── Managers.csv
        └── Schedule.csv
```

As tarefas de reorganização foram:

* Copiar `Finance` para dentro de `HR`.
* Remover o `Finance` original.
* Mover `Management` para dentro de `HR`.
* Criar `Employees` dentro de `HR`.
* Mover `Assessments.csv` e `TrialPeriod.csv` para `Employees`.

### Copiar o diretório Finance

Estando em:

```text
/home/ec2-user/CompanyA
```

executar:

```bash
cp -r Finance HR
```

Verificar:

```bash
ls HR/Finance
```

Resultado:

```text
ProfitAndLossStatements.csv
Salary.csv
```

### Remover o Finance original

Primeiro foi utilizado:

```bash
rmdir Finance
```

Porém, como o diretório ainda continha arquivos, o comando não conseguiu removê-lo.

O `rmdir` só remove diretórios vazios.

Assim, os arquivos foram removidos primeiro:

```bash
rm Finance/ProfitAndLossStatements.csv Finance/Salary.csv
```

Depois:

```bash
ls Finance
rmdir Finance
```

E a remoção foi validada com:

```bash
ls
```

### Mover Management para HR

```bash
mv Management HR
```

Validar:

```bash
ls . HR/Management
```

### Criar Employees

Entrar no diretório `HR`:

```bash
cd HR
```

Criar o novo diretório:

```bash
mkdir Employees
```

Mover os arquivos:

```bash
mv Assessments.csv TrialPeriod.csv Employees
```

Validar:

```bash
ls . Employees
```

A estrutura final fica:

```text
CompanyA/
└── HR/
    ├── Employees/
    │   ├── Assessments.csv
    │   └── TrialPeriod.csv
    ├── Finance/
    │   ├── ProfitAndLossStatements.csv
    │   └── Salary.csv
    └── Management/
        ├── Managers.csv
        └── Schedule.csv
```

Essas operações correspondem às etapas de cópia, remoção, movimentação e reorganização descritas no laboratório.

## 5. Principais comandos praticados

| Comando   | Função                                                  |
| --------- | ------------------------------------------------------- |
| `pwd`     | Mostra o diretório atual                                |
| `cd`      | Navega entre diretórios                                 |
| `mkdir`   | Cria diretórios                                         |
| `touch`   | Cria arquivos vazios                                    |
| `ls`      | Lista arquivos e diretórios                             |
| `ls -laR` | Lista recursivamente arquivos e diretórios com detalhes |
| `cp -r`   | Copia diretórios e seu conteúdo                         |
| `mv`      | Move arquivos ou diretórios                             |
| `rm`      | Remove arquivos                                         |
| `rmdir`   | Remove diretórios vazios                                |

## 6. O que aprendi

Neste laboratório pratiquei:

* Navegação entre diretórios usando caminhos absolutos e relativos.
* Criação de diretórios e arquivos.
* Organização de estruturas de arquivos.
* Cópia de diretórios utilizando `cp -r`.
* Movimentação de arquivos e diretórios utilizando `mv`.
* Diferença entre `rm` e `rmdir`.
* Validação da estrutura com `ls` e `ls -laR`.
* Utilização de caminhos relativos para trabalhar com arquivos e diretórios.

## Conclusão

O Laboratório 233 reforçou os fundamentos de gerenciamento do sistema de arquivos no Linux.

Além de criar uma estrutura de diretórios do zero, foi necessário reorganizá-la posteriormente, permitindo praticar operações comuns de administração de arquivos e diretórios utilizando o terminal.

## Arquivos do repositório

```text
README.md       # Documentação do laboratório
comandos.sh     # Comandos praticados durante o laboratório
.gitignore      # Arquivos que não devem ser enviados ao GitHub
```

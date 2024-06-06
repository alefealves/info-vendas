# Info Vendas

Este é um projeto desenvolvido em Delphi 11 e base Firebird. o Objetivo deste projeto é construir um sistema de vendas em Delphi em multicamadas.

## Ambiente de Desenvolvimento

Para execucão do projeto local:

1. Ter o Delphi e Firebird instalados em seu ambiente
2. Clone este repositório em sua máquina local.
3. No diretório raiz do projeto, abra a IDE e execute o projeto no play ou no comando:

```
ctrl + shift + F9
```

4. A aplicação abrirá a tela home.

## Funcionalidades

1. **Tela Inicial**: Primeira tela ao iniciar a aplicação

![Tela Inicial](screenshots/home.png)

2. **Tela Cidades Cadastro**: Tela de cadastro de cidades

![Tela Cidades Cadastro](screenshots/cidades_cadastrar.png)

3. **Tela Cidades Buscar**: Tela de busca de cidades

![Tela Cidades Buscar](screenshots/cidades_buscar.png)

4. **Tela Pessoas Cadastro**: Tela de cadastro de pessoas

![Tela Pessoas Cadastro](screenshots/pessoas_cadastrar.png)

5. **Tela Pessoas Buscar**: Tela de busca de pessoas

![Tela Pessoas Buscar](screenshots/pessoas_buscar.png)

6. **Tela Produtos Cadastrar**: Tela de cadastro de produtos

![Tela Produtos Cadastrar](screenshots/produtos_cadastrar.png)

7. **Tela Produtos Buscar**: Tela de busca de produtos

![Tela Produtos Buscar](screenshots/produtos_buscar.png)

8. **Tela Subgrupos Cadastrar**: Tela de cadastro de subgrupos

![Tela Subgrupos Cadastrar](screenshots/subgrupos_cadastrar.png)

9. **Tela Subgrupos Buscar**: Tela de busca de subgrupos

![Tela Subgrupos Buscar](screenshots/subgrupos_buscar.png)

10. **Tela de Vendas**: Tela de vendas 

![Tela de Vendas](screenshots/vendas.png)


## Estrutura do Projeto

O projeto tem a seguinte estrutura:

- **bin/**: Contém os arquivos de build do projeto.
- **dados/**: Contém os arquivos de dados do projeto.
- **dcu/**: Contém os arquivos de temporários do projeto.
- **img/**: Contém as imagens utilizadas no projeto.
- **src/**: Contém todo o core do projeto como models, views, utils, RTTI e exceptions

## Dependências Externas

Este projeto utiliza as seguintes dependências externas:

- **Firebird**: Banco de dados utilizado.
- **IbExpert**: Gerenciador de banco de dados utilizado.

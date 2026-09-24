# Projeto: Estoque de Loja 
---

# Modelo de Entidade e Relacionamento (MER / DER)

![MER / DER](/MER_DER/MERDER.drawio.png)
---

## Dicionário de Dados

|entidade|Atributo|Tipo|Tamanho|Descrisao|
|-|-|-|-|-|
|produto|id|int|11|chave primaria do Produto|
|produto|Nome|varchar|50|Nome do produto|
|produto|descricao|varchar|200|descricao do produto|
|produto|preco|decimal|10|2|Preco em Reais do Produto|
|produto|marca|varchar|70|Marca do produto|
|produto|Id_categoria|int|11|Chave estrageira referencia a Categoria(id)|
|produto|id_fornecedor|int|11|Chave estrageira referncia a Fornecedor(id)|
|Categoria|id|int|11|chave primaria da Categoria|
|Categoria|Nome|varchar|100|Nome da Categoria|
|Categoria|descricao|varchar|200|descricao da categoria|
|Fornecedor|id|int|11|Chave primaria do Fornecedor|
|Fornecedor|razao_social|varchar|70|Razao social da Empresa Fornecedora|
|Fornecedor|nome_fantasia|varchar|70|Nome fantasia da Empresa Fornecedora|
|Fornecedor|cnpj|decimal|10|2|CNPJ da Empresa|
|Fornecedor|telefone|decimal|10|2|Telefone da Empresa|
|Fornecedor|email|varchar|50|Email da Empresa|
|Fornecedor|endereco|varchar|200|Endereco da Empresa|
|Estoque|id|int|11|Chave primaria do Estoque|
|Estoque|id_produto|int|11|Chave estrageira referecia a Produto(id)|
|Estoque|quantidade|varchar|1000|Qunatidade em Estoque|
|Estoque|quantidade_minima|varchar|200|Quantidade Minima que deve conter no Estoque|
|Estoque|localizacao|varchar|200|Localizacao do Estoque|
|Movimentacao de Estoque|id|int|11|Chave primaria da Movimentacao de Estoque| 
|Movimentacao de Estoque|id_produto|int|11|Chave estrangeira referencia a Produto(id)|
|Movimentacao de Estoque|tipo|varchar|100|Tipificacao da movimentacao (Entrada|saida)|
|Movimentacao de Estoque|quantidade|varchar|1000|Quantidade de Movimentacao de Estoque|
|Movimentacao de Estoque|data|DATE|Data de gerenciamento do Estoque|
---

## Dados de Teste em CSV

- [Produtos.csv](./produtos.CSV)
- [Categoria.csv](./Categoria.CSV)
- [Fornecedor.csv](./Fornecedor.CSV)
- [Estoque.csv](./Estoque.CSV)
- [ Movimentação de Estoque.csv](./Movimentacao.CSV)
---

## Script SQL DDL



```markdown
## Script SQL DDL

```sql
CREATE DATABASE estoque_loja;
USE estoque_loja;

CREATE TABLE categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE fornecedor (
    id INT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    endereco VARCHAR(255)
);

CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(100),
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY,
    id_produto INT NOT NULL UNIQUE,
    quantidade INT NOT NULL,
    quantidade_minima INT NOT NULL,
    localizacao VARCHAR(100),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

CREATE TABLE movimentacao_estoque (
    id_movimentacao INT PRIMARY KEY,
    id_produto INT NOT NULL,
    tipo ENUM('Entrada','Saida') NOT NULL,
    quantidade INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);
```
---
# Script SQL DML

```markdown
## Script SQL DDL

```sql
USE estoque_loja;

INSERT INTO categoria (id, nome, descricao) VALUES
(1, 'Camisetas', 'Camisetas Algodao'),
(2, 'Calcas', 'Calcas jeans'),
(3, 'Moletom', 'Blusa de frio');

INSERT INTO fornecedor (id, razao_social, nome_fantasia, cnpj, telefone, email, endereco) VALUES
(1, 'In Glow Brasil', 'Shein', '45.814.425/0001-72', '(21)2391-5301', 'Shein@gmail.com', 'São Paulo, SP'),
(2, 'loja Riachuelo S/A', 'Riachuelo', '33.200.056/0001-49', '0800 4003-0515', 'Riachuelo@gamil.com', 'São paulo, SP'),
(3, 'ADIDAS DO BRASIL LTDA', 'Adidas', '42.274.696/0001-94', '(11) 5546-3700', 'ADIDAS@gamil.com', 'São Paulo, SP');

INSERT INTO produto (id, nome, descricao, preco, marca, id_categoria, id_fornecedor) VALUES
(1, 'Camiseta', 'Camiseta  algodao', 50.00, 'Shein', 1, 1),
(2, 'Calca Jeans', 'Calcas jeans', 150.00, 'Riachuelo', 2, 2),
(3, 'Moletom', 'Blusa do tipo Moletom', 200.00, 'Adidas', 3, 3);

INSERT INTO estoque (id_estoque, id_produto, quantidade, quantidade_minima, localizacao) VALUES
(1, 1, 100, 75, 'Amparo'),
(2, 2, 200, 200, 'Campinas'),
(3, 3, 450, 300, 'Jaguariúna');

INSERT INTO movimentacao_estoque (id_movimentacao, id_produto, tipo, quantidade, data) VALUES
(1, 1, 'Saida', 45, '2026-09-22'),
(2, 2, 'Entrada', 75, '2026-09-23'),
(3, 3, 'Saida', 20, '2026-09-24');
```
---

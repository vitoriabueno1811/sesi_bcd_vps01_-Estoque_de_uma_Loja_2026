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
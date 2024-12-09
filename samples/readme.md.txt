Bike Stores Coodesh


Esse projeto tinha como objetivo identificar algumas informações de venda e de produtos de lojas de bicicletas através de manipulação de dados pela linguagem SQL.

O projeto foi dividido em 5 etapas:

1 identificação da base de dados e organização dos dados.
No repositório clonado continha uma pasta com uma imagem de nome model.png.
Nela continha um esquema que demonstrou um modelo dividido em 2 conjuntos de tabelas:
Grupo sales - Com tabelas de clientes, funcionários, pedidos, lojas, e itens de pedidos.
Grupo production - Com tabelas relacionadas a categorias, produtos, marcas, e estoques.


2 Criação das tabelas
Os dados necessários para serem manipulados não foram encontrados, então foi entendido que seria necessário criar cada uma das 9 tabelas. A linguagem escolhida foi SQL. As tabelas foram criadas segundo os campos solicitados no esquema. Os campos foram criados no formato text ou integer.

3 Imputar informações fictícias nas tabelas
Eu criei
3 lojas: Loja A, B e C 2 em São Paulo e uma no Rio
3 produtos: Bike Speed, Montain bike e Bike infantil
3 Marcas: Caloi, Specialized e Trek
5 Clientes sendo todos jogadores do Flamengo
7 staff sendo jogadores e jogadoras do Flamengo

4 Criar as consultas e relacionamentos entre as tabelas
As perguntas que precisavam ser respondidas eram:
Listar todos clientes que não tenham realizado uma compra;
- As tabelas utilizadas foram a "customers" e a "orders". Eu criei um LEFT JOIN trazendo os registros da tabela "customers" e combinando com os registros da tabela "ordes" com a coluna customer_id como foreign key procurando os valores null de "orders". Para isso eu passei um where order_id is null.

Listar os Produtos que não tenham sido comprados
- As tabelas utilizadas foram a "products" e a "order_items". Eu criei um LEFT JOIN incluindo os registros da tabela "products" e combinando com os registros da tabela "order_items", usei a coluna product_id como foreign key procurando os valores null de "products". Para isso eu passei um where product_id is null.

Listar os Produtos sem Estoque;
- As tabelas utilizadas foram a "products" e a "stocks". Eu criei um JOIN chamando o campo product_id com um filtro de where igualando o campo quantity = 0. Usei a coluna product_id como foreign key

Agrupar a quantidade de vendas que uma determinada Marca por Loja.
- As tabelas utilizadas foram "brands", "products", "order_items", "orders" e "stores". Na seleção dos parâmetros foi necessário realizar um SUM(quantity) com JOIN conectando as tabelas "products" chamando a coluna brand_id, "order_items" chamando product_id, "orders" chamando order_id e "stores" chamando store_id para que então quando passasse um GROUP BY com brand_name e store_name fosse possivel obter a marca, loja e a quantidade vendida.


Listar os Funcionários que não estejam relacionados a um Pedido.
- As tabelas utilizadas foram a "staffs" e a "orders". Eu criei um LEFT JOIN incluindo os registros da tabela "orders" na "staffs" então eu filtrei com um WHERE os registros onde staff_if retornava null.


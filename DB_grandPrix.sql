create database db_grandprix_dds;
use db_grandprix_dds;

-- Table para a tela de cadastro de Clientes

create table cliente(
id_cliente smallint not null auto_increment,
nome_cliente varchar (255) unique key,
email_cliente varchar(255),
razao_social_cliente varchar(255),
telefone_cliente varchar (255),
cep_cliente int (7) not null,
endereço_cliente varchar(255),
numero_endereco_cliente int not null,
logradouro_cliente varchar (255),
bairro_cliente varchar (255),
cidade_cliente varchar (255),
uf_cliente varchar(2),
cnpj_cliente char(14),
id_pedido_cliente smallint null,
notas varchar(1000),
primary key (id_cliente)
-- constraint fk_id_pedido foreign key (id_pedido_cliente) references pedido_cliente (id_pedido_cliente)
);

-- Table para a tela de cadastro de Fornecedores

create table fornecedor (
id_fornecedor smallint not null auto_increment,
nome_fornecedor varchar (255),
cep_fornecedor int (8) not null,
endereço_fornecedor varchar(255),
numero_endereco_fornecedor int not null,
logradouro_fornecedor varchar (255),
bairro_fornecedor varchar (255),
cidade_fornecedor varchar (255),
uf_fornecedor varchar(2),
telefone_fornecedor varchar (255),
email_fornecedor varchar(255),
notas_fornecedores varchar (1000),
cnpj_fornecedores char(14),
id_pedido_fornecedor smallint null,
primary key (id_fornecedor)
-- constraint fk_id_pedido foreign key (id_pedido_fornecedor) references pedido_fornecedor (id_pedido_fornecedor)
);

-- Table para a tela de cadastro de Pedido

create table pedido (
id_pedido int auto_increment primary key,
nome_cliente varchar (255),
numero_pedido int(255) unique key,
data_inicio date,
pravisao_entrega date,
status_pedido varchar (50),
notas_pedido varchar (1000),
constraint fk_nome foreign key (nome_cliente) references cliente (nome_cliente)
);
-- Table para a tela de cadastro de itens no pedido
 create table if not exists itens_pedido_saida (
 id_item int primary key auto_increment,
 nome_item varchar(100) not null,
 numero_pedido int(255),
 quantidade int,
 tamanho varchar (10),
 cor varchar (50),
 tipo varchar (50),
 constraint fk_pedido foreign key (numero_pedido) references pedido (numero_pedido),
 constraint fk_pedido_item foreign key (nome_item) references Cadastro_itens (nome_item)
 );

create table Cadastro_itens (
id int auto_increment primary key,
categoria_item varchar(55) not null,
nome_item varchar(100) not null unique key,
descricao_item text 
);

insert into Cadastro_itens (categoria_item,nome_item,descricao_item) values ("Saia","Saia Moletom","Tons pasteis e dificil de costurar");

-- comandos

insert into itens_pedido_saida (numero_pedido,nome_item,quantidade,tamanho,cor,tipo) values (78978978,"Saia Moletom",3,"M","preta","saia");
select * from fornecedor;
select * from pedido;
select * from itens_pedido_saida;
select * from Cadastro_itens;
select * from cliente where nome_cliente like '%L%';
drop table cliente;
drop table fornecedor; 
drop table pedido; 
drop table Cadastro_itens;
drop table itens_pedido;
----------------------
create table pedido (
id_pedido int auto_increment primary key,
nome_cliente varchar (255),
numero_pedido int(255) unique key,
data_inicio date,
pravisao_entrega date,
status_pedido varchar (50),
notas_pedido varchar (1000),
constraint fk_nome foreign key (nome_cliente) references cliente (nome_cliente)
);
-- Table para a tela de cadastro de itens no pedido
 create table if not exists itens_pedido_saida (
 id_item int primary key auto_increment,
 nome_item varchar(100) not null,
 numero_pedido int(255),
 quantidade int,
 tamanho varchar (10),
 cor varchar (50),
 tipo varchar (50),
 constraint fk_pedido foreign key (numero_pedido) references pedido (numero_pedido),
 constraint fk_pedido_item foreign key (nome_item) references Cadastro_itens (nome_item)
 );
 
select pedido.numero_pedido, pedido.nome_cliente,pedido.data_inicio,pedido.pravisao_entrega,pedido.status_pedido,
itens_pedido_saida.nome_item,itens_pedido_saida.quantidade,itens_pedido_saida.tamanho,itens_pedido_saida.cor,itens_pedido_saida.tipo
from pedido, itens_pedido_saida
where pedido.numero_pedido = itens_pedido_saida.numero_pedido;
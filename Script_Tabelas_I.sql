-- Script de criação de tableas: CLIENTES, VEICULOS, CORES, VEICULOS DE CLIENTES

INSERT INTO clientes VALUES ('1','Joao da Silva', '12345678900','F','01001035','Rua Teixeira da Silva','240','Apt 31','Paraiso','Sao Paulo','SP','11956483182','joaodasilva@gmail.com'),
							('2','Maria de Lourdes Azevedo', '12455678910','F','57042035','Rua Rosalva Lessa Cabral','257','','Feitosa','Maceio','AL','82988012346','mariadelourdesazevedo@gmail.com'),
							('3','Jose Pedro Martins Santos', '92455670905','F','70675127','QRSW Quadra 01 Bloco B7','7','Apt 101','Sudoeste','Brasilia','DF','61981212744','jpmartinssantos@uol.com'),
                            ('4','Escola de Programacao Ltda', '67002354000187','J','01001010','Avenida Paulista','1107','Sala 654','Bela Vista','Sao Paulo','SP','1121037030','contato@escoladeprogramacao.com');
                            
 INSERT INTO veiculos VALUES ('1','208 Active','Peugeot','1.3','Flex','4'),
							 ('2','Palio','Fiat','1.0','Gasolina','2'),
                             ('3','Ecosport','Ford','1.4','Alcool','4'),
                             ('4','Renegade','Jeep','1.8','Gasolina','4'),
                             ('5','Corola','Toyota','2.0','Diesel','4'); 

INSERT INTO cores VALUES ('1','Branca'),
						 ('2','Preta'),
                         ('3','Azul'),
                         ('4','Verde'),
                         ('5','Vermelha'),
                         ('6','Cinza');                         

INSERT INTO clientes_has_veiculos VALUES ('1','2','PBR4398','6'),
										 ('4','5','JIM1234','2'),
										 ('1','1','ALI1313','1');
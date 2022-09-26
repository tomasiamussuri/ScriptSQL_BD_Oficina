-- Script de criação de tableas: FUNCIONARIOS, ESPECIALIDADE, TECNICOS

INSERT INTO funcionarios VALUES ('1','Guilherme Rocha Mendes', '87643905611','57045341','Rua Adolfo Gustavo','88','Bloco A Apt 705','Serraria','Maceio','AL','8232601139', 'Mecanico','20170315','20991231'),
								('2','Patricia Soares Menezes', '11254830923','57000250','Rua do Sol','1248','','Centro','Maceio','AL','8233146789', 'Eletricista','20200801','20991231'),
                                ('3','Andre Carvalho Moraes', '55762894307','57321020','Avenida Deputado Jose Lages','12','','Ponta Verde','Maceio','AL','8233564012', 'Pintor','20220401','20991231');
                                
INSERT INTO especialidade VALUES ('1','Mecanico'),
								  ('2','Eletricista'),
                                  ('3','Pintor');
                                  
INSERT INTO tecnicos VALUES ('1','1','20170315','20991231'),
							('2','2','20200801','20991231'),
                            ('3','3','20220401','20991231');
                            
INSERT INTO fornecedores VALUES ('1','Fiat Ltda', '96258467000294','J', '02035060','Rua das oficinas','32','','Tatuape','Sao Paulo','SP','1167892543','contato@fiat.com.br'),
								('2','Peugeot Ltda', '04625824000348','J', '02035060','Rua das oficinas','89','','Tatuape','Sao Paulo','SP','1125890600','contato@peugeot.com.br'),
								('3','Toyota SA', '77962847000914','J', '57045341','Rua Adolfo Gustavo','64','','Serraria','Maceio','AL','8233261234','contato@toyota.com.br');
                                
INSERT INTO pecas VALUES ('1','Lanterna dianteira - direita','Fiat','763.27','1','5'),
						  ('2','Lanterna dianteira - esquerda','Fiat','763.27','1','5'),
                          ('3','Amortecedor','Toyota','1350.99','3','7'),
                          ('4','Bateria','Toyota','570.99','3','13');
                            

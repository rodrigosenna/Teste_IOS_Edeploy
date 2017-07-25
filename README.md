Objetivo
O objetivo deste projeto é desenvolver uma interface para consultar a pontuação das cidades do Brasil.
Escopo
Lista de Cidades
O layout das telas deve seguir o protótipo abaixo:

Na primeira tela, o usuário preenche o nome da cidade e o estado e pressiona o botão “Buscar”.
O sistema deverá retornar todas as cidades que satisfaçam a busca do usuário. O usuário poderá especificar parte dos nomes. Exemplo: se o usuário digitar “Bar” no campo cidade as cidades “Barra de Santo Antonio”, “Barra de São Miguel” deverão ser retornadas entre outras. Maiúsculas e minúsculas digitadas pelo usuário deverão ser ignoradas.
Ao clicar sobe uma cidade da lista, a pontuação daquela cidade deverá ser exibida.

Serviços
Os dados deverão ser carregados do seguinte serviço:
http://wsteste.devedp.com.br/Master/CidadeServico.svc
Este serviço pode ser acessado como SOAP (Através do WSDL localizado em http://wsteste.devedp.com.br/Master/CidadeServico.svc?wsdl) ou por REST
GET
http://wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaTodasCidades
POST
http://wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaPontos
{“Nome”:”Barueri”,”Estado”:”São Paulo”}
Exemplos de chamada REST:
GET http://wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaTodasCidades HTTP/1.1
Accept-Encoding: gzip,deflate
Host: wsteste.devedp.com.br
Connection: Keep-Alive
User-Agent: Apache-HttpClient/4.1.1 (java 1.5)


POST http://wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaPontos HTTP/1.1
Accept-Encoding: gzip,deflate
Content-Type: application/json
Content-Length: 36
Host: wsteste.devedp.com.br
Connection: Keep-Alive
User-Agent: Apache-HttpClient/4.1.1 (java 1.5)

{"Nome":"asdf","Estado":"São Paulo"}


Infelizmente o serviço BuscaTodasCidades retorna uma lista com todas as cidades e não suporta filtros, então estes devem ser implementados na interface.

O serviço BuscaPontos recebe uma cidade e retorna o valor de pontos daquela cidade.

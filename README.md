# REDIS

## Instalação

É possivel iniciar o redis de várias formas:

### Manual

Criando um container chamado ``redis`` na porta ``6379`` com base na imagem do redis

```
sudo docker run --name redis-container -p 6379:6379 redis
```
### Dockerfile

Criando a partir de um dockerfile

```
docker build -t redis-image .
```
### docker-compose

Com o docker compose

```
docker-compose up -d
```

Acessando o redis com o comando ``redis-cli``

```
docker exec -it redis-container redis-cli
```

## Usando redis
para definir uma chave é possivel usar o comando ``set key value``

```
set chave1 "meuValor"
```

para ler uma chave se utiliza ``get key``

```
get chave1
```

é possivel tambem definir um tempo para a chave existir, com o argumento ``EX ttl``

```
set chaveTemp "meuValorTemporario" EX 10
```

para verificar se uma chave existe, é possivel usar o comando ``exists key``

```
exists chave1
```

```
exists chaveTemp
```

para apagar uma chave, existe o comando ``del key``

```
del chave1
```

## Tipo de dados

### Strings
As strings Redis armazenam sequências de bytes, incluindo texto, objetos serializados e matrizes binárias. Como tal, as strings são o tipo de dados Redis mais básico
os exemplos mostrado acima, utilizam strings

```
set chave1 "meuValor"
```
```
get chave1
```
[Redis Strings](https://redis.io/docs/data-types/strings/)

### Lists

As listas do Redis são listas vinculadas de valores de string. As listas do Redis são frequentemente usadas para:
- Implemente pilhas e filas.
- Crie gerenciamento de filas para sistemas de trabalho em segundo plano.

para adicionarmos valores na lista podemos usar ``LPUSH key value`` e para remover ``RPOP/LPOP key``, e podemos ver o tamanho da lista com ``LLEN``

```
LPUSH minhalista 1
```
```
LPOP minhalista 
```
```
LLEN minhalista
```
[Redis lists](https://redis.io/docs/data-types/lists/)

### Sets

Um conjunto Redis é uma coleção não ordenada de strings exclusivas (membros). Você pode usar conjuntos Redis para:
- Rastreie itens exclusivos (por exemplo, rastreie todos os endereços IP exclusivos que acessam uma determinada postagem de blog).
- Representar relações (por exemplo, o conjunto de todos os usuários com um determinado papel).
- Realize operações de conjuntos comuns, como interseção, uniões e diferenças.

para adicionarmos um item à um set, podemos usar ``SADD key value ``


```
SADD aluno:1:disciplinas 1
SADD aluno:1:disciplinas 2
```
```
SADD aluno:2:disciplinas 1
```

podemos obter os valores de um set usando ``SMEMBERS key ``
```
SMEMBERS  aluno:1:disciplinas
```

[Redis sets](https://redis.io/docs/data-types/sets/)

### Hashes

Os hashes do Redis são tipos de registro estruturados como coleções de pares de valores de campo. Você pode usar hashes para representar objetos básicos e armazenar agrupamentos de contadores, entre outras coisas.

para criarmos um hash, podemos utilizar o comando ``HET key field value field value...``

```
HSET aluno:2 usuario Gian.Riske primeiroNome Gian ultimoNome Riske semestre 10
```

e para ler podemos usar ``HGET key field`` ou ``HGETALL key`` para obermos tudo

```
HGET aluno:2 usuario
```
```
HGETALL aluno:2
```
[Redis hashes](https://redis.io/docs/data-types/hashes/)

## Redis Pub/Sub

Redis tambem funciona como sistema de mensagens/eventos
com o comando ``SUBSCRIBE CHANNEL`` podemos escutar eventos despachados para este canal

```
subscribe canal1
```
e para publicar-mos uma mensagem, utilizamos ``PUBLISH CHANNEL MESSAGE``

```
publish canal1 "Valor da mensagem"
``` 
[Redis Pub/Sub](https://redis.io/docs/manual/pubsub/)

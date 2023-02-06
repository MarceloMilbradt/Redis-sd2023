## REDIS

### Iinstalação

Criando um container chamado ``redis`` na porta ``6379`` com base na imagem do redis

```
sudo docker run --name redis -p 6379:6379 redis
```

Acessando o redis com o comando ``redis-cli``

```
docker exec -it redis redis-cli
```

### Usando redis
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


subscribe canal1
publish canal1
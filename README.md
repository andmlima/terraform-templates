# Terraform projeto Beanstalk
Provisionar BeansTalk utilizando Terraform e em seguida hospedar uma aplicação Java.

Repositório Github com todos projetos do treinamento 36-projetos
https://github.com/andmlima/36projetos
https://github.com/devopshydclub/vprofile-project



## Recursos do ambiente
o ambiente será composto utilizando os seguintes recursos AWS:
<ul> 
    <li>S3 bucket</li>
    <li>VPC</li>
    <li>RDS - MySQL database</li>
    <li>ElastiCache</li>
    <li>Amazon MQ</li>
    <li>BeansTalk</li>
    <li>EC2 Ubuntu instance</li>
</ul>

## Projeto 
![image](/imagens/projeto.png)

## Aplicação
  Configurar uma aplicação Java para utilizar o ambiente provisionado
  
  Gerar o artefado da aplicação

### Resumo das etapas  
  atualizar arquivo application.properties da aplicação Java para utilizar as configurações do ambiente provisionado. Nesse arquivo será configurado as seguintes parametros:
  
  Endpoint da database;
  
  Endpoint ElistiCache configuration;
  
  Endpoint do Amazon MQ AMQP;
  
  Rabbit MQ porta;
  
  User and password da database;
  
  Database name

#### Step by step:  
#### Download do codigo da aplicação  
 mkdir C:/Temp/terraform-templates/app-aterfato
 
 cd C:/Temp/terraform-templates/app-aterfato
 
 git clone -b vp-rem https://github.com/andmlima/36projetos.git
 
 cd  36projetos
 
 git checkout vp-rem
 
 cat .git/config

#### Editar o arquivo Java application.properties adicionando os endpoints e porta dos componentes
 cd src/main/resources/

 vim application.properties

  *altualizar as seguinte linhas:

  jdbc.url=<endpoint da database>

  memcached.active.host=<configuration endpoint do memcache>

  rabbitmq.address=<endpoint do Amazon MQ AMQP>

  rabbitmq.port=5671

  rabbitmq.username=rabbit

  rabbitmq.password=Gr33n@pple123456

### Exemplo de como fica as linhas: 
 jdbc.url=jdbc:mysql://terraform-20211124173249173700000001.cypcxijrawk2.us-east-1.rds.amazonaws.com:3306/accounts?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull

 memcached.active.host=vprofile-cache.gdntv1.cfg.use1.cache.amazonaws.com

 rabbitmq.address=b-fd59acf9-176b-4cb4-9a0f-9ea7cdf8d2a7-1.mq.us-east-1.amazonaws.com

 rabbitmq.port=5671

 rabbitmq.username=rabbit

 rabbitmq.password=Gr33n@pple123456

### Gerando o arquivo WAR do artefato, ir no diretorio onde esta o arquivo pom.xml para gerar o artefado
 cd ../../..

 mvn install

 cd target

### Upload e Deploy do WAR artefado no BeansTalk
 cd target

 Acessar BeansTalk e fazer o upload do arquivo vprofile-v2.war

## Validatação da aplicação
 Acessar o link da aplicação fornecido pelo BeansTalk
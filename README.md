# ChuckNorris

Uma pequena aplicação que consome dados da API dos fatos do Chuck Norris.

## O Projeto

Para acompanhamento das Issues e Milestones você pode acessar:
[https://github.com/jjfernandes87/ChuckNorris/issues](https://github.com/jjfernandes87/ChuckNorris/issues)

Criei também um Guia (board) do projeto que você pode acessar: 
[https://github.com/users/jjfernandes87/projects/1](https://github.com/users/jjfernandes87/projects/1)

## Arquitetura

Para esse projeto foi usado o VIPER, sendo uma forma de usar a Clean Architecture e assim fazer as interações entre as camadas propostas pelo Uncle Bob. 
VIPER é formado pelas seguintes palavras: 

View -> Telas

Interactor -> Regras de negócio à nível de aplicação

Presenter -> Transformam dados para serem apresentados ou encaminhados para a interactor

Entity -> Value Objects ou lógicas reaproveitáveis

Router -> Guia de fluxo de telas

## Pastas

- Utils
    - Extension
    - TagCollectionView
- Models
    - CoreData
    - Entities
- Components
    - BaseViewController
    - Services
    - SharedContent
    - TableViewCells
- Modules
    - Facts
        - View
        - Detail
        - Collection
    - Search
- Resources
    - Launch
    - Config
    - CoreData
    - Images
- Base

## Testes

Para esse projeto foi usado o Quick & Nimble para os testes unitários e o XCUITest para os de interface

Alem disso estou usando fastlane Snapshot 

## Frameworks
	
###### Externos:
- pod 'Alamofire'
- pod 'Quick'
- pod 'Nimble'

###### Próprios:
- pod 'SelfTableViewManager'
- pod 'ConfigurationProvider'
- pod 'LaunchApplication'

###### Framework: SelfTableViewManager

Lib propria que abstrai o uso da tableview, e usa uma arquitetura de MVVM. Sua ViewController ou Presenter fica livre dos dataSource da tableview como cellForRow, etc. Você trabalha com um array de viewModels (cellController)

###### Framework: ConfigurationProvider

Lib propria que permite que você crie diferentes schemes para sua aplicação e rode diversos ambientes, alem de guardar todos as configurações do seu app em um unico lugar. Você pode configurar variaveis globais e também configurar urls de API's

###### Framework: LaunchApplication

Lib propria que permite você criar uma sequencia de inicialização do seu app. Você remove metodos que poderiam ficar perdidos no AppDelegate e move para uma sequencia que você define. Tudo via array

## Passo a passo de como rodar o projeto

Antes de tudo você precisa instalar o Bundler. Bundler garante que todos os desenvolvedores que trabalhem no projeto usem as mesmas versões de serviços como Cocoapods e Fastlane.

Abra o terminal e use o seguindo comando para instalar o Bundler:

```
gem install bundler
```

Para executar a aplicação, siga o comando abaixo::

```
cd Facts/
bundle install
```

O ultimo comando instalará todas as dependencias necessárias para rodar a aplicação:

```
bundle exec pod install
```

## Passo a passo de como testar a aplicação

Se você quiser rodar os testes localmente, basta usar o fastlane:

```
bundle exec fastlane tests
```

Se você quiser ver a cobertura de testes

```
bundle exec fastlane coverage
```

Se você quiser ver os screenshots

```
bundle exec fastlane screenshots
```
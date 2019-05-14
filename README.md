# ChuckNorris

Uma pequena aplicação que consome dados da API dos fatos do Chuck Norris.

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

## SelfTableViewManager

Lib propria que abstrai o uso da tableview, e usa uma arquitetura de MVVM. Sua ViewController ou Presenter fica livre dos dataSource da tableview como cellForRow, etc. Você trabalha com um array de viewModels (cellController)

## ConfigurationProvider

Lib propria que permite que você crie diferentes schemes para sua aplicação e rode diversos ambientes, alem de guardar todos as configurações do seu app em um unico lugar. Você pode configurar variaveis globais e também configurar urls de API's

## LaunchApplication

Lib propria que permite você criar uma sequencia de inicialização do seu app. Você remove metodos que poderiam ficar perdidos no AppDelegate e move para uma sequencia que você define. Tudo via array

## O Projeto

Para acompanhamento das Issues e Milestones você pode acessar:
[https://github.com/jjfernandes87/ChuckNorris/issues](https://github.com/jjfernandes87/ChuckNorris/issues)

Criei também um Guia (board) do projeto que você pode acessar: 
[https://github.com/users/jjfernandes87/projects/1](https://github.com/users/jjfernandes87/projects/1)

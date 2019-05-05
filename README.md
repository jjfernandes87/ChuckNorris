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

- Models
    - Entities
- Components
    - BaseViewController
    - Services
    - Extension
    - SharedContent
    - TableViewCells
- Modules
    - Facts
        - View
        - Detail
        - Collection
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

# Criar um aplicativo de consulta a API do [GitHub](https://github.com)#

Criar um aplicativo para consultar a [API do GitHub](https://developer.github.com/v3/) e trazer os repositórios mais populares de Swift. Basear-se no mockup fornecido:

![bitbucket.png](https://bitbucket.org/repo/bApLBb/images/1070562783-bitbucket.png)
### **Deve conter** ###

- __Lista de repositórios__. Exemplo de chamada na API: `https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1`
  * Paginação na tela de lista, com endless scroll / scroll infinito (incrementando o parâmetro `page`).
  * Cada repositório deve exibir Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
  * Ao tocar em um item, deve levar a lista de Pull Requests do repositório
- __Pull Requests de um repositório__. Exemplo de chamada na API: `https://api.github.com/repos/<criador>/<repositório>/pulls`
  * Cada item da lista deve exibir Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR
  * Ao tocar em um item, deve abrir no browser a página do Pull Request em questão

### **A solução DEVE conter** ##

* Versão mínima do iOS : 9.*
* Arquivo .gitignore
* Usar Storyboard e Autolayout
* Gestão de dependências no projeto. Ex: Carthage ou Cocoapods
* Framework para Comunicação com API. Ex:  Moya
* Mapeamento json -> Objeto . Ex: [Argo](https://github.com/thoughtbot/Argo)

### **Ganha + pontos se conter** ###

* Arquitetura MVVM, VIPER ou Clean Swift
* Carthage
* Testes unitários no projeto. Ex: Quick + Nimble
* Testes funcionais
* Cache de Imagens

### **Sugestões** ###

As sugestões de bibliotecas fornecidas são só um guideline, sintam-se a vontade para usar diferentes e nos surpreenderem. O importante de fato é que os objetivos macros sejam atingidos. =)

### **Processo de submissão** ###

O candidato deverá implementar a solução e enviar um pull request para este repositório com a solução.

O processo de Pull Request funciona da seguinte maneira:

1. Candidato fará um fork desse repositório (não irá clonar direto!)
2. Fará seu projeto nesse fork.
3. Commitará e subirá as alterações para o __SEU__ fork.
4. Pela interface do Bitbucket, irá enviar um Pull Request.

Se possível deixar o fork público para facilitar a inspeção do código.

### **ATENÇÃO** ###

Não se deve tentar fazer o PUSH diretamente para ESTE repositório!
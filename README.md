Alguns detalhes:
- Programas necessários para rodar essa aplicação: Flutter, Android Studio
- Fazer modificações no arquivo pubspec.yaml antes de rodar o programa
- Baixar a imagem do logo e colocar em uma pasta com nome imagens dentro do projeto (nome logo-public)
- Baixar fonte utilizada no link https://www.fontsquirrel.com/fonts/glacial-indifference e colocar em uma pasta com nome fonts dentro do projeto

Modificações a serem feitas no pubspec.yaml para usar as imagens e fontes:

- Dentro do pubspec.yaml em flutter colocar a pasta das imagens desse jeito: 

    assets:
      - imagens/
      

- Mais abaixo colocar as especificações da fonte dessa maneira:

fonts:
  - family: Glacial Indifference
    fonts:
      - asset: fonts/GlacialIndifference-Regular.otf
      - asset: fonts/GlacialIndifference-Italic.otf
        style: italic
      - asset: fonts/GlacialIndifference-Bold.otf
        weight: 700
        


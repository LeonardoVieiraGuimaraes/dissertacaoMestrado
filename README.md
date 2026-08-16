# Dissertação de Mestrado — classificação de uvas por análise de textura

Código, base de imagens e algoritmos da dissertação em Modelagem Computacional e Sistemas
(UNIMONTES).

## O problema

Distinguir variedades de uva a partir de imagem. Cor e formato ajudam pouco: variedades
diferentes podem ter tom e silhueta parecidos. O que as separa é a **textura** — o padrão
de variação de intensidade na superfície.

## As variedades estudadas

| Pasta | Variedade |
| :--- | :--- |
| `Italia` | Itália |
| `Red Globe` | Red Globe |
| `Vitoria` | Vitória |

## Organização

| Pasta | Conteúdo |
| :--- | :--- |
| `Imagens/1` a `5` | Base de imagens, por sessão de aquisição |
| `textura/` | Descritores extraídos, separados por variedade |
| `textura/Treinamento` | Conjunto de treino dos classificadores |
| `algoritmos/` | Implementações em MATLAB |

## Método

1. **Aquisição** — captura em condições controladas
2. **Pré-processamento** — segmentação e normalização
3. **Extração de características de textura** — descritores estatísticos calculados sobre
   a superfície do fruto
4. **Classificação** — treino e avaliação sobre o conjunto separado

A separação entre `textura/` e `Treinamento/` é o que garante que a avaliação não use os
mesmos dados do treino.

## Por que textura, e não aprendizado profundo

Rede convolucional exige base grande. Com poucas centenas de amostras por variedade,
descritor de textura bem escolhido costuma superar rede treinada do zero — e, além disso,
**dá para explicar por que classificou assim**.

A mesma preferência por modelo interpretável continua na pesquisa de doutorado, agora em
detecção de fraude.

## Como executar

MATLAB ou GNU Octave:

```matlab
cd algoritmos
run('principal.m')
```

Confira os caminhos das pastas de imagem no início dos scripts.

## Relacionados

- [`visaoComputacional-mestrado`](https://github.com/LeonardoVieiraGuimaraes/visaoComputacional-mestrado) — a disciplina que fundamenta este trabalho
- [`InteligenciaComputacional`](https://github.com/LeonardoVieiraGuimaraes/InteligenciaComputacional) — sistemas fuzzy no doutorado

---

## Autor

**Leonardo Vieira Guimarães** — desenvolvedor backend e Product Owner no IMA.
Mestre em Modelagem Computacional e Sistemas (UNIMONTES), doutorando em Modelagem
Matemática e Computacional (CEFET-MG).

[![Portfólio](https://img.shields.io/badge/Portf%C3%B3lio-leoproti.com.br-0A0A0A?style=flat)](https://leoproti.com.br)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0000--3118--4664-A6CE39?style=flat&logo=orcid&logoColor=white)](https://orcid.org/0009-0000-3118-4664)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-perfil-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/leonardo-vieira-guimaraes/)

# 🏃‍♂️ Catálogo de Tênis Nike - Racket

Um sistema interativo em Racket para explorar informações sobre tênis Nike icônicos.

## 👟 Modelos Incluídos

- **Nike Air Max 95** (1995) - Design anatômico revolucionário
- **Nike Shox TL** (2003) - Tecnologia de colunas de amortecimento
- **Nike TN (Air Max Plus)** (1998) - Sistema Tuned Air
- **Nike Shox R4** (2000) - Primeiro modelo da linha Shox
- **Nike Air Max Tailwind IV** (1999) - Design clean dos anos 90
- **Nike Air Max Tailwind V** (2013) - Evolução do Tailwind IV

## 🚀 Como Usar

### Pré-requisitos
- Racket instalado no sistema ([Download aqui](https://racket-lang.org/))

### Executando o Programa

1. **Navegue até o diretório do projeto:**
   ```bash
   cd /caminho/para/racket
   ```

2. **Execute o arquivo principal:**
   ```bash
   racket tenis-clean.rkt
   ```

3. **Use o menu interativo:**
   - Digite `(main-menu)` para acessar o menu completo
   - Digite `(demo)` para uma demonstração rápida

## 📋 Funcionalidades

### Menu Principal
1. **Ver todos os tênis** - Exibe catálogo completo
2. **Buscar tênis por nome** - Busca parcial por nome
3. **Ver tênis dos anos 90** - Filtra por década
4. **Ver tênis dos anos 2000** - Filtra por década
5. **Ver tênis dos anos 2010** - Filtra por década
6. **Ver estatísticas** - Mostra dados do catálogo
7. **Sair** - Encerra o programa

### Funções Disponíveis

```racket
;; Exibir todos os tênis
(display-all-sneakers)

;; Buscar tênis por nome
(find-sneaker "Air Max")

;; Exibir estatísticas
(display-stats)

;; Menu interativo
(main-menu)

;; Demonstração rápida
(demo)
```

## 📊 Informações dos Tênis

Cada tênis inclui:
- Nome e ano de lançamento
- Tecnologia principal
- Descrição detalhada
- Preço estimado
- Lista de características técnicas

## 🛠️ Estrutura do Código

- **Struct `sneaker`**: Estrutura de dados para cada tênis
- **Base de dados**: Lista com todos os modelos
- **Funções de busca**: Filtros por nome e década
- **Interface**: Menu interativo e funções de exibição

## 📝 Exemplo de Uso

```racket
;; Carregar o arquivo
racket tenis-clean.rkt

;; No REPL do Racket:
> (demo)                    ; Demonstração rápida
> (main-menu)               ; Menu interativo
> (find-sneaker "Shox")     ; Buscar modelos Shox
> (display-stats)           ; Ver estatísticas
```

## 🎯 Próximas Melhorias

- [ ] Interface gráfica com Racket GUI
- [ ] Salvar/carregar dados de arquivo
- [ ] Mais modelos de tênis
- [ ] Sistema de favoritos
- [ ] Comparação entre modelos

---

**Desenvolvido em Racket** 🏀

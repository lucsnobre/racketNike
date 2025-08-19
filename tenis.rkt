;; Projeto: Catálogo de Tênis Nike
;; Descrição: Sistema para apresentar informações sobre tênis Nike icônicos
;; Modelos: Air Max 95, Shox TL, TN, Shox R4, Tailwind IV e V

(require racket/format)

;; Estrutura para representar um tênis
(struct sneaker (name year technology description price features) #:transparent)

;; Base de dados dos tênis Nike
(define nike-sneakers
  (list
    (sneaker "Nike Air Max 95"
             1995
             "Air Max (câmara de ar visível)"
             "Inspirado na anatomia humana, com design de camadas que lembra músculos e tendões. Revolucionou o design de tênis com sua estética futurística."
             "R$ 899,99"
             (list "Câmara de ar Max Air no calcanhar e antepé"
                   "Cabedal em couro e mesh"
                   "Design anatômico inspirado no corpo humano"
                   "Solado de borracha com tração multidirecional"))
    
    (sneaker "Nike Shox TL"
             2003
             "Shox (colunas de amortecimento)"
             "Parte da linha Shox, conhecido por suas quatro colunas de amortecimento no calcanhar que proporcionam retorno de energia."
             "R$ 799,99"
             (list "4 colunas Shox para amortecimento"
                   "Placa de carbono para estabilidade"
                   "Cabedal sintético e mesh"
                   "Sistema de retorno de energia"))
    
    (sneaker "Nike TN (Air Max Plus)"
             1998
             "Tuned Air (ar sintonizado)"
             "Conhecido como 'TN', apresenta tecnologia Tuned Air com gradientes de pressão para máximo conforto e suporte."
             "R$ 949,99"
             (list "Sistema Tuned Air com gradientes de pressão"
                   "Design agressivo com linhas onduladas"
                   "Cabedal em couro sintético e mesh"
                   "Palmilha Phylon para amortecimento"))
    
    (sneaker "Nike Shox R4"
             2000
             "Shox (colunas de amortecimento)"
             "O primeiro modelo da linha Shox, revolucionário por suas colunas de amortecimento que simulam molas."
             "R$ 749,99"
             (list "4 colunas Shox originais"
                   "Placa de fibra de carbono"
                   "Cabedal em couro e materiais sintéticos"
                   "Solado de borracha durável"))
    
    (sneaker "Nike Air Max Tailwind IV"
             1999
             "Air Max (câmara de ar)"
             "Parte da série Tailwind, conhecido por seu design clean e tecnologia Air Max no calcanhar para amortecimento."
             "R$ 699,99"
             (list "Unidade Air Max no calcanhar"
                   "Cabedal em mesh e overlays sintéticos"
                   "Design streamlined dos anos 90"
                   "Solado de borracha com padrão waffle"))
    
    (sneaker "Nike Air Max Tailwind V"
             2013
             "Air Max (câmara de ar)"
             "Evolução do Tailwind IV com melhorias no design e conforto, mantendo a essência do modelo original."
             "R$ 729,99"
             (list "Unidade Air Max visível no calcanhar"
                   "Cabedal atualizado em mesh e TPU"
                   "Maior ventilação e respirabilidade"
                   "Entressola de Phylon mais leve"))))

;; Função para exibir informações de um tênis
(define (display-sneaker s)
  (printf "~n========================================~n")
  (printf "🏃 ~a (~a)~n" (sneaker-name s) (sneaker-year s))
  (printf "========================================~n")
  (printf "💡 Tecnologia: ~a~n" (sneaker-technology s))
  (printf "💰 Preço: ~a~n" (sneaker-price s))
  (printf "~n📝 Descrição:~n~a~n" (sneaker-description s))
  (printf "~n✨ Características:~n")
  (for ([feature (sneaker-features s)]
        [i (in-naturals 1)])
    (printf "   ~a. ~a~n" i feature))
  (printf "========================================~n"))

;; Função para exibir todos os tênis
(define (display-all-sneakers)
  (printf "~n🏆 CATÁLOGO COMPLETO DE TÊNIS NIKE 🏆~n")
  (for ([s nike-sneakers])
    (display-sneaker s)))

;; Função para buscar tênis por nome (busca parcial)
(define (find-sneaker name-part)
  (filter (lambda (s)
            (string-contains? (string-downcase (sneaker-name s))
                             (string-downcase name-part)))
          nike-sneakers))

;; Função para listar tênis por década
(define (sneakers-by-decade decade)
  (filter (lambda (s)
            (let ([year (sneaker-year s)])
              (and (>= year decade) (< year (+ decade 10)))))
          nike-sneakers))

;; Função para exibir estatísticas
(define (display-stats)
  (printf "~n📊 ESTATÍSTICAS DO CATÁLOGO 📊~n")
  (printf "========================================~n")
  (printf "Total de modelos: ~a~n" (length nike-sneakers))
  (printf "Período: ~a - ~a~n" 
          (apply min (map sneaker-year nike-sneakers))
          (apply max (map sneaker-year nike-sneakers)))
  
  (printf "~nModelos por década:~n")
  (for ([decade '(1990 2000 2010)])
    (let ([count (length (sneakers-by-decade decade))])
      (when (> count 0)
        (printf "  ~as: ~a modelo(s)~n" decade count))))
  
  (printf "~nTecnologias presentes:~n")
  (let ([techs (remove-duplicates 
                (map (lambda (s) 
                       (car (string-split (sneaker-technology s) " ")))
                     nike-sneakers))])
    (for ([tech techs])
      (printf "  • ~a~n" tech))))

;; Menu interativo
(define (show-menu)
  (printf "~n🔥 NIKE SNEAKERS COLLECTION 🔥~n")
  (printf "================================~n")
  (printf "1. Ver todos os tênis~n")
  (printf "2. Buscar tênis por nome~n")
  (printf "3. Ver tênis dos anos 90~n")
  (printf "4. Ver tênis dos anos 2000~n")
  (printf "5. Ver tênis dos anos 2010~n")
  (printf "6. Ver estatísticas~n")
  (printf "7. Sair~n")
  (printf "================================~n")
  (printf "Escolha uma opção (1-7): "))

;; Função principal do menu
(define (main-menu)
  (show-menu)
  (let ([choice (read)])
    (cond
      [(equal? choice 1) 
       (display-all-sneakers)
       (main-menu)]
      [(equal? choice 2)
       (printf "Digite parte do nome do tênis: ")
       (let* ([input (read-line)]
              [results (find-sneaker input)])
         (if (empty? results)
             (printf "Nenhum tênis encontrado com '~a'~n" input)
             (for ([s results]) (display-sneaker s)))
         (main-menu))]
      [(equal? choice 3)
       (printf "~n👟 TÊNIS DOS ANOS 90 👟~n")
       (for ([s (sneakers-by-decade 1990)]) (display-sneaker s))
       (main-menu)]
      [(equal? choice 4)
       (printf "~n👟 TÊNIS DOS ANOS 2000 👟~n")
       (for ([s (sneakers-by-decade 2000)]) (display-sneaker s))
       (main-menu)]
      [(equal? choice 5)
       (printf "~n👟 TÊNIS DOS ANOS 2010 👟~n")
       (for ([s (sneakers-by-decade 2010)]) (display-sneaker s))
       (main-menu)]
      [(equal? choice 6)
       (display-stats)
       (main-menu)]
      [(equal? choice 7)
       (printf "~n👋 Obrigado por usar o catálogo Nike! 👋~n")]
      [else
       (printf "Opção inválida! Tente novamente.~n")
       (main-menu)])))

;; Função para demonstração rápida
(define (demo)
  (printf "~n🚀 DEMONSTRAÇÃO RÁPIDA 🚀~n")
  (display-stats)
  (printf "~n🔍 Exemplo de busca por 'Air Max':~n")
  (for ([s (find-sneaker "Air Max")])
    (display-sneaker s)))

;; Exportar funções principais
(provide main-menu demo display-all-sneakers find-sneaker display-stats)

;; Executar demonstração ao carregar o arquivo
(printf "~n🏃‍♂️ Bem-vindo ao Catálogo de Tênis Nike! 🏃‍♂️~n")
(printf "Execute (main-menu) para o menu interativo ou (demo) para uma demonstração.~n")

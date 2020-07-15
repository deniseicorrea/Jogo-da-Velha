
algoritmo "Hash"
//-------------------------------------------------------------------------
    procedimento Preenchermatriz() //BLOCO 1
    inicio
       Para i de 1 ate 3 faca
            Para j de 1 ate 3 faca
              cont <- cont +1
              jogo[i,j] <- numpcarac(cont)
            FimPara
       FimPara
    Fimprocedimento
//-------------------------------------------------------------------------
   procedimento velha()        //BLOCO 2
   inicio
      escreval("====================")
      escreval("    Jogo da Velha   ")
      escreval("+-----+-----+-----+ ")
         Para i <- 1 ate 3 faca
               Para j <- 1 ate 3 faca
               escreva("| ")
               escreva(jogo[i,j]:4)
               FimPara
               escreva("| ")
               escreval()
               escreval("+-----+-----+-----+ ")
         FimPara
               escreval("====================")
   FimProcedimento
//----------------------------------------------------------------------------
    procedimento jogar()
    inicio                         //BLOCO 3
       x <- "x"
       vencedor <- falso
       vez <- 0
       par <- 1
    Repita
       escreval("Digite um nomero para ", x, " : ")
       leia(op)
       Se (op > 0) e (op < 10) entao
          Se (op > 0) e (op < 4) entao    //descobrindo linha e coluna que
          l <- 1                          //o usuário digitou
          Se (jogo [l,op] = "x") ou  (jogo[l,op] = "0") entao
          escreval("Esse número já esta preenchido")
          escreval("Pressione Enter para continuar")
          leia(a)
          senao
          jogo[l,op] <- x
            codrepetido()
          fimse
          
             Senao
//---------------------------------------------------------------------------
             Se (op > 3) e (op < 7) entao
                  l <- 2
             Se (jogo [l,op -3] = "x") ou  (jogo[l,op -3] = "0") entao
                 escreval("Esse número já esta preenchido")
                 escreval("Pressione Enter para continuar")
                 leia(a)
             senao
                  jogo[l,op-3] <- x
                  codrepetido()
                  fimse
                  
//---------------------------------------------------------------------------
              Senao
                 l <- 3
                  Se (jogo [l,op -6] = "x") ou  (jogo[l,op -6] = "0") entao
                     escreval("Esse número já esta preenchido")
                     escreval("Pressione Enter para continuar")
                     leia(a)
              senao
                 jogo[l,op-6] <- x
                 codrepetido()
                 fimse
               FimSe
           FimSe
   //--------------------------------------------------------------------
       Senao
         escreval("Opçao inválida")
         escreval("Pressione Enter para continuar")
         leia(a) // variavel devido o limpatela esta engolindo o comando
       FimSe
       limpatela // esse comando engole os 'escreva'
       velha()
 Ate (vencedor = verdadeiro) ou (vez = 9)
  Se (vencedor = verdadeiro) entao
      escreval("O jogador ", x , " venceu.")
  Senao
      escreval("Deu velha!!!")
  fimse
 
   fimprocedimento
//----------------------------------------------------------------------------
  procedimento codrepetido                       //PENULTIMO BLOCO
  inicio
  vencedor <- verificarvencedor()
   vez <- vez +1
      Se (vencedor = falso) entao
        Se( par % 2 <> 0) entao    //se for impar
                  x <- "0"
        senao
                  x <- "x"
        fimse
        par <- par + 1
      fimse



  fimprocedimento
//--------------------------------------------------------------------------
  funcao verificarvencedor():logico // V ou F
  var
  venceu : logico                         //ULTIMO BLOCO
  inicio
  venceu <- falso
   //horizontal
   para i <- 1 ate 3 faca
      Se ((jogo[i,1] = jogo[i,2] ) e (jogo[i,2] = jogo[i,3])) entao
       venceu <- verdadeiro
      fimse
    fimpara
   //vertical

        para i <- 1 ate 3 faca
      Se (jogo[1,i] = jogo[2,i] ) e (jogo[2,i] = jogo[3,i]) entao
       venceu <- verdadeiro
      fimse
    fimpara

    //diagonal 1 colunas sao iguais as linhas
     Se ((jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3])) entao
         venceu <- verdadeiro
      fimse
     //diagonal2
     Se (jogo[1,3] = jogo[2,2]) e (jogo[2,2] = jogo[3,1]) entao
         venceu <- verdadeiro
      fimse
      
      retorne venceu
   fimfuncao
//--------------------------------------------------------------------------
var
 i, j, cont: inteiro
 jogo: vetor [1..3, 1..3] de caractere
 x : caractere // guarda valor X e 0
 l, op: inteiro
 vencedor:logico
 vez: inteiro
 par : inteiro
 a: caractere
inicio
cont <- 0
PreencherMatriz()
velha()
jogar ()
fimalgoritmo
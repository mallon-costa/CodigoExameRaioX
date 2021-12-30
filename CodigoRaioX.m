%---------------PROCESSOS ESTOCASTICOS---------------
%-------Programa de reconhecimento dos tecidos por Raio-X utilizando m�dia e desvio padr�o-------
%Professor: Jean Carneiro

%COMPONENTES:
%Henrique Viana
%Jos� Arthur
%Luana Batista
%Manoel Malon

clear all; %Limpa valores de execu��es anteriores
[arq caminho]=uigetfile('*.*','Selecione o arquivo de imagem'); %ABRE
%A INTERFACE DE CARREGAMENTO
nomecompleto=strcat(caminho,arq); %CONCATENA STRINGS DE CAMINHO
I = imread(nomecompleto); % Armazena a Imagem em formato RGB (Se
%arquivo v�lido: bmp, tiff...
[M,N,C]=size(I); %Verifica o tamanho da imagem e plano de cores
imshow (I); % Mostra a imagem capturada
title('Imagem Original do Raio-X'); %insere titulo na janela da imagem original
for i=1:3 %como h� tr�s tipos de tecidos, � necess�rio um la�o para repetir 3 o procedimento
           %1-refere ao procedimento do tecido mole; 2-Ossos; 3-Musculos
  if(i==1) %Caso seja a primeira execu��o / Tecido Mole; apresenta um box com a mensagem abaixo
    gg=msgbox ('Clique em 30 pontos da �rea que pretende capturar para a formacao de espa�o amostral do tecido mole ou vazio! ','IMPORTA DADOS V1.0');
  elseif(i==2) %Caso seja a segunda execu��o / Ossos; apresenta um box com a mensagem abaixo
    gg=msgbox ('Clique em 30 pontos da �rea que pretende capturar para a formacao de espa�o amostral do Osso! ','IMPORTA DADOS V1.0');
  else %Caso seja a terceira execu��o / Musculos; apresenta um box com a mensagem abaixo
    gg=msgbox ('Clique em 30 pontos da �rea que pretende capturar para a formacao de espa�o amostral do Musculo! ','IMPORTA DADOS V1.0');
  endif
  uiwait(gg); % espera at� o popup ser acionado
  [x y]=ginput(30); %guarda coordenadas dos pontos escolhidos para a amostra
  
  X=round(x);Y=round(y); %converte para o formato apropriado - arrendoda os n�meros
  for t=1:30
    R(t)=I(Y(t),X(t),1);% cria a matriz do vermelho das amostras
    G(t)=I(Y(t),X(t),2);% cria a matriz do verde das amostras
    B(t)=I(Y(t),X(t),3);% cria a matriz do azul das amostras
  end
  
  Rmole=mean(R);Gmole=mean(G);Bmole=mean(B);% calcula as m�dias dos tons
  %vermelho, verde e azul pela fun��o especifica mean
  R=double(R);G=double(R);B=double(B); %transforma no formato apropriado
  %para calcular o desvio padr�o
  Rsmole=std(R);Gsmole=std(G);Bsmole=std(B); % calcula os desvios padr�o
  %do vermelho, verde e azul pela fun��o especifica std
  
  %Os la�os abaixo servem para percorrer cada pixel da imagem, pois � uma matriz e comparar com os valores 
  %calculados juntamente da media e do desvio padr�o
  
  for linha=1:M %este la�o percorre as linhas da imagem 
    for coluna=1:N  %este la�o percorre as colunas da imagem
      if((I(linha,coluna,1) >= abs(Rmole-Rsmole)) && (I(linha,coluna,1) <= (abs(Rmole+Rsmole)))) %compara o valor do Vermelho do pixel com o c�lculo da m�dia e do desvio do Vermelho
        if((I(linha,coluna,2) >= abs(Gmole-Gsmole)) && (I(linha,coluna,2) <= (abs(Gmole+Gsmole)))) %compara o valor do Verde do pixel com o c�lculo da m�dia e do desvio do Verde
          if((I(linha,coluna,3) >= abs(Bmole-Bsmole)) && (I(linha,coluna,3) <= (abs(Bmole+Bsmole)))) %compara o valor do Azul do pixel com o c�lculo da m�dia e do desvio do Azul
            if(i == 1) %Se estiver na parte do tecido mole, a cor vermelho � acrescentada no pixel em quest�o
              I(linha,coluna,1) = 256; %valor maximo do vermelho - lembre-se, 1 se refere ao vermelho
              I(linha,coluna,2) = 0; %valor minimo do verde - lembre-se, 2 se refere ao verde 
              I(linha,coluna,3) = 0; %valor minino do azul - lembre-se, 3 se refere ao azul
            elseif(i == 2) %Se estiver na parte do osso, a cor verde � acrescentada no pixel em quest�o
              I(linha,coluna,1) = 0;
              I(linha,coluna,2) = 256;
              I(linha,coluna,3) = 0;
            else %Se estiver na parte do musculo, a cor azul � acrescentada no pixel em quest�o
              I(linha,coluna,1) = 0;
              I(linha,coluna,2) = 0;
              I(linha,coluna,3) = 256;
            endif
          endif
        endif
      endif
    endfor
  endfor
  figure(2); %abre uma segunda janela, apresentando a imagem modificada
  imshow(I); %abre a imagem
  title('Imagem modificada do Raio-X'); %titulo da janela da imagem modificada
 endfor

 
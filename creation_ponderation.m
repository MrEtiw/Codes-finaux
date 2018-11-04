% **************************************************************
% * Projet II - PHS3902                                        *
% * Karl Egner (1794857)                                       *
% * Etienne Boisvenue (1798942)                                *
% **************************************************************

%Fonction qui prend en entr�e la matrice L qui contient les amas
%identifi�s.La fonction output la matrice ponderation. Dans la matrice ponderation
%Le numero de l'amas dans la matrice L est remplace par le nombre de carr�es
%qui forme chaque amas


function [ponderation]=creation_ponderation(L)
    n = size(L,1);
    m = size(L,2);
    clusters=unique(L);
    clusters=nonzeros(clusters);
    nombre_clusters=length(clusters);
    comptage=zeros(1,nombre_clusters);


    ponderation=zeros(n,m);
    for i=1:nombre_clusters
        k=find(L==clusters(i));
        comptage(i)=length(k);
        ponderation(k)=comptage(i);
    end
   



end



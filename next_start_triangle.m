
% 7 avril 2018
% Fonction qui d�finie notre prochain point de d�part
% i est l'endroit o� nous sommes (nous cherchons le next start � partir de
% M(i).
% M est la matrice binaire
% discovery_time est la matrice qui contient le moment auquel chaque
% position a �t� d�couverte
% Fonctionne pour une matrices dont les voisins sont d�finis comme �tant
% des triangles

% Pour runner la fonction, il faut l'appeler pour la premi�re fois dans un
% script qui ressemble � ceci:
% n=6;
% M=Grille_case(n,n,0.7);
% discovery_time=zeros(n,n);
% discovery_time(1)=1;
% next_start(1,M,discovery_time);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []=next_start_triangle(indice,M, discovery_time)
% voisins va contenir dans chaque colonne l'indice, la valeur dans M et la valeur dans discovery_time
% Ordre: droite, haut, bas, gauche
n=size(M,1);
time=discovery_time(indice);
voisins=voisin_triangle(indice,M);

%On trouve les voisins non-nuls
nonzv=[];
for j=1:size(voisins,2)
    if voisins(1,j)~=0
        nonzv=[nonzv voisins(:,j)];
    end
end

%je veux les voisins non-nul qui poss�de un discovery_time de zero
voisins_a_visiter=[];
for j=1:size(nonzv,2)
    index=(nonzv(3,j)-1)*n+nonzv(2,j);
    if discovery_time(index)==0
        voisins_a_visiter=[voisins_a_visiter index];
    end
    
end


% Je regarde si je suis dans un cul-de-sac
if isempty(voisins_a_visiter)==1
    time_avant=time-1;
    if time_avant>0 %donc que nous ne sommes pas � la case initiale
        precedent=find(discovery_time==time_avant); %on trouve l'indice du temps pr�c�dent
        discovery_time(indice)=NaN;%On ecrit dans discovery_time que la place o� nous sommes aller finalement c'�tait un cul-de-sac
        prochain=precedent;
        next_start_triangle(prochain,M,discovery_time); %on recall next_start sur l'endroit o� on �tait avant
    else
        %fprintf('de retour au debut, pas de percolation\n')
        dlmwrite('resultat_verif_percol_3.txt','0');
    end
else
    prochain=max(voisins_a_visiter); % en utilisant max, on favorise la direction � droite
    if prochain>n*(n-1) %condition d'arr�t 
        %fprintf('Arriver au bout, donc percolation\n')
        dlmwrite('resultat_verif_percol_3.txt','1');
       
    else
        %Si je ne suis pas au bout, recall next_start avec prochain qui est
        %le voisin avec l'indice maximal.
        discovery_time(prochain)=time+1;
        next_start_triangle(prochain,M,discovery_time);
    end
end
end
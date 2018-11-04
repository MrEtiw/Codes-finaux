function [M] = Grille_case(n,m,p)

    % Cette fonction g�n�re une grille de dimension nxm avec une probabilit�
    % d'occupation de p. Chacune des cases a la probabilit� p d'�tre occup�.
    rng shuffle;
    R = rand(n,m);
    M = R<=p;
    M=M*eye(n,m);

   %colormap([1 1 1;0 0 0]);
    %colorbar
    %image(M.*255);
end
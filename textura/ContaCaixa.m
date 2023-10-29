function cont = ContaCaixa(imagem,caixa)
    [ny,nx] = size(imagem);
    cont = 0;
    lin = 1;
    while lin < ny
        lin2 = lin + caixa - 1;
        if lin2>ny
            lin2=ny;
        end;
        
        
        col = 1;
        while col < nx
            col2 = col + caixa -1;
            if (col2 > nx);
                col2 = nx;
            end;
            
            %m = imagem(lin:lin2,col:col2);
            %if (sum(m(:)) > 0)
            %    cont = cont + 1;
            %end;
            m = imagem(lin:lin2,col:col2);
            c_max = max(m(:));
            c_min = min(m(:));
            cont = cont + fix(c_max/caixa) - fix(c_min/caixa)+1;
            col = col + caixa;
        end
        lin = lin + caixa;
    end
end
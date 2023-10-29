function [coef, esc, va] = PCA(D)

    [coef, esc, va] = princomp(D);
    
    figure
    plot(D(:,1), D(:,2),'k*')
    axis([min(D(:,1))-1 max(D(:,1))+1 min(D(:,2))-1 max(D(:,2))+1]);
    xlabel('Eixo X');
    ylabel('Eixo Y');
    title('Dados originais');
    
    var_x = var(D(:,1));
    var_y = var(D(:,2));
    
    fprintf('Percentagem de vari�ncia dos dados originais\n')
    fprintf('Vari�ncia no eixo X: %f\n',var_x/(var_x+var_y));
    fprintf('Vari�ncia no eixo X: %f\n',var_y/(var_x+var_y));
    
    figure
    plot(esc(:,1),esc(:,2),'k*');
    axis([min(esc(:,1))-1 max(esc(:,1))+1 min(esc(:,2))-1 max(esc(:,2))+1]);
    xlabel('Eixo X');
    ylabel('Eixo Y');
    title('Dados no espa�o dos componintes principais (PCA)');
    
    fprintf('Percentagem de vari�ncia dos dados no espa�o dos componentes \n');
    fprintf('Vari�ncia no eixo X: %f\n',var_x/sum(var_x));
    fprintf('Vari�ncia no eixo X: %f\n',var_y/sum(var_y));
end
    
    
    


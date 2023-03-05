function [R1, R2] = PageRank(name, d, eps)
	
    R1 = Iterative(name, d, eps);
    R2 = Algebraic(name,d);
    
    fid1 = fopen(name);
    N = fscanf(fid1,"%d", 1);
    
    % write in file R1 of R2
    fid = fopen([name,'.out'],'w');
    fprintf(fid,"%d\n",N);
    fprintf(fid,'%f\n', R1);
    fprintf(fid,'\n');
    fprintf(fid,'%f\n', R2);
    fprintf(fid,'\n');
    
    % Move to the second last position in the file
    i = 1;
    while i<=N+1
        fgetl(fid1);
        i = i+1;
    end

    val1 = fscanf(fid1,"%f", 1);
    val2 = fscanf(fid1,"%f", 1);
    sw = 0;
    pos = (1:N);

    % Position sorting algorithm (bubble-sort)
    while sw == 0
        sw = 1;
        for i = 1:N-1
            if R2(pos(i)) < R2(pos(i+1))
                aux=pos(i); 
                pos(i)=pos(i+1);
                pos(i+1)=aux;
                sw = 0; 
            end
        end
    end
    % membership degree determination
    memgrade = Membership(R2, val1, val2); 
    
    % Write the index and sorted elements to the file
    for i = 1:N
        fprintf(fid,"%d ",i);
        fprintf(fid,"%d ",poz(i));
        fprintf(fid,"%f",memgrade(poz(i)));
        fprintf(fid,"\n");
    end
    fclose('all');
end
